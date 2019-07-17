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
import 'package:shared_preferences/shared_preferences.dart';


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

  String _appliNumber;

  Future<String> getAppliNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    _appliNumber = pref.getString('newApplication');
    if (_appliNumber == '0') {
      _appliNumber = 'No';
    }

    return _appliNumber;
  }

  void initState() {
    super.initState();
    getAppliNumber();

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(() => jsonData = jsonFile.readAsStringSync());
      if (jsonData != null) {
        jsonData = jsonData.replaceAll('}{', '}_{');
        jsonList = jsonData.split('_');
      }
      for (int i = 0; i < jsonList.length; i++) {
        var temp = json.decode(jsonList[i]);
        entries.add(temp);
        sendData('http://13.235.43.83/api/social', temp).then((status) {
          if (status == true) {
            if (i == (jsonList.length - 1) && !isOffline) {
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
    file.writeAsStringSync(json.encode(content), mode: FileMode.append);
  }

  void writeToFile(User entry) {
    print("Writing to file!");
    if (fileExists) {
      print("File exists");
      jsonFile.writeAsStringSync(json.encode(entry), mode: FileMode.append);
    } else {
      print("File does not exist!");
      createFile(entry, dir, fileName);
    }
    fileContent = json.decode(jsonFile.readAsStringSync());
  }

  void clearFile() {
    if (fileExists) {
      jsonFile.writeAsStringSync('');
    }
  }

//  Future<bool> onBackPress(){
//    Navigator.of(context).push(MaterialPageRoute(
//        builder: (BuildContext context) =>
//            Dashboard()));
//  }

  void showAlert(String value) {
    AlertDialog dialog = AlertDialog(
      content: Text(
        value,
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              clearFile();
              entries.clear();
              Navigator.of(context).pop();
            },
            child: Text('Yes')),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAppliNumber(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          String app;
          if (snapshot.hasData && snapshot.data != null) {
            app = snapshot.data;
          } else {
            app = 'No Application';
          }
          return Scaffold(
              appBar: AppBar(
                title: Text('Saved Forms'),
              ),
              drawer: BasicDrawer(),
              body: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Text(' New Application Assigned:',
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                  Text('$app',
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    child: Text('Clear Saved Forms'),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      showAlert('Are you sure?');
                    },
                  ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text("Name: " +
                                  entries[index]['applicationNumber']),
                              leading: Icon(Icons.contacts),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                icon: Icon(Icons.add),
                tooltip: 'Add new Entry',
                label: Text("Fill a New Form"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SocialAutopsyLogin(user: user, appliNumber:_appliNumber),
                    ),
                  );
                },
              ));
        });
  }
}
