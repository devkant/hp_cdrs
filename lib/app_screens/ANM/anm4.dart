import 'package:flutter/material.dart';

import 'anm5.dart';

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

  bool _diarrhoea = false;
  bool _pneumonia = false;
  bool _malaria = false;
  bool _measles = false;
  bool _septicemia = false;
  bool _meningitis = false;
  bool _injury = false;
  bool _noIdentifiableCause = false;
  bool _anyOtherCause = false;

  TextEditingController otherCause = TextEditingController();

  Widget noCause() {
    if( _anyOtherCause == false && _diarrhoea == false && _pneumonia == false && _malaria == false && _measles == false && _septicemia == false && _meningitis == false && _injury == false) {
      return Column(
        children: <Widget>[

          Row(
            children: <Widget>[

              Text(
                "9. ",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: _noIdentifiableCause,
                  title: Text("No identifiable cause"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _noIdentifiableCause = value;
                    });
                  },
                ),
              ),
            ],
          ), //No identifiable cause

        ],
      );
    }
    else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("D: Probable causes of death"),
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

                Row(
                  children: <Widget>[

                    Text(
                      "1. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _diarrhoea,
                        title: Text("Diarrhoea"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _diarrhoea = value;
                          });
                        },
                      ),
                    ),
                  ],
                ), //Diarrhoea

                Row(
                  children: <Widget>[

                    Text(
                      "2. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _pneumonia,
                        title: Text("Pneumonia"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _pneumonia = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),  //Pneumonia

                Row(
                  children: <Widget>[

                    Text(
                      "3. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child: CheckboxListTile(
                        value: _malaria,
                        title: Text("Malaria"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _malaria = value;
                          });
                        },
                      ),
                    ),
                  ],
                ), //Malaria

                Row(
                  children: <Widget>[

                    Text(
                      "4. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _measles,
                        title: Text("Measles"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _measles = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),  //Measles

                Row(
                  children: <Widget>[

                    Text(
                      "5. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _septicemia,
                        title: Text("Septicemia (Infection)"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _septicemia = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),  //Septicemia (Infection)

                Row(
                  children: <Widget>[

                    Text(
                      "6. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _meningitis,
                        title: Text("Meningitis"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _meningitis = value;
                          });
                        },
                      ),
                    ),
                  ],
                ), //Meningitis

                Row(
                  children: <Widget>[

                    Text(
                      "7. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child:CheckboxListTile(
                        value: _injury,
                        title: Text("Injury"),
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            _injury = value;
                          });
                        },
                      ),
                    ),
                  ],
                ), //Injury

                Row(
                  children: <Widget>[

                    Text(
                      "8. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child: TextField(
                        controller: otherCause,
                        decoration: InputDecoration(
                            labelText: "Any other Cause",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged:(text) { _anyOtherCause = true; } ,
                      ),
                    ),

                  ],
                ), //Any other cause

                noCause(),

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
                              builder: (BuildContext context) => Form3()));
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
