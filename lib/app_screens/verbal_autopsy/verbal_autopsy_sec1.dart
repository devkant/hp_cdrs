import 'package:flutter/material.dart';
import 'verbal_autopsy_sec2_part1.dart';
import 'dart:async';
import 'user.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 1',
//    home: _verbalAutopsyFormSec1(),
//  ));
//}

class verbalAutopsySec1 extends StatefulWidget {
  final user verbal_Autopsy_Obj;

  verbalAutopsySec1({Key key, @required this.verbal_Autopsy_Obj})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec1State();
  }
}

class _verbalAutopsySec1State extends State<verbalAutopsySec1> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //date time obj declarations
  DateTime _deceasedDOB = DateTime.now();
  DateTime _deceasedDOD = DateTime.now();
  var displayDOB = 'Select date';
  var displayDOD = 'Select date';

  //list declarations for radio buttons
  var _liveWithRadioList = ['Yes', 'No', 'Unknown'];
  var _deceasedSexList = ['Male', 'Female'];
  var _completedDaysRadio = ['Less than 1 day', '01-28 days'];

  //list declarations for drop down menus
  var _relationWithDeceased = [
    'Father/Mother',
    'Brother/Sister',
    'Grandfather/Grandmother',
    'Other Relative',
    'Neighbour/No Relation',
    'Unknown'
  ];
  var _respondentEducationDropList = [
    'Illiterate & literate with no formal education',
    'Literate, primary or below',
    'Literate with class 12th',
    'Literate Middle',
    'Graduate & above',
    'Literate, matrix class 10th',
    'Unknown'
  ];
  var _respondentCategory = ['General', 'OBC', 'SC', 'ST'];
  var _respondentReligion = [
    'Hindu',
    'Muslim',
    'Christian',
    'Sikh',
    'Buddhist',
    'Jain',
    'No Religion',
    'Others',
    'Unknown'
  ];
  var _placeOfDeathDropList = [
    'Home',
    'Private Hospital',
    'PHC/CHC/Rural Hospital',
    'On way to health facility',
    'Medical college',
    'Sub Center',
    'District Hospital',
    'Other place',
    'Unknown'
  ];

  //selection radio variable (stores the value of selected input)
//  var _respondent = '';
//  var _currentDeceasedRadio = '';
//  var _currentCompletedDaysRadio = '';

  //selection drop down menu variable (stores the value of selected input)
//  var _relationship = '';
//  var _currentSelectedRespondentEducation = '';
//  var _currentSelectedRespondentCategory = '';
//  var _currentSelectedRespondentReligion = '';
//  var _currentSelectedPlaceOfDeath = '';

  //controller obj for text fields
//  String respondentNameController = '';
//  String deceasedAddressController = '';
  String PincodeController = '';

//  String respondentWordsController = '';

  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.liveWith = _liveWithRadioList[1];
    widget.verbal_Autopsy_Obj.sex = _deceasedSexList[0];
    widget.verbal_Autopsy_Obj.ageInDays = _completedDaysRadio[0];

    widget.verbal_Autopsy_Obj.relationship = _relationWithDeceased[0];
    widget.verbal_Autopsy_Obj.respondentEducation =
    _respondentEducationDropList[0];
    widget.verbal_Autopsy_Obj.category = _respondentCategory[0];
    widget.verbal_Autopsy_Obj.religion = _respondentReligion[0];
    widget.verbal_Autopsy_Obj.placeOfDeath = _placeOfDeathDropList[0];

  }



  //date picker class for dob & dod
  Future<Null> _selectDOBDate(BuildContext context) async {
    final DateTime pickedDOB = await showDatePicker(
      context: context,
      initialDate: _deceasedDOB,
      firstDate: DateTime.now().subtract(Duration(days: 48)),
      lastDate: DateTime.now(),
    );

    if (pickedDOB != null) {
//      print('Date Selected');
      setState(() {
        _deceasedDOB = pickedDOB;
        displayDOB = "${_deceasedDOB.day}"
            "/${_deceasedDOB.month}"
            "/${_deceasedDOB.year}";
      });
    }
  }

  Future<Null> _selectDODDate(BuildContext context) async {
    final DateTime pickedDOD = await showDatePicker(
      context: context,
      initialDate: _deceasedDOD,
      firstDate: DateTime.now().subtract(Duration(days: 48)),
      lastDate: DateTime.now(),
    );

    if (pickedDOD != null) {
//      print('Date Selected');
      setState(() {
        _deceasedDOD = pickedDOD;
        displayDOD = displayDOD = "${_deceasedDOD.day}"
            "/${_deceasedDOD.month}"
            "/${_deceasedDOD.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Section 1: Details of Respondent' "\n" '& Deceased',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                            "Details of respondent",
                            style:
                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                          ))),

                  //1st user input element start
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        child: Row(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(
                                '1. ',
                                style: TextStyle(fontSize: 16.0),
                              )),
                          Flexible(
                              child: TextFormField(
                                validator: (String value) {
                                  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                                  if (!nameExp.hasMatch(value))
                                    return 'Please enter only alphabetical values';
                                },
                                onSaved: (value) {
                                  widget.verbal_Autopsy_Obj.respondent = value;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Name of Respondent',
                                    hintText: 'Name of Respondent',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0))),
                              ))
                        ])),),

                  //2nd user input element start
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                          child: Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '2. ',
                                  style: TextStyle(fontSize: 16.0),
                                )),
                            Flexible(child: Text(
                              'Relationship of respondent with deceased:',
                              style: TextStyle(fontSize: 16.0),
                            ))
                          ]))),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _relationWithDeceased.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: widget.verbal_Autopsy_Obj.relationship,
                      onChanged: (String newValueSelected) {
                        _onDropDownRelationSelected(newValueSelected);
                      },
                    ),
                  ),

                  //3rd user input element start
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text('3. ', style: TextStyle(fontSize: 16.0))),
                          Flexible(
                              child: Text(
                                  'Did the respondent live with the deceased during '
                                      'the events that led to death?',
                                  style: TextStyle(fontSize: 16.0))),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Yes',
                              groupValue: widget.verbal_Autopsy_Obj.liveWith,
                              onChanged: (String newRadioSelected) {
                                _onliveWithRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.liveWith,
                              onChanged: (String newRadioSelected) {
                                _onliveWithRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.liveWith,
                              onChanged: (String newRadioSelected) {
                                _onliveWithRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  //4th user input element start
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '4. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text(
                              'What is the highest standard of education the respondent'
                                  ' has completed?',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            ))
                      ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: Container(
                            width: 270.0,
                            child: DropdownButton<String>(
                              items: _respondentEducationDropList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              isExpanded: true,
                              value: widget.verbal_Autopsy_Obj.respondentEducation,
                              onChanged: (String newValueSelected) {
                                _onDropDownEducationSelected(newValueSelected);
                              },
                            )),)
                  ),

                  //5th user input element start
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '5. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text(
                              'Category:',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton<String>(
                            items: _respondentCategory.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: widget.verbal_Autopsy_Obj.category,
                            onChanged: (String newValueSelected) {
                              _onDropDownCategorySelected(newValueSelected);
                            },
                          ),
                        ),
                      ])),

                  //6th user input element start
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '6. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text(
                              'Religion of the head of the household:',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                      ])),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _respondentReligion.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: widget.verbal_Autopsy_Obj.religion,
                      onChanged: (String newValueSelected) {
                        _onDropDownReligionSelected(newValueSelected);
                      },
                    ),
                  ),



                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Details of deceased',
                        style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
                      )),

                  //7th user input element start
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            '7. ',
                            style: TextStyle(fontSize: 16.0),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Deceased's Sex:",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]),
                  ),

                  Padding(padding: EdgeInsets.all(10.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'Male',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Radio(
                          value: 'Male',
                          groupValue: widget.verbal_Autopsy_Obj.sex,
                          onChanged: (String newRadioSelected) {
                            _onSexRadioSelect(newRadioSelected);
                          },
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Radio(
                          value: 'Female',
                          groupValue: widget.verbal_Autopsy_Obj.sex,
                          onChanged: (String newRadioSelected) {
                            _onSexRadioSelect(newRadioSelected);
                          },
                        ),

                      ],
                    ),
                  ),

                  //8th user input element start
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            '8. ',
                            style: TextStyle(fontSize: 16.0),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Age (in completed days):",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Less than 1 day',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            value: 'Less than 1 day',
                            groupValue: widget.verbal_Autopsy_Obj.ageInDays,
                            onChanged: (String newRadioSelected) {
                              _onCompletedDaysRadioSelect(newRadioSelected);
                            },
                          ),
                          Text(
                            '01-28 days',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            value: '01-28 days',
                            groupValue: widget.verbal_Autopsy_Obj.ageInDays,
                            onChanged: (String newRadioSelected) {
                              _onCompletedDaysRadioSelect(newRadioSelected);
                            },
                          )
                        ],
                      )),

                  //9th user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '9. ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Text(
                            'Date of birth:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RaisedButton(
                                color: Colors.white,
                                elevation: 2.0,
                                child: Text('$displayDOB',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectDOBDate(context);
                                    widget.verbal_Autopsy_Obj.dob =
                                        _deceasedDOB.toString();
                                  });
                                }),
                          )
                        ],
                      )),

                  //10th user input element start
                  Padding(
                      padding:
                      EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '10. ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Text(
                            'Date of death:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RaisedButton(
                                color: Colors.white,
                                elevation: 2.0,
                                child: Text('$displayDOD',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectDODDate(context);
                                    widget.verbal_Autopsy_Obj.dod =
                                        _deceasedDOD.toString();
                                  });
                                }),
                          )
                        ],
                      )),

                  //11th user input element start
                  Padding(
                      padding:
                      EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '11A.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Text(
                            'House address of the deceased:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      onSaved: (value) {
                        widget.verbal_Autopsy_Obj.address = value;
                      },
                      decoration: InputDecoration(hintText: 'Your Text Here'),
                      validator: (String value) {
                        if (value.isEmpty) return 'Please fill a valid input';
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),

                  Padding(
                      padding:
                      EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '11B.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              'Pincode:',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              onSaved: (value) {
                                PincodeController = value;
                                widget.verbal_Autopsy_Obj.pin =
                                    num.parse(PincodeController);
                              },
                              decoration: InputDecoration(
                                  hintText: 'Pincode',
                                  labelText: 'Pincode',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0))),
                              validator: (String value) {
                                if (num.parse(value) < 170000||
                                num.parse(value) > 179999)
                                  return 'Please fill a valid pincode';
                              },
                              keyboardType: TextInputType.numberWithOptions(),
                            ),
                          ),
                        ],
                      )),

                  //12th user input element start
                  Padding(
                      padding: EdgeInsets.only(right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '12A.',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                        Flexible(
                            child: Text(
                              'Place of death:',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                      ])),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _placeOfDeathDropList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: widget.verbal_Autopsy_Obj.placeOfDeath,
                      onChanged: (String newValueSelected) {
                        _onDropDownPlaceOfDeathSelected(newValueSelected);
                      },
                    ),
                  ),

                  //13th user input element start
                  Padding(
                      padding: EdgeInsets.only(right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '12B.',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                        Flexible(
                            child: Text(
                              'What did the respondent think the newborn died of? '
                                  "( Allow the respondent to tell the illness in his or her own words )",
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.justify,
                            )),
                      ])),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      onSaved: (value) {
                        widget.verbal_Autopsy_Obj.probableCause = value;
                      },
                      decoration: InputDecoration(hintText: 'Your Text Here'),
                      validator: (String value) {
                        if (value.isEmpty) return 'Please fill a valid input';
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Proceed to Section 2",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (widget.verbal_Autopsy_Obj.dob == null ||
                            widget.verbal_Autopsy_Obj.dod == null) {
                          // The checkbox wasn't checked
                          showSnackBar('Please select the date of birth and date of death to proceed');
                        }
                        if (_formKey.currentState.validate() &&
                            widget.verbal_Autopsy_Obj.dod != null &&
                            widget.verbal_Autopsy_Obj.dob != null) {
                          final FormState form = _formKey.currentState;
                          form.save();
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsySec2Part1(
                                      verbal_Autopsy_Obj: widget.verbal_Autopsy_Obj,
                                    )));
                          });
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _onliveWithRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.liveWith = newRadioSelected;
    });
  }

  void _onSexRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.sex = newRadioSelected;
    });
  }

  void _onCompletedDaysRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.ageInDays = newRadioSelected;
    });
  }

  void _onDropDownRelationSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.relationship = newValueSelected;
    });
  }

  void _onDropDownReligionSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.religion = newValueSelected;
    });
  }

  void _onDropDownCategorySelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.category = newValueSelected;
    });
  }

  void _onDropDownEducationSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.respondentEducation = newValueSelected;
    });
  }

  void _onDropDownPlaceOfDeathSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.placeOfDeath = newValueSelected;
    });
  }

  void showSnackBar(String message){
    var snackBar = SnackBar(
//      backgroundColor: Colors.blue,
      content: Text(message,
        style: TextStyle(fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
