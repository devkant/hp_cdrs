import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 2',
    home: _verbalAutopsyFormSec2Part4(),
  ));
}

class _verbalAutopsyFormSec2Part4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec2Part4State();
  }
}

class _verbalAutopsyFormSec2Part4State extends State<_verbalAutopsyFormSec2Part4> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //selection radio variable (stores the value of selected input)
  var _currentSelectedDiarrhoeaRadio = '';
  var _currentSelectedDiarrhoeaDaysRadio = '';
  var _currentSelectedVomitRadio = '';
  var _currentSelectedVomitDaysRadio = '';
  var _currentSelectedUmbilicalDischargeRadio = '';
  var _currentSelectedRashesRadio = '';
  var _currentSelectedYellowEyesRadio = '';
  var _currentSelectedFitsRadio = '';
  var _currentSelectedUnresponsiveRadio = '';




  @override
  void initState() {
    super.initState();
    _currentSelectedDiarrhoeaRadio = _yesNoRadioList[1];
    _currentSelectedVomitRadio = _yesNoRadioList[1];
    _currentSelectedUmbilicalDischargeRadio = _yesNoRadioList[1];
    _currentSelectedRashesRadio = _yesNoRadioList[1];
    _currentSelectedYellowEyesRadio = _yesNoRadioList[1];
    _currentSelectedFitsRadio = _yesNoRadioList[1];
    _currentSelectedUnresponsiveRadio = _yesNoRadioList[1];


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death (Pg 4/5)',
          style: TextStyle(fontSize: 20.0),
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
                            "Details of sickness at time of death:",
                            style:
                            TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ))),


                  //1st user input element start
                  questionElement('33A.', 'Did s/he have diarrhoea (frequent'
                      ' liquid stools)?'),

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
                              groupValue: _currentSelectedDiarrhoeaRadio,
                              onChanged: (String newRadioSelected) {
                                _onDiarrhoeaRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedDiarrhoeaRadio,
                              onChanged: (String newRadioSelected) {
                                _onDiarrhoeaRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedDiarrhoeaRadio,
                              onChanged: (String newRadioSelected) {
                                _onDiarrhoeaRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //2nd user input element
                  questionElement('33B.', 'If yes, for how many completed days'
                      ' were the stools frequent or liquid?'),

                  diarrhoeaDaysRadio(),



                  //3rd user input element
                  questionElement('34A.', 'Did he/she vomit?'),

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
                              groupValue: _currentSelectedVomitRadio,
                              onChanged: (String newRadioSelected) {
                                _onVomitRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedVomitRadio,
                              onChanged: (String newRadioSelected) {
                                _onVomitRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedVomitRadio,
                              onChanged: (String newRadioSelected) {
                                _onVomitRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //4th user input element
                  questionElement('34B.', 'If yes, for how many '
                      'completed days did s/he vomit?'),

                  vomitDaysRadio(),




                  //5th user input element
                  questionElement('35A.', 'Did s/he have redness around, or '
                      'discharge from, the umbilical cord stump?'),

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
                              groupValue: _currentSelectedUmbilicalDischargeRadio,
                              onChanged: (String newRadioSelected) {
                                _onUmbilicalDischargeRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedUmbilicalDischargeRadio,
                              onChanged: (String newRadioSelected) {
                                _onUmbilicalDischargeRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedUmbilicalDischargeRadio,
                              onChanged: (String newRadioSelected) {
                                _onUmbilicalDischargeRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //6th user input element
                  questionElement('35B.', 'Did s/he have redness around,'
                      ' or discharge from, the umbilical cord stump?'),

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
                              groupValue: _currentSelectedRashesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedRashesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedRashesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //7th user input element
                  questionElement('36. ', 'Did he/she have yellow eyes or skin?'),

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
                              groupValue: _currentSelectedYellowEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onYellowEyesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedYellowEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onYellowEyesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedYellowEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onYellowEyesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //8th user input element
                  questionElement('37. ', 'Did he/she have spasms or fits (convulsions)?'),

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
                              groupValue: _currentSelectedFitsRadio,
                              onChanged: (String newRadioSelected) {
                                _onFitsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedFitsRadio,
                              onChanged: (String newRadioSelected) {
                                _onFitsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedFitsRadio,
                              onChanged: (String newRadioSelected) {
                                _onFitsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //9th user input element
                  questionElement('38. ', 'Did he/she become unresponsive '
                      'or unconscious?'),

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
                              groupValue: _currentSelectedUnresponsiveRadio,
                              onChanged: (String newRadioSelected) {
                                _onUnresponsiveRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedUnresponsiveRadio,
                              onChanged: (String newRadioSelected) {
                                _onUnresponsiveRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedUnresponsiveRadio,
                              onChanged: (String newRadioSelected) {
                                _onUnresponsiveRadioSelect(newRadioSelected);
                              },
                            )
                          ])),




                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Next",
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


  //question generating widget
  Widget questionElement(String questionNo, String question){

    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                '$questionNo',
                style: TextStyle(fontSize: 16.0),
              )),
          Flexible(
              child: Text('$question'
                ,style: TextStyle(fontSize: 16.0),
              )
          )
        ]));
  }


  //radio setstate functions
  void _onDiarrhoeaRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedDiarrhoeaRadio = newRadioSelected;
    });
  }

  void _onDiarrhoeaDaysRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedDiarrhoeaDaysRadio = newRadioSelected;
    });
  }

  void _onVomitRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedVomitRadio = newRadioSelected;
    });
  }

  void _onVomitDaysRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedVomitDaysRadio = newRadioSelected;
    });
  }

  void _onUmbilicalDischargeRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedUmbilicalDischargeRadio = newRadioSelected;
    });
  }

  void _onRashesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedRashesRadio = newRadioSelected;
    });
  }

  void _onYellowEyesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedYellowEyesRadio = newRadioSelected;
    });
  }


  void _onFitsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedFitsRadio = newRadioSelected;
    });
  }

  void _onUnresponsiveRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedUnresponsiveRadio = newRadioSelected;
    });
  }



  //optional widget functions
  Widget diarrhoeaDaysRadio(){

    if(_currentSelectedDiarrhoeaRadio == 'Yes'){
      return Padding(
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
                  groupValue: _currentSelectedDiarrhoeaDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onDiarrhoeaDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: _currentSelectedDiarrhoeaDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onDiarrhoeaDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      _currentSelectedDiarrhoeaDaysRadio = null;
      return Text('--Not Required--');
    }
  }


  Widget vomitDaysRadio(){

    if(_currentSelectedVomitRadio == 'Yes'){
      return Padding(
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
                  groupValue: _currentSelectedVomitDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onVomitDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: _currentSelectedVomitDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onVomitDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      _currentSelectedVomitDaysRadio = null;
      return Text('--Not Required--');
    }
  }

}