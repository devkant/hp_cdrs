import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:hp_cdrs/app_screens/asha_worker/asha_page.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import '104previousForms.dart';


void  main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => AshaHomeScreen(),
      '/AshaForm': (context) => hpForm(),
    },
  ));
}

class AshaHomeScreen extends StatefulWidget {
  @override
  _AshaHomeScreenState createState() => _AshaHomeScreenState();
}

class _AshaHomeScreenState extends State<AshaHomeScreen> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  List <dynamic>_forms  = [];
  List<Child> entries = [];
  String jsonData;

  File jsonFile;
  Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  @override
  void initState() {
    print(jsonData);
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);


    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      print(dir.path);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => jsonData = jsonFile.readAsStringSync());
      jsonData  = jsonData.replaceAll('}{','}_{');
      List<String> jsonList  = jsonData.split('_');
      for(int i=0;i<jsonList.length;i++){
        var temp  = json.decode(jsonList[i]);
        print(temp);
        Child tempEntry = new Child(temp['name'],temp['district'],temp['block'],temp['address'],temp['phoneNumber']);
        var data  = {
          'name': tempEntry.name,
          'district' :  tempEntry.district,
          'block' : tempEntry.block,
          'address':  tempEntry.address,
          'phoneNumber':tempEntry.ashaName,
        };

        if(isOffline ){
          entries.add(tempEntry);
        }
        else{
          sendData('http://13.235.43.83/api/asha', data);
        }

        if(i==(jsonList.length-1) && !isOffline){
          clearFile();
        }
      }
      print(jsonList);
    });
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  void createFile(Child content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content),mode: FileMode.append);
  }

  void writeToFile(Child entry) {
    print("Writing to file!");
    if (fileExists) {
      print("File exists");
      jsonFile.writeAsStringSync(json.encode(entry),mode: FileMode.append);
    } else {
      print("File does not exist!");
      createFile(entry, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  void clearFile(){
    if(fileExists){
      jsonFile.writeAsStringSync('');
      entries.clear();
    }
  }

  Future<bool> onBackPress(){
    if(_scaffoldKey.currentState.isDrawerOpen == false) {
      _scaffoldKey.currentState.openDrawer();
      return Future.value(false);
    }
    else if(_scaffoldKey.currentState.isDrawerOpen == true){
      return Future.value(true);
    }
  }

  void showAlert(String value) {

    AlertDialog dialog = AlertDialog(
      content: Text(value, textAlign: TextAlign.justify,),
      actions: <Widget>[
        FlatButton(onPressed:(){ clearFile(); entries.clear(); Navigator.of(context).pop(); }, child: Text('Yes')),
        FlatButton(onPressed:(){Navigator.of(context).pop();}, child: Text('No')),
      ],
    );
    showDialog(barrierDismissible: false, context: context,
        builder: (BuildContext context){return dialog;}).then((_)=>setState((){}));
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title:  Text('104 Dashboard'),
        ),
        drawer: BasicDrawer(),
        body: Column(children: <Widget>[
          RaisedButton(
            child: Text('Show Previous Filled Forms'),
            textColor: Colors.white,
            color: Colors.orange,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(BuildContext  context)  =>  PreviousForm()));
            },
          ),
          RaisedButton(
            child: Text('Clear Saved Forms'),
            textColor: Colors.white,
            color: Colors.red,
            onPressed: (){
              showAlert('Are you sure?');
            },
          ),
          Flexible(
              child:   ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext  context,  int index)  {
                    return  Card(
                      child: ListTile(
                        title: Text("Name: "+entries[index].name),
                        leading: Icon(Icons.contacts),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('New Case'),
          tooltip: 'Add new Entry',
          onPressed: () {
            Navigator.push<Child>(
             context,
             MaterialPageRoute(
                 builder: (context) => hpForm(),
             ),
            ).then((newEntry){
                if(newEntry!=null){
                  setState(() {
                    entries.add(newEntry);
                    writeToFile(newEntry);
                  });
                }
              }

            );
          },
        ),

      ),
    );
  }

}