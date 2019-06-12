import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:hp_cdrs/app_screens/asha_worker/asha_page.dart';


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
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => jsonData = jsonFile.readAsStringSync());
      jsonData  = jsonData.replaceAll('}{','}_{');
      print(jsonData);
      List<String> jsonList  = jsonData.split('_');
      for(int i=0;i<jsonList.length;i++){
        var temp  = json.decode(jsonList[i]);
          Child tempEntry = new Child(temp['name'],temp['district'],temp['block'],temp['address'],temp['phoneNumber']);
          entries.add(tempEntry);

        print(temp);
      }
      print(jsonList);
    });
  }

  void createFile(Child content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
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
      jsonFile.writeAsStringSync("");
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

    );
  }

}