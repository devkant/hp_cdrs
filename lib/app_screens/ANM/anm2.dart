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
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Duration of symptoms:",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ), //Duration of Symptom

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
                        onSaved: (String value) { widget.user.inabilityToFeed = int.parse(value);},
                        //controller: inabilityToFeedController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Inability to feed",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Inability to feed

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "2. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.fever = int.parse(value);},
                        //controller: feverController,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Fever",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Fever

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "3. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.looseStools = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Loose Stools",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Loose Stools

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "4. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.vomiting = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Vomiting",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Vomiting

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
                        onSaved: (String value) { widget.user.fastBreathing = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Fast Breathing",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Fast Breathing

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
                        onSaved: (String value) { widget.user.convulsions = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Convulsions",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Convulsions

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "7. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.appearanceOfSkinRashes = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Appearance of Skin rashes",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Appearance of Skin rashes

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "8. ",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (String value) { widget.user.injury = int.parse(value);},
                        validator: (String val) {
                          if (val.isEmpty) {
                            return 'Please enter a valid input';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Injury(like fractures, wounds)",
                          hintText: "No of days",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
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