import 'package:flutter/material.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/verbal_autopsy/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/verbal_autopsy/verbal_autopsy_form.dart';

class neoFormsStatus extends StatefulWidget {
  final user newEntry;
  neoFormsStatus({Key key, @required this.newEntry}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _neoFormsStatusState();
  }
}

class _neoFormsStatusState extends State<neoFormsStatus> {
  final User  = user();
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  List <dynamic>_forms  = [];
  List entries = [];
  String jsonData;

  File jsonFile;
  Directory dir;
  String fileName = "neonate.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  void  initState(){
    super.initState();

    if(widget.newEntry!=null){
      setState(() {
        entries.add(widget.newEntry);
        writeToFile(widget.newEntry);
      });
    }

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);

    getApplicationDocumentsDirectory().then((Directory directory){
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => jsonData = jsonFile.readAsStringSync());
      jsonData  = jsonData.replaceAll('}{','}_{');
      List<String> jsonList  = jsonData.split('_');
      for(int i=0;i<jsonList.length;i++)  {
        var temp  = json.decode(jsonList[i]);
        print(temp);
        if(isOffline ){
          entries.add(temp);
        }
        else{
          apiRequest('http://13.126.72.137/api/neonate',temp);
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

  void createFile(user content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content),mode: FileMode.append);
  }

  void writeToFile(user entry) {
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
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:  Text('Forms Pending'),
      ),
      drawer: BasicDrawer(),
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        tooltip: 'Add new Entry',
        label: Text("New Form"),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => verbalAutopsyForm(verbal_Autopsy_Obj:User),
            ),
          );


        },
      ),

    );
  }
}
