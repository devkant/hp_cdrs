import 'package:flutter/material.dart';
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/asha_worker/asha_home.dart';




class hpForm extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _hpFormState();
  }
}

class _hpFormState extends State<hpForm> {
  var _formKey = GlobalKey<FormState>();
  var _districtName = ['Bilaspur', 'Chamba', 'Hamirpur', 'Kangra', 'Kinnaur',
    'Kullu', 'Lahaul & Spiti', 'Mandi', 'Shimla', 'Sirmaur', 'Solan', 'Una'];
  var _currentSelectedDistrict = '';



  @override
  void initState() {
    super.initState();
    _currentSelectedDistrict = _districtName[0];
  }

  //testing code


  TextEditingController childNameController = TextEditingController();
  TextEditingController ashaBlockController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phnNumberController = TextEditingController();

  Future<String> get _localPath async {
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
  }



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
                  child: TextFormField(
                    controller: ashaBlockController,
                    validator: (String value) {
                      if (value.length < 3)
                        return 'Block name should contain more than two letters';
                    },
                    decoration: InputDecoration(
                        labelText: 'Block/Tehsil',
                        hintText: 'Block/Tehsil',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
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
                    onPressed: () {
                        if (_formKey.currentState.validate()){
                          Child newEntry  = new Child(
                              childNameController.text.toString(),
                              this._currentSelectedDistrict.toString(),
                              ashaBlockController.text.toString(),
                              addressController.text.toString(),
                              phnNumberController.text.toString(),
                          );
                          String  jsonEntry = json.encode(newEntry);
                          print(jsonEntry);
                          
                          writeToFile(jsonEntry);

                          Navigator.pop(context);

                        }

                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  void _onDropDownDistrictSelected(String newSelectedDistrict) {
    setState(() {
      this._currentSelectedDistrict = newSelectedDistrict;
    });
  }
}
