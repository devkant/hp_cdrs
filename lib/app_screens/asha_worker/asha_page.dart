import 'package:flutter/material.dart';
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/asha_worker/asha_home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';



class hpForm extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _hpFormState();
  }
}

class _hpFormState extends State<hpForm> {

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  var _formKey = GlobalKey<FormState>();
  var _districtName = ['BILASPUR', 'CHAMBA', 'HAMIRPUR', 'KANGRA', 'KINNAUR',
    'KULLU', 'LAHAUL AND SPITI', 'MANDI', 'SHIMLA', 'SIRMAUR', 'SOLAN', 'UNA'];
  var _currentSelectedDistrict = '';

  @override
  void initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);

    _currentSelectedDistrict = _districtName[0];
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  //testing code


  TextEditingController childNameController = TextEditingController();
  TextEditingController ashaBlockController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phnNumberController = TextEditingController();

  /*Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/asha.txt');
  }
  Future<File> writeToFile(String json) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$json',mode: FileMode.append);
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASHA Form'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: childNameController,
                    validator: (String value) {
                      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                      if (!nameExp.hasMatch(value))
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: 'Name of the child',
                        hintText: 'Name of the child',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left:20.0),
                      child:Text('District:', style:
                      TextStyle(fontSize: 18.0),)
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<String>(
                          items: _districtName.map((String value1) {
                            return DropdownMenuItem<String>(
                              value: value1,
                              child: Text(value1),
                            );
                          }).toList(),
                          value: _currentSelectedDistrict,
                          onChanged: (String newSelectedDistrict) {
                            _onDropDownDistrictSelected(newSelectedDistrict);
                          }))
                ]),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: block(),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: addressController,
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The address should contain more than two letters';
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: phnNumberController,
                    validator: (String value) {
                      if (value.length != 10)
                        return 'Please input a valid phone number';
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        Child newEntry  = new Child(
                          childNameController.text.toString(),
                          this._currentSelectedDistrict.toString(),
                          ashaBlockController.text.toString(),
                          addressController.text.toString(),
                          phnNumberController.text.toString(),
                        );
                        var data  = {
                          'name': newEntry.name,
                          'district' :  newEntry.district,
                          'block' : newEntry.block,
                          'address':  newEntry.address,
                          'phoneNumber':newEntry.phoneNumber,
                        };
                        var status  = await sendData('http://13.126.72.137/api/test',data);
                        if(!isOffline && status){
                          Navigator.of(context).pop(null);
                        }
                        else{
                          Navigator.of(context).pop(newEntry);
                        }

                      }

                    },
                  ),
                )
              ],
            ),
          )),
    );

  }

  Widget  block() {
    if(_currentSelectedDistrict ==  'HAMIRPUR'){
      return  DropdownButton<String>(
          items: _districtName.map((String value1) {
            return DropdownMenuItem<String>(
              value: value1,
              child: Text(value1),
            );
          }).toList(),
          value: _currentSelectedDistrict,
          onChanged: (String newSelectedDistrict) {
            _onDropDownDistrictSelected(newSelectedDistrict);
          });
    }
  }


  void _onDropDownDistrictSelected(String newSelectedDistrict) {
    setState(() {
      this._currentSelectedDistrict = newSelectedDistrict;
    });
  }
}