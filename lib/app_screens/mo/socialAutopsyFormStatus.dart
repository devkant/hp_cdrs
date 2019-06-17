import 'package:flutter/material.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/login.dart';

class SocialAutopsyFormStatus extends StatefulWidget {
  final User newEntry;
  SocialAutopsyFormStatus({Key key, @required this.newEntry}):super(key:key);
  @override
  State<StatefulWidget> createState() => _SocialAutopsyFormStatusState();
}

class _SocialAutopsyFormStatusState extends State<SocialAutopsyFormStatus> {
  final user = User();
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  List<dynamic> _forms = [];
  List entries = [];
  String jsonData;

  File jsonFile;
  Directory dir;
  String fileName = "socialAutopsy.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  void initState() {
    super.initState();

    if (widget.newEntry != null) {
      setState(() {
        entries.add(widget.newEntry);
        writeToFile(widget.newEntry);
      });
    }

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton
        .getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => jsonData = jsonFile.readAsStringSync());
      jsonData = jsonData.replaceAll('}{','}_{');
      List<String> jsonList  = jsonData.split('_');
      for(int i=0;i<jsonList.length;i++) {
        var temp = json.decode(jsonList[i]);
        print(temp);
        if (isOffline) {
          entries.add(temp);
        }
        else {
          sendData('', temp);
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

  void createFile(User content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content),mode: FileMode.append);
  }

  void writeToFile(User entry) {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add new Entry',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SocialAutopsyLogin(user:user),
            ),
          );


        },
      ),

    );
  }

}