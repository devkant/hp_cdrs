import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 2',
    home: _verbalAutopsy5YrFormSec2Part3(),
  ));
}

class _verbalAutopsy5YrFormSec2Part3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsy5YrFormSec2Part3State();
  }
}

class _verbalAutopsy5YrFormSec2Part3State extends State<_verbalAutopsy5YrFormSec2Part3> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //list declarations for drop down menus



  //selection radio variable (stores the value of selected input)
  var _currentSelectedCoughRadio = '';
  var _currentSelectedBloodinCoughRadio = '';
  var _currentSelectedBreathingDifficultyRadio = '';
  var _currentSelectedFastBreathingRadio = '';
  var _currentSelectedChestInDrawingRadio = '';
  var _currentSelectedWheezingRadio = '';
  var _currentSelectedAbdominalPainRadio = '';
  var _currentSelectedAbdominalDistentionRadio = '';
  var _currentSelectedVomitRadio = '';
  var _currentSelectedYellowEyes = '';



  TextEditingController coughDaysController = TextEditingController();
  TextEditingController breathingDifficultyDaysController = TextEditingController();
  TextEditingController vomitDaysController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _currentSelectedCoughRadio = _yesNoRadioList[1];
    _currentSelectedBreathingDifficultyRadio = _yesNoRadioList[1];
    _currentSelectedFastBreathingRadio = _yesNoRadioList[1];
    _currentSelectedChestInDrawingRadio = _yesNoRadioList[1];
    _currentSelectedWheezingRadio = _yesNoRadioList[1];
    _currentSelectedAbdominalPainRadio = _yesNoRadioList[1];
    _currentSelectedAbdominalDistentionRadio = _yesNoRadioList[1];
    _currentSelectedVomitRadio = _yesNoRadioList[1];
    _currentSelectedYellowEyes = _yesNoRadioList[1];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death (Pg 3/5)',
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
                            "Details of sickness at time of death",
                            style:
                            TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ))),


                  //1st user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have a cough?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedCoughRadio,
                              onChanged: (String newRadioSelected) {
                                _onCoughRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedCoughRadio,
                              onChanged: (String newRadioSelected) {
                                _onCoughRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedCoughRadio,
                              onChanged: (String newRadioSelected) {
                                _onCoughRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //2nd user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        coughCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, was there blood?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                      ])),

                  bloodinCough(),



                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have '
                                'breathing difficulties?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedBreathingDifficultyRadio,
                              onChanged: (String newRadioSelected) {
                                _onBreathingDifficultyRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedBreathingDifficultyRadio,
                              onChanged: (String newRadioSelected) {
                                _onBreathingDifficultyRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedBreathingDifficultyRadio,
                              onChanged: (String newRadioSelected) {
                                _onBreathingDifficultyRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        breathingDifficultyCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have'
                                ' fast breathing?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedFastBreathingRadio,
                              onChanged: (String newRadioSelected) {
                                _onFastBreathingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedFastBreathingRadio,
                              onChanged: (String newRadioSelected) {
                                _onFastBreathingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedFastBreathingRadio,
                              onChanged: (String newRadioSelected) {
                                _onFastBreathingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22D.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have in-drawing'
                                ' of the chest?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedChestInDrawingRadio,
                              onChanged: (String newRadioSelected) {
                                _onChestInDrawingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedChestInDrawingRadio,
                              onChanged: (String newRadioSelected) {
                                _onChestInDrawingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedChestInDrawingRadio,
                              onChanged: (String newRadioSelected) {
                                _onChestInDrawingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22E.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have wheezing'
                                ' (demonstrate sound)?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedWheezingRadio,
                              onChanged: (String newRadioSelected) {
                                _onWheezingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedWheezingRadio,
                              onChanged: (String newRadioSelected) {
                                _onWheezingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedWheezingRadio,
                              onChanged: (String newRadioSelected) {
                                _onWheezingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '23A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('During the illness, '
                                'did she/he have abdominal pain?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedAbdominalPainRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalPainRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedAbdominalPainRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalPainRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedAbdominalPainRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalPainRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '23B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have'
                                ' abdominal distention?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedAbdominalDistentionRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalDistentionRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedAbdominalDistentionRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalDistentionRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedAbdominalDistentionRadio,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalDistentionRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '24A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he vomit?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '24B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        vomitCompletedDays(),
                      ])),



                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did the eye/skin '
                                'colour change to yellow?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

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
                              groupValue: _currentSelectedYellowEyes,
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
                              groupValue: _currentSelectedYellowEyes,
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
                              groupValue: _currentSelectedYellowEyes,
                              onChanged: (String newRadioSelected) {
                                _onYellowEyesRadioSelect(newRadioSelected);
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


  void _onCoughRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedCoughRadio = newRadioSelected;
    });
  }

  void _onBloodinCoughRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBloodinCoughRadio = newRadioSelected;
    });
  }

  void _onBreathingDifficultyRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBreathingDifficultyRadio = newRadioSelected;
    });
  }

  void _onFastBreathingRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedFastBreathingRadio = newRadioSelected;
    });
  }

  void _onChestInDrawingRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedChestInDrawingRadio = newRadioSelected;
    });
  }

  void _onWheezingRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedWheezingRadio = newRadioSelected;
    });
  }

  void _onAbdominalPainRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedAbdominalPainRadio = newRadioSelected;
    });
  }

  void _onAbdominalDistentionRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedAbdominalDistentionRadio = newRadioSelected;
    });
  }

  void _onVomitRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedVomitRadio = newRadioSelected;
    });
  }

  void _onYellowEyesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedYellowEyes = newRadioSelected;
    });
  }


  Widget coughCompletedDays(){

    if(_currentSelectedCoughRadio == 'Yes') {
      return Flexible(
          child: TextFormField(
              controller: coughDaysController,
              validator: (String value) {
                if (value.isEmpty) return 'Please input days';
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'No. of days',
                  hintText: 'No. of days',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0)))));
    }
    else {
      coughDaysController = null;
      return Text('--Not required--');
    }
  }

  Widget breathingDifficultyCompletedDays(){

    if(_currentSelectedBreathingDifficultyRadio == 'Yes') {
      return Flexible(
          child: TextFormField(
              controller: breathingDifficultyDaysController,
              validator: (String value) {
                if (value.isEmpty) return 'Please input days';
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'No. of days',
                  hintText: 'No. of days',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0)))));
    }
    else {
      breathingDifficultyDaysController = null;
      return Text('--Not required--');
    }
  }


  Widget vomitCompletedDays(){

    if(_currentSelectedVomitRadio == 'Yes') {
      return Flexible(
          child: TextFormField(
              controller: vomitDaysController,
              validator: (String value) {
                if (value.isEmpty) return 'Please input days';
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'No. of days',
                  hintText: 'No. of days',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0)))));
    }
    else {
      vomitDaysController = null;
      return Text('--Not required--');
    }
  }



  Widget bloodinCough(){

    if(_currentSelectedCoughRadio == 'Yes') {
      return Padding(
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
                  groupValue: _currentSelectedBloodinCoughRadio,
                  onChanged: (String newRadioSelected) {
                    _onBloodinCoughRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  'No',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'No',
                  groupValue: _currentSelectedBloodinCoughRadio,
                  onChanged: (String newRadioSelected) {
                    _onBloodinCoughRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  'Unknown',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'Unknown',
                  groupValue: _currentSelectedBloodinCoughRadio,
                  onChanged: (String newRadioSelected) {
                    _onBloodinCoughRadioSelect(newRadioSelected);
                  },
                )
              ]));
    }

    else{
      _currentSelectedBloodinCoughRadio = null;
      return Text('--Not Required--');
    }

  }

}