import 'package:flutter/material.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/verbal_autopsy/user.dart';

class FormsStatus extends StatefulWidget {
  @override
  _FormsStatusState createState() => _FormsStatusState();
}

class _FormsStatusState extends State<FormsStatus> {

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

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);


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
        title: Text('Forms Pending'),
      ),
    );
  }
}
