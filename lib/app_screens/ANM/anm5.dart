import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/ANM/user.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'package:hp_cdrs/app_screens/ANM/anmstatus.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "ANM Form 5",
    home: Form5(),
  ));
}
*/

class Form5 extends StatefulWidget {

  //user data
  final User user;
  Form5({Key key,this.user}):super(key:key);

  @override
  _Form5State createState() => _Form5State();
}

class _Form5State extends State<Form5> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  bool submission = false;

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "1",

        "category_name": "Delay at home"},

      {"category_id": "2",

        "category_name": "Delay in transportation"},

      {"category_id": "3",

        "category_name": "Delay at facility level"},

    ],
    "responseTotalResult":
    3 // Total result is 3 here because we have 3 categories in responseBody.
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("E: End details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                    onSaved: (String value) { widget.user.causeOfDeath = value; },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid input';
                      }
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Please mention the cause",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                    ),
                  ),
                ), //Respondent Cause

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
                  value: widget.user.delay.contains(_categories['responseBody'][0]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][0]['category_name']);
                    debugPrint('${widget.user.delay}');
                  },
                  title: Text(_categories['responseBody'][0]['category_name']),
                ), //Home

                CheckboxListTile(
                  value: widget.user.delay.contains(_categories['responseBody'][1]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][1]['category_name']);
                    debugPrint('${widget.user.delay}');
                  },
                  title: Text(_categories['responseBody'][1]['category_name']),
                ), //Transportation

                CheckboxListTile(
                  value: widget.user.delay.contains(_categories['responseBody'][2]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][2]['category_name']);
                    debugPrint('${widget.user.delay}');
                  },
                  title: Text(_categories['responseBody'][2]['category_name']),
                ), //Facility Level

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
                    onSaved: (String value) { widget.user.advice = value;},
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Suggestions please",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                    ),
                  ),
                ), //Suggestions

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CheckboxListTile(
                    value: submission,
                    title: Text(
                      "I state that all the details filled above are best and true to my knowledge.",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        submission = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    elevation: 4.0,
                    splashColor: Colors.greenAccent,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() async {
                        if (_formKey.currentState.validate()) {
                          if(submission == true) {
                            final form = _formKey.currentState;
                            form.save();
                            var data  = createMap(widget.user);
                            print(data);
                            var status  = await apiRequest('http://13.126.72.137/api/anmform',data);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Alert"),
                                    content: Text("The form has been submitted"),
                                  );
                                }
                            );
                            if(!isOffline && status){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ANMStatus(
                                        newEntry: null,)));
                            }
                            else{
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ANMStatus(
                                        newEntry: widget.user,)));
                            }
                          }
                          else {
                            _showSnackBar("Please check the checkbox to proceed");
                          }
                        }
                      });
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.user.delay.add(category_name);
      });
    } else {
      setState(() {
        widget.user.delay.remove(category_name);
      });
    }
  }

  Map createMap(User child) {
    var data = {

      'applicationNumber': '1560779046894',
      // User reference

      //Background Information
      'name': child.name,
      'age.years': child.age.years,
      'age.months': child.age.months,
      'age.days': child.age.days,
      'sex': child.gender,
      'address.pincode': child.address.pincode,
      'address.district': child.address.district,
      'address.block': child.address.block,
      'address.area': child.address.area,
      'orderOfBirth': child.orderOfBirth,
      'caste' : child.caste,
      'immunization': child.immunization,
      'bplCard': child.bplCard,
      'weight': child.weight,
      'growthCurve': child.growthCurve,
      'pastIllness': child.pastIllness,
      'natureOfIllness': child.natureOfIllness,

      // Symptoms during Illness
      'inabilityToFeed': child.inabilityToFeed,
      'fever': child.fever,
      'looseStools': child.looseStools,
      'vomiting': child.vomiting,
      'fastBreathing': child.fastBreathing,
      'convulsions': child.convulsions,
      'appearanceOfSkinRashes': child.appearanceOfSkinRashes,
      'injury': child.injury,
      'otherSymptom': child.otherSymptoms,

      // Details of treatment
      'treatmentTaken': child.treatmentTaken,
      'treatmentLocation': child.treatmentLocation,

      'Probable': child.probable,
      'disease': child.disease,

      // According to the respondent, cause of death
      'causeOfDeath': child.causeOfDeath,

      // Occurence of delay
      'delay': child.delay,

      // Advice according to analysis
      'advice': child.advice,

    };
    return data;
  }
}
