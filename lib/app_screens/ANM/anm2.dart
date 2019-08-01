import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/ANM/user.dart';

import 'anm3.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "Form 2",
    home: Form2(),
  ));
}
*/

class Form2 extends StatefulWidget {

  //user data
  final User user;
  Form2({Key key,this.user}):super(key:key);

  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {

  //formkey
  final _formKey = GlobalKey<FormState>();

  var dropdown = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B: Symptoms during illness"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(bottom: 10.0),
//                child: Text(
//                  "Symptoms:",
//                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
//                ),
//              ), //Duration of Symptom

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "1. Inability to feed: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.inabilityToFeed,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.inabilityToFeed = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Inability to feed

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "2. Fever: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.fever,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.fever = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Fever

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "3. Loose Stools: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.looseStools,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.looseStools = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Loose Stools

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "4. Vomiting: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.vomiting,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.vomiting = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Vomiting

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "5. Fast Breathing: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.fastBreathing,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.fastBreathing = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Fast Breathing

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "6. Convulsions: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.convulsions,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.convulsions = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Convulsions

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "7. Appearance of Skin rashes: ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.appearanceOfSkinRashes,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.appearanceOfSkinRashes = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Appearance of Skin rashes

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "8. Injury(like fractures,wounds): ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    DropdownButton<String>(
                      items: dropdown.map((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      value: widget.user.injury,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.user.injury = newValueSelected;
                        });
                      },
                    ),
                  ],
                ),
              ), //Injury(like fractures,wounds)

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "9. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.otherSymptoms = value;},
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            labelText: "Any other Symptom",
                            hintText: "If any",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ), //anyOtherSymptom

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  color: Colors.blue,
                  elevation: 4.0,
                  splashColor: Colors.greenAccent,
                  child: Text(
                    'Next Section',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final form = _formKey.currentState;
                      form.save();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Form3(user: widget.user)));
                    }
                  },
                ),
              ), //Next Section
            ],
          ),
        ),
      ),
    );
  }
}