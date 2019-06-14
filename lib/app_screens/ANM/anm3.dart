import 'package:flutter/material.dart';

import 'anm4.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "Form3",
    home: Form3(),
  ));
}
*/

class Form3 extends StatefulWidget {
  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {

  var _treatment = ['Yes', 'No'];
  var _currentTreatment = 'Yes';
  var _phf = ['PHC', 'CHC', 'DH', 'SDH/Taluq Hospital', 'None'];
  var _currentphf = 'None';
  bool _privateHospital = false;
  bool _allopathicPractitioner = false;
  bool _ayushPractitioner = false;
  bool _unqualifiedProvider = false;
  bool _traditionalHealer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C: Details of treatment"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[

              /*
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Details of treatment",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                ),
              ),
              */

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[

                    Text(
                      "1. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child: Text(
                        "Whether treatment for illness was provided:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),

                    DropdownButton<String>(
                      items: _treatment.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),

                      value: _currentTreatment,

                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentTreatment = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ),

              treatmentForIllnessFun(),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    /*
                    RaisedButton(
                      color: Colors.blue,
                      elevation: 4.0,
                      child: Text(
                        'Previous page',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => form2()));
                      },
                    ),
                    */
                    RaisedButton(
                      color: Colors.blue,
                      elevation: 4.0,
                      splashColor: Colors.greenAccent,
                      child: Text(
                        'Next Section',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Form4()));
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget treatmentForIllnessFun() {
    if( _currentTreatment == "Yes") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[

                /*
                Text(
                  "15. ",
                  style: TextStyle(fontSize: 18.0),
                ),
                */

                Expanded(
                  child: Text(
                    "If yes, then where was the child treated: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[

                Expanded(
                  child: Text(
                    "Public Health Facility:  ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),

                DropdownButton<String> (
                  items: _phf.map((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(value1),
                    );
                  }).toList(),

                  value: _currentphf,

                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentphf = newValueSelected;
                    });
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: _privateHospital,
              title: Text("Private Hospital/Nursing Home"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _privateHospital = value;
                });
              },
            ),
          ), //Private Hosp.

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: _allopathicPractitioner,
              title: Text("Qualified allopathic private practitioner"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _allopathicPractitioner = value;
                });
              },
            ),
          ), //QAPP

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: _ayushPractitioner,
              title: Text("AYUSH Practitioner"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _ayushPractitioner = value;
                });
              },
            ),
          ),  //AYUSH

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: _unqualifiedProvider,
              title: Text("Unqualified Provider(quack, informal provider"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _unqualifiedProvider = value;
                });
              },
            ),
          ), //Unqualified Provider

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: _traditionalHealer,
              title: Text("Traditional Healer"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _traditionalHealer = value;
                });
              },
            ),
          ), //Traditional Healer

        ],
      );
    }
    else {
      return Text("");
    }
  }
}
