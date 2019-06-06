import "package:flutter/material.dart";

import 'form2.dart';

void main() {
  runApp(MaterialApp(
    title: "Nothing",
    home: ANMWorker(),
  ));
}

class ANMWorker extends StatefulWidget {
  @override
  _ANMWorkerState createState() => _ANMWorkerState();
}

class _ANMWorkerState extends State<ANMWorker> {
  var _age = [
    '0-28 days',
    '1-12 months',
    '1-2 years',
    '2-3 years',
    '3-4 years',
    '4-5 years'
  ];
  var _currentItemSelected = '0-28 days';
  var _sex = ['Male', 'Female'];
  var _currentsex = 'Male';
  var _orderOfBirth = ['1', '2', '3', '4', '5 or more'];
  var _currentOrderOfBirth = '1';
  var _category = ['General', 'SC', 'ST', 'OBC'];
  var _currentCategory = 'General';
  var _BPL = ['Yes', 'No'];
  var _currentBPL = 'No';
  var _growthCurve = ['Green zone', 'Yellow zone', 'Orange zone', 'None'];
  var _currentGrowthCurve = 'None';
  var _pastIllness = ['Yes', 'No'];
  var _currentPastIllness = 'No';
  var _districtName = [
    'Bilaspur',
    'Chamba',
    'Hamirpur',
    'Kangra',
    'Kinnaur',
    'Kullu',
    'Lahaul and Spiti',
    'Mandi',
    'Shimla',
    'Sirmaur',
    'Solan',
    'Una',
  ];
  var _currentSelectedDistrict = 'Hamirpur';
  bool _constValue1 = false;
  bool _constValue2 = false;
  bool _constValue3 = false;
  bool _constValue4 = false;
  bool _constValue5 = false;
  bool _constValue6 = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Section A: Background Information")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Section 1: Background Information",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                */

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (String value) {
                      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                      if (!nameExp.hasMatch(value))
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: "Name of Child",
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    keyboardType: TextInputType.text,
                  ),
                ), //Name

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Age:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _age.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentItemSelected = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Age

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Sex:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _sex.map((String value2) {
                          return DropdownMenuItem<String>(
                            value: value2,
                            child: Text(value2),
                          );
                        }).toList(),
                        value: _currentsex,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentsex = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Sex

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "District:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _districtName.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentSelectedDistrict,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentSelectedDistrict = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //districtAddress
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Block/Tehsil",
                        hintText: "Block/Tehsil",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    keyboardType: TextInputType.text,
                  ),
                ), //Tehsil
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ), //Address

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Order of Birth:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _orderOfBirth.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentOrderOfBirth,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentOrderOfBirth = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Order of Birth

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Category:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _category.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentCategory,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentCategory = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Category

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Does the family have Below Poverty Line(BPL) Card:",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _BPL.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentBPL,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentBPL = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //BPL

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Immunization Status: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ), //Immunization Status
                CheckboxListTile(
                    value: _constValue1,
                    title: Text("BCG"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue1 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _constValue2,
                    title: Text("Penta 1"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue2 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _constValue3,
                    title: Text("Penta 2"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue3 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _constValue4,
                    title: Text("Penta 3"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue4 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _constValue5,
                    title: Text("MR 1"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue5 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _constValue6,
                    title: Text("MR Booster"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _constValue6 = value;
                      });
                    }),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Weight",
                        hintText: "In Kgs(if recorded in the MCP Card)",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    keyboardType: TextInputType.number,
                  ),
                ), //Weight

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Growth Curve (fill for <3 years; check MCP Card):  ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _growthCurve.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentGrowthCurve,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentGrowthCurve = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Growth Curve

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Any Past Illness: ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: _pastIllness.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: _currentPastIllness,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentPastIllness = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Past Illness

                TextField(
                  decoration: InputDecoration(
                      labelText: "If Yes",
                      hintText: "nature of illness",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ), //Nature of Illness

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 4.0,
                      child: Text(
                        'Next Section',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (!formKey.currentState.validate()) { }
                        else {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => form2()));
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
