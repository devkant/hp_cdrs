import 'package:flutter/material.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "ANM Form 5",
    home: Form5(),
  ));
}
*/

class Form5 extends StatefulWidget {
  @override
  _Form5State createState() => _Form5State();
}

class _Form5State extends State<Form5> {

  var _delayHome = false;
  var _delayTransportation = false;
  var _delayFacility = false;
  var _submission = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController respondentCause = TextEditingController();
  TextEditingController suggestions = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E: End details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[

                Row(
                  children: <Widget>[

                    Text(
                      "16. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child: Text(
                        "According to the respondent (parent, close family member), what was the cause of death?",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                    controller: respondentCause,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Please mention the cause",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "17. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: Text(
                          "At what level do you think the delay occured?",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),

                CheckboxListTile(
                  value: _delayHome,
                  title: Text("Delay at home"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _delayHome = value;
                    });
                  },
                ), //Home

                CheckboxListTile(
                  value: _delayTransportation,
                  title: Text("Delay in transportation"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _delayTransportation = value;
                    });
                  },
                ), //Transportation

                CheckboxListTile(
                  value: _delayFacility,
                  title: Text("Dealy at facility level"),
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      _delayFacility = value;
                    });
                  },
                ), //Facility level

                Row(
                  children: <Widget>[
                    Text(
                      "18. ",
                      style: TextStyle(fontSize: 18.0),
                    ),

                    Expanded(
                      child: Text(
                        "Based on your analysis of the situation in which the death took place, what according to you could have been done to avert this death?",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: suggestions,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Suggestions please",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CheckboxListTile(
                    value: _submission,
                    title: Text(
                      "I state that all the details filled above are best and true to my knowledge.",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        _submission = value;
                      });
                    },
                  ),
                ),

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
                              builder: (BuildContext context) => Form4()));
                        },
                      ),
                      */
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 4.0,
                        splashColor: Colors.greenAccent,
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()  && _submission == true) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Alert"),
                                    content: Text("The form has been submitted"),
                                  );
                                }
                            );
                          }
                          else {

                          }
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
