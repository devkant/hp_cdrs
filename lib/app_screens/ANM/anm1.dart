import "package:flutter/material.dart";

import 'anm2.dart';

void main() {
  runApp(MaterialApp(
    title: "ANM Form",
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
  var _bpl = ['No', 'Yes'];
  var _currentBPL = 'No';
  var _growthCurve = ['None', 'Green zone', 'Yellow zone', 'Orange zone'];
  var _currentGrowthCurve = 'None';
  var _pastIllness = ['No', 'Yes'];
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
  var _currentSelectedDistrict = 'Bilaspur';
  bool _bcg = false;
  bool _penta1 = false;
  bool _penta2 = false;
  bool _penta3 = false;
  bool _mr1 = false;
  bool _mrBooster = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController childNameController = TextEditingController();
  TextEditingController tehsilController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController illnessController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("A: Background Information")),
      body: Form(
        key: _formKey,
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
                  child: Row(
                    children: <Widget>[

                      Text(
                        "1. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: childNameController,
                          validator: (String value) {
                            final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                            if (!nameExp.hasMatch(value))
                              return 'Please enter only alphabetical values';
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20.0),
                              labelText: "Name of Child",
                              hintText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ), //Name

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "2. Age:  ",
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
                        "3. Sex:  ",
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
                        "4. District:  ",
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
                  child: Row(
                    children: <Widget>[

                      Text(
                        "5. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: tehsilController,
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
                      ),
                    ],
                  ),
                ), //Tehsil
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "6. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: addressController,
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
                      ),
                    ],
                  ),
                ), //Address

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "7. Order of Birth:  ",
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
                        "8. Category:  ",
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

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "9. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
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
                        items: _bpl.map((String value1) {
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
                    ),
                  ],
                ), //BPL

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "10. Immunization Status: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ), //Immunization Status
                CheckboxListTile(
                    value: _bcg,
                    title: Text("BCG"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _bcg = value;
                      });
                    }),
                CheckboxListTile(
                    value: _penta1,
                    title: Text("Penta 1"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _penta1 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _penta2,
                    title: Text("Penta 2"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _penta2 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _penta3,
                    title: Text("Penta 3"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _penta3 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _mr1,
                    title: Text("MR 1"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _mr1 = value;
                      });
                    }),
                CheckboxListTile(
                    value: _mrBooster,
                    title: Text("MR Booster"),
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _mrBooster = value;
                      });
                    }),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "11. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Flexible(
                        child: TextField(
                          controller: weightController,
                          decoration: InputDecoration(
                              labelText: "Weight",
                              hintText: "In Kgs(if recorded in the MCP Card)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ), //Weight

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "12. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
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
                      padding: EdgeInsets.only(top: 0.0),
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
                        "13. Any Past Illness: ",
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

                natureOfIllnessFun(), //Nature of Illness

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 4.0,
                      child: Text(
                        'Next Section',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Form2()));
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

  Widget natureOfIllnessFun() {
    if( _currentPastIllness == 'Yes') {
      return TextFormField(
        validator: (String val) {
          if (val.isEmpty) {
            return 'Please enter a valid input';
          }
        },
        controller: illnessController,
        decoration: InputDecoration(
            labelText: "If Yes",
            hintText: "nature of illness",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
            )
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      );
    }
    else {
      return Center(child: Text(""));
    }
  }
}
