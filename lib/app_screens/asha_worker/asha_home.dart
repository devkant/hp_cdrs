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

  List<String>  _forms  = <String>[];


  void initState(){
    super.initState();
    getFormsFromFile();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/asha.txt');
  }

  void  getFormsFromFile() async{
    final file = await _localFile;


    String  jsonForms = await file.readAsString();
    _forms  = List.generate(_forms.length, (i)  =>  jsonForms);
    jsonForms =  jsonForms.replaceAll('}{', '}_{');
    List<String>  temp  = jsonForms.split("_");
    print(temp);

    for(int i=0;i<temp.length;i++) {
      _forms.add(temp[i]);
    }
    final jsonResponse  = json.decode(_forms[0]);
    print(jsonResponse);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Icon(Icons.home),
      ),
      drawer: BasicDrawer(),
      body: ListView(
        children: _forms.map((form) =>  Text(form)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add new Entry',
        onPressed: () {
          Navigator.of(context).pushNamed("/AshaForm");
        },
      ),


    );
  }

}