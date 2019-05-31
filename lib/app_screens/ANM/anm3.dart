import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Form3",
    home: Form3(),
  ));
}

class Form3 extends StatefulWidget {
  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {

  var _treatment = ['Yes', 'No'];
  var _currentTreatment = 'Yes';
  var _phf = ['PHC', 'CHC', 'DH', 'SDH/Taluq Hospital', 'None'];
  var _currentphf = 'None';
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANM Form3"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Details of treatment",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: Text(
                        "Whether treatment for illness was taken:  ",
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

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "If yes, where was the child treated: ",
                  style: TextStyle(fontSize: 18.0),
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
                  value: _isChecked1,
                  title: Text("Private Hospital/Nursing Home"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked1 = value;
                    });
                  },
                ),
              ), //Private Hosp.

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CheckboxListTile(
                  value: _isChecked2,
                  title: Text("Qualified allopathic private practitioner"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked2 = value;
                    });
                  },
                ),
              ), //QAPP

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CheckboxListTile(
                  value: _isChecked3,
                  title: Text("AYUSH Practitioner"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked3 = value;
                    });
                  },
                ),
              ),  //AYUSH

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CheckboxListTile(
                  value: _isChecked4,
                  title: Text("Unqualified Provider(quack, informal provider"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked4 = value;
                    });
                  },
                ),
              ), //Unqualified Provider

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CheckboxListTile(
                  value: _isChecked5,
                  title: Text("Traditional Healer"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked5 = value;
                    });
                  },
                ),
              ), //Traditional Healer

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    RaisedButton(
                      color: Colors.blue,
                      elevation: 4.0,
                      child: Text(
                        'Previous page',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: null,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      elevation: 4.0,
                      child: Text(
                        'Next Page',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: null,
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
}
