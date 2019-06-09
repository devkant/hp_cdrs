import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 1',
    home: _verbalAutopsyFormSec1(),
  ));
}

class _verbalAutopsyFormSec1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec1State();
  }
}

class _verbalAutopsyFormSec1State extends State<_verbalAutopsyFormSec1> {
  var _formKey = GlobalKey<FormState>();


  //date time obj declarations
  DateTime _deceasedDOB = DateTime.now();
  DateTime _deceasedDOD = DateTime.now();


  //list declarations for radio buttons
  var _respondentRadioList = ['Yes', 'No', 'Unknown'];
  var _deceasedRadioList = ['Male', 'Female'];
  var _completedDaysRadio = ['Less than 1 day', '01-28 days'];


  //list declarations for drop down menus
  var _relationWithDeceased = [
    'Father/Mother',
    'Bother/Sister',
    'Grandfather/Grandmother',
    'Other Relative',
    'Neighbor/No Reation',
    'Unknown'
  ];
  var _respondentEducation = [
    'Illiterate & literate with no formal education',
    'Literate, primary or below',
    'Literate with class 12th',
    'Literate Middle',
    'Graduate & above',
    'Literate, matrix class 10th'
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
  var _placeOfDeath = [
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
  var _currentRespondentRadio = '';
  var _currentDeceasedRadio = '';
  var _currentCompletedDaysRadio = '';


  //selection drop down menu variable (stores the value of selected input)
  var _currentSelectedRespondentRelation = '';
  var _currentSelectedRespondentEducation = '';
  var _currentSelectedRespondentCategory = '';
  var _currentSelectedRespondentReligion = '';
  var _currentSelectedPlaceOfDeath = '';


  //controller obj for text fields
  TextEditingController respondentNameController = TextEditingController();
  TextEditingController deceasedAddressController = TextEditingController();
  TextEditingController deceasedPincodeController = TextEditingController();
  TextEditingController respondentWordsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentRespondentRadio = _respondentRadioList[0];
    _currentDeceasedRadio = _deceasedRadioList[0];
    _currentCompletedDaysRadio = _completedDaysRadio[0];

    _currentSelectedRespondentRelation = _relationWithDeceased[0];
    _currentSelectedRespondentEducation = _respondentEducation[0];
    _currentSelectedRespondentCategory = _respondentCategory[0];
    _currentSelectedRespondentReligion = _respondentReligion[0];
    _currentSelectedPlaceOfDeath = _placeOfDeath[0];
  }


  //date picker class for dob & dod
  Future<Null> _selectDOBDate(BuildContext context) async {
    final DateTime pickedDOB = await showDatePicker(
      context: context,
      initialDate: _deceasedDOB,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if (pickedDOB != null && pickedDOB != _deceasedDOB) {
      print('Date Selected');
      setState(() {
        _deceasedDOB = pickedDOB;
      });
    }
  }

  Future<Null> _selectDODDate(BuildContext context) async {
    final DateTime pickedDOD = await showDatePicker(
        context: context,
        initialDate: _deceasedDOD,
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    if (pickedDOD != null && pickedDOD != _deceasedDOB) {
      print('Date Selected');
      setState(() {
        _deceasedDOD = pickedDOD;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 1: Details for Respondent & Deceased',
          style: TextStyle(fontSize: 17.0),
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
                            "Details of respondent:",
                            style:
                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                          ))),


                  //1st user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              controller: respondentNameController,
                              decoration: InputDecoration(
                                  labelText: 'Name of Respondent',
                                  hintText: 'Name of Respondent',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0))),
                            ))
                      ])),


                  //2nd user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '2. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Text(
                          'Relationship of respondent with deceased:',
                          style: TextStyle(fontSize: 16.0),
                        )
                      ])),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _relationWithDeceased.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentSelectedRespondentRelation,
                      onChanged: (String newValueSelected) {
                        _onDropDownRelationSelected(newValueSelected);
                      },
                    ),
                  ),


                  //3rd user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentRespondentRadio,
                              onChanged: (String newRadioSelected) {
                                _onRespondentRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentRespondentRadio,
                              onChanged: (String newRadioSelected) {
                                _onRespondentRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentRespondentRadio,
                              onChanged: (String newRadioSelected) {
                                _onRespondentRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  //4th user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                    child: DropdownButton<String>(
                      items: _respondentEducation.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentSelectedRespondentEducation,
                      onChanged: (String newValueSelected) {
                        _onDropDownEducationSelected(newValueSelected);
                      },
                    ),
                  ),


                  //5th user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                            value: _currentSelectedRespondentCategory,
                            onChanged: (String newValueSelected) {
                              _onDropDownCategorySelected(newValueSelected);
                            },
                          ),
                        ),
                      ])),


                  //6th user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton<String>(
                            items: _respondentReligion.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _currentSelectedRespondentReligion,
                            onChanged: (String newValueSelected) {
                              _onDropDownReligionSelected(newValueSelected);
                            },
                          ),
                        ),
                      ])),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Details of deceased:',
                        style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                      )),


                  //7th user input element start
                  Padding(
                    padding: EdgeInsets.all(10.0),
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
                      Text(
                        'Male',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 'Male',
                        groupValue: _currentDeceasedRadio,
                        onChanged: (String newRadioSelected) {
                          _onDeceasedRadioSelect(newRadioSelected);
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 'Female',
                        groupValue: _currentDeceasedRadio,
                        onChanged: (String newRadioSelected) {
                          _onDeceasedRadioSelect(newRadioSelected);
                        },
                      ),
                    ]),
                  ),


                  //8th user input element start
                  Padding(
                    padding: EdgeInsets.all(10.0),
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
                          "Age in completed days:",
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
                            groupValue: _currentCompletedDaysRadio,
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
                            groupValue: _currentCompletedDaysRadio,
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
                                child: Text(
                                  "${_deceasedDOB.day}/${_deceasedDOB.month}"
                                      "/${_deceasedDOB.year}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {
                                  _selectDOBDate(context);
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
                                child: Text(
                                  "${_deceasedDOD.day}/${_deceasedDOD.month}"
                                      "/${_deceasedDOD.year}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {
                                  _selectDODDate(context);
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
                      controller: deceasedAddressController,
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
                            ),),

                          Flexible(
                            child: TextFormField(
                              controller: deceasedPincodeController,
                              decoration: InputDecoration(
                                  hintText: 'Pincode',
                                  labelText: 'Pincode',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0))
                              ),
                              validator: (String value) {
                                if (value.length != 6) return 'Please fill a valid pincode';
                              },
                              keyboardType: TextInputType.numberWithOptions(),

                            ),),
                        ],
                      )),







                  //12th user input element start
                  Padding(
                      padding:
                      EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '12. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text(
                              'Place of death:',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.left,
                            )),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton<String>(
                            items: _placeOfDeath.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _currentSelectedPlaceOfDeath,
                            onChanged: (String newValueSelected) {
                              _onDropDownPlaceOfDeathSelected(newValueSelected);
                            },
                          ),
                        ),
                      ])),


                  //extra user input element start
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "What did the respondent think the newborn died of? "
                          "\( Allow the respondent to tell the illness in his or her own words \)",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: respondentWordsController,
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
                        setState(() {
                          if (_formKey.currentState.validate())
                            AlertDialog(
                              title: Text('Form Submitted Sucessfully'),
                              content: Text('Success'),
                            );
                        });
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _onRespondentRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentRespondentRadio = newRadioSelected;
    });
  }

  void _onDeceasedRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentDeceasedRadio = newRadioSelected;
    });
  }

  void _onCompletedDaysRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentCompletedDaysRadio = newRadioSelected;
    });
  }

  void _onDropDownRelationSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedRespondentRelation = newValueSelected;
    });
  }

  void _onDropDownReligionSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedRespondentReligion = newValueSelected;
    });
  }

  void _onDropDownCategorySelected(String newValueSelected) {
    setState(() {
      this._currentSelectedRespondentCategory = newValueSelected;
    });
  }

  void _onDropDownEducationSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedRespondentEducation = newValueSelected;
    });
  }

  void _onDropDownPlaceOfDeathSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedPlaceOfDeath = newValueSelected;
    });
  }
}
