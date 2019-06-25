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

import 'dashboard.dart';

class SocialAutopsyFormStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SocialAutopsyFormStatusState();
}

class _SocialAutopsyFormStatusState extends State<SocialAutopsyFormStatus> {
  final user = User();
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  List<dynamic> _forms = [];
  List jsonList = [];
  List entries = [];
  String jsonData;

  File jsonFile;
  Directory dir;
  String fileName = "socialAutopsy.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  void initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton
        .getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => jsonData = jsonFile.readAsStringSync());
      if(jsonData!=null) {
        jsonData = jsonData.replaceAll('}{', '}_{');
        jsonList = jsonData.split('_');
      }
      for(int i=0;i<jsonList.length;i++) {
        var temp = json.decode(jsonList[i]);
        entries.add(temp);
        sendData('http://13.126.72.137/api/social',temp).then((status) {
          if (status == true) {
            if(i==(jsonList.length-1) && !isOffline){
              clearFile();
            }
          }
        });
      }
    });
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  void createFile(User content, Directory dir, String fileName) {
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
    fileContent = json.decode(jsonFile.readAsStringSync());
  }

  void clearFile(){
    if(fileExists){
      jsonFile.writeAsStringSync('');
    }
  }

//  Future<bool> onBackPress(){
//    Navigator.of(context).push(MaterialPageRoute(
//        builder: (BuildContext context) =>
//            Dashboard()));
//  }

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        appBar: AppBar(
          title:  Text('Saved Forms'),
        ),
        drawer: BasicDrawer(),
        body: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext  context,  int index)  {
              return  Card(
                child: ListTile(
                  title: Text(entries[index]['applicationNumber']),
                  leading: Icon(Icons.contacts),
                ),
              );
            }
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          tooltip: 'Add new Entry',
          label: Text("Fill a New Form"),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SocialAutopsyLogin(user:user),
              ),
            );


          },
    )
    );
  }

}