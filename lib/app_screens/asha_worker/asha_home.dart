import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class AshaHomeScreen extends StatefulWidget {
  @override
  _AshaHomeScreenState createState() => _AshaHomeScreenState();
}

class _AshaHomeScreenState extends State<AshaHomeScreen> {
  Map formsMap;
  List<Widget>  formsArray  = [];

  void initstate(){
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


    String  forms = await file.readAsString();
    formsMap  = json.decode(forms);
    print('forms'+formsMap.length.toString());

    if(formsMap.isNotEmpty){
      print("there are form in file");
      for(var i=0;i<formsMap.length;i++)  {

      }
    }
    else{
      print("there are no form in file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Icon(Icons.home),
      ),
      drawer: BasicDrawer(),
      body: ListView(
          children: <Widget>[
            ListTile(
              title: foe,
            ),

          ],
      ),

    );
  }

}