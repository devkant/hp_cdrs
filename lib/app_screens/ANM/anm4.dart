import 'package:flutter/material.dart';

import 'form3.dart';
import 'form5.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "ANM Form 4",
    home: Form4(),
  ));
}
*/

class Form4 extends StatefulWidget {
  @override
  _Form4State createState() => _Form4State();
}

class _Form4State extends State<Form4> {

  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  bool _isChecked8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Probable cause of death"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[

                /*
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Probable cause of death",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  ),
                ),
                */

                CheckboxListTile(
                  value: _isChecked1,
                  title: Text("Diarrhoea"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked1 = value;
                    });
                  },
                ), //Diarrhoea

                CheckboxListTile(
                  value: _isChecked2,
                  title: Text("Pneumonia"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked2 = value;
                    });
                  },
                ), //Pneumonia

                CheckboxListTile(
                  value: _isChecked3,
                  title: Text("Malaria"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked3 = value;
                    });
                  },
                ), //Malaria

                CheckboxListTile(
                  value: _isChecked4,
                  title: Text("Measles"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked4 = value;
                    });
                  },
                ), //Measles

                CheckboxListTile(
                  value: _isChecked5,
                  title: Text("Septicemia (Infection)"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked5 = value;
                    });
                  },
                ), //Septicemia (Infection)

                CheckboxListTile(
                  value: _isChecked6,
                  title: Text("Meningitis"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked6 = value;
                    });
                  },
                ), //Meningitis

                CheckboxListTile(
                  value: _isChecked7,
                  title: Text("Injury"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked7 = value;
                    });
                  },
                ), //Injury

                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Any other Cause",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      )
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ), //Any other cause

                CheckboxListTile(
                  value: _isChecked8,
                  title: Text("No identifiable cause"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked8 = value;
                    });
                  },
                ), //No identifiable cause

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
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Form3()));
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 4.0,
                        child: Text(
                          'Next Section',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Form5()));
                        },
                      ),
                    ],
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
