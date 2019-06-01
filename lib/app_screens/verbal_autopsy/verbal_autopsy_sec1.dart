import 'package:flutter/material.dart';

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
  var _respondentRadioList = ['Yes', 'No', 'Unknown'];
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

  var _currentRespondentRadio = '';

  var _currentSelectedRespondentRelation = '';
  var _currentSelectedRespondentEducation = '';
  var _currentSelectedRespondentCategory = '';
  var _currentSelectedRespondentReligion = '';

  TextEditingController respondentNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentRespondentRadio = _respondentRadioList[0];

    _currentSelectedRespondentRelation = _relationWithDeceased[0];
    _currentSelectedRespondentEducation = _respondentEducation[0];
    _currentSelectedRespondentCategory = _respondentCategory[0];
    _currentSelectedRespondentReligion = _respondentReligion[0];
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
                            "Details of Respondent:",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ))),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '1.',
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
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '2.',
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
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text('3.', style: TextStyle(fontSize: 16.0))),
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
                              onChanged: (String newRadioSelected){
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
                              onChanged: (String newRadioSelected){
                                _onRespondentRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Uknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentRespondentRadio,
                              onChanged: (String newRadioSelected){
                                _onRespondentRadioSelect(newRadioSelected);
                              },
                            )
                          ])),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '4.',
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
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '5.',
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
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '6.',
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
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _onRespondentRadioSelect(String newRadioSelected){
    setState(() {
      this._currentRespondentRadio = newRadioSelected;
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
}
