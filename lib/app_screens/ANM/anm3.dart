import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/ANM/user.dart';

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

  //user data
  final User user;
  Form3({Key key,this.user}):super(key:key);

  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var dropdownTreatment = ['Yes', 'No'];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [

      {"category_id": "1",

        "category_name": "PHC"},

      {"category_id": "2",

        "category_name": "CHC"},

      {"category_id": "3",

        "category_name": "DH"},

      {"category_id": "4",

        "category_name": "SDH/ Taluq Hospital"},

      {"category_id": "5",

        "category_name": "Private Hospital/Nursing Home"},

      {"category_id": "6",

        "category_name": "Qualified allopathic private practioner"},

      {"category_id": "7",

        "category_name": "AYUSH Practioner"},

      {"category_id": "8",

        "category_name": "Unqualified Provider(quack, informalprovider)"},

      {"category_id": "9",

        "category_name": "Traditional Healer"},

      {"category_id": "10",

        "category_name": "Home"},

    ],
    "responseTotalResult":
    10 // Total result is 3 here because we have 3 categories in responseBody.
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("C: Details of treatment"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[

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
                          items: dropdownTreatment.map((String value2) {
                            return DropdownMenuItem<String>(
                              value: value2,
                              child: Text(value2),
                            );
                          }).toList(),
                          value: widget.user.treatmentTaken,
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this.widget.user.treatmentTaken = newValueSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  treatmentForIllnessFun(),

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
                        final FormState form = _formKey.currentState;
                        form.save();
                        if(widget.user.treatmentTaken == 'Yes' && widget.user.treatmentLocation.isEmpty) {
                          _showSnackBar("Please check the checkbox to proceed");
                        }
                        else {
                          //debugPrint('${widget.user.treatmentLocation.length}');
                          //debugPrint('${widget.user.treatmentLocation}');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Form4(user: widget.user,)));
                        }
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget treatmentForIllnessFun() {
    if( widget.user.treatmentTaken == "Yes") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[

                Expanded(
                  child: Text(
                    "2. If yes, then where was the child treated: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20.0),
            child: Text(
              "Public Health Facility:  ",
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][0]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][0]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][0]['category_name']),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][1]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][1]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][1]['category_name']),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][2]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][2]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][2]['category_name']),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][3]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][3]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][3]['category_name']),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][4]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][4]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][4]['category_name']),
            ),
          ), //Private Hosp.

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][5]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][5]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][5]['category_name']),
            ),
          ), //QAPP

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][6]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][6]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][6]['category_name']),
            ),
          ),  //AYUSH

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][7]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][7]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][7]['category_name']),
            ),
          ), //Unqualified Provider

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][8]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][8]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][8]['category_name']),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CheckboxListTile(
              value: widget.user.treatmentLocation.contains(_categories['responseBody'][9]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,_categories['responseBody'][9]['category_name']);
                debugPrint('${widget.user.treatmentLocation}');
              },
              title: Text(_categories['responseBody'][9]['category_name']),
            ),
          ),//Traditional Healer

        ],
      );
    }
    else {
      widget.user.treatmentLocation.clear();
      return Text("");
    }
  }

  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.user.treatmentLocation.add(category_name);
      });
    } else {
      setState(() {
        widget.user.treatmentLocation.remove(category_name);
      });
    }
  }

  void _showSnackBar(message) {
    var snackBar = SnackBar (
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}