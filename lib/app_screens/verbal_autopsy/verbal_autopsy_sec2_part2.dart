import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 2',
    home: _verbalAutopsyFormSec2Part2(),
  ));
}

class _verbalAutopsyFormSec2Part2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec2Part2State();
  }
}

class _verbalAutopsyFormSec2Part2State extends State<_verbalAutopsyFormSec2Part2> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
  var _daysRadioList = ['Less than 1 day', '01-28 days'];


  //list declarations for drop down menus
  var _birthSizeList = ['Very small', 'Smaller than average',
    'Average', 'Larger than average', 'Unknown'];
  var _firstBreastFeed = ['Immediately/within 1 hour of birth',
    'Same day as child was born', 'Second day or later',
    'Never breastfed', 'Unknown'];


  //selection radio variable (stores the value of selected input)
  var _currentSelectedBabyCryRadio = '';
  var _currentSelectedBabyInjuryRadio = '';
  var _currentSelectedBabyMalformationsRadio = '';
  var _currentSelectedCryStopRadio = '';
  var _currentSelectedCryStopDaysRadio = '';
  var _currentSelectedOtherDrinkRadio = '';
  var _currentSelectedSuckleRadio = '';
  var _currentSelectedNormalSuckRadio = '';
  var _currentSelectedNormalSuckStopRadio = '';


  bool _weightCheck = false;


  //selection drop down menu variable (stores the value of selected input)
  var _currentSelectedBirthSize = '';
  var _currentSelectedFirstBreastFeed = '';


  //controller obj for text fields
  TextEditingController birthWeightController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _currentSelectedBabyCryRadio = _yesNoRadioList[0];
    _currentSelectedBabyInjuryRadio = _yesNoRadioList[0];
    _currentSelectedBabyMalformationsRadio = _yesNoRadioList[1];
    _currentSelectedCryStopRadio = _yesNoRadioList[1];
    _currentSelectedOtherDrinkRadio = _yesNoRadioList[0];
    _currentSelectedSuckleRadio = _yesNoRadioList[1];


    _currentSelectedBirthSize = _birthSizeList[2];
    _currentSelectedFirstBreastFeed = _firstBreastFeed[0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death (Pg 2/5)',
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
                            "Details of baby after birth:",
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
                              '21. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did the baby ever cry, move or breathe?'
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
                              groupValue: _currentSelectedBabyCryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyCryRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedBabyCryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyCryRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedBabyCryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyCryRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  //2nd user input element start
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Were there any bruises or signs of '
                                'injury on child\'s body after the birth?'
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
                              groupValue: _currentSelectedBabyInjuryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyInjuryRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedBabyInjuryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyInjuryRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedBabyInjuryRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyInjuryRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  //3rd user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '23. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have any visible'
                                ' malformations at birth?'
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
                              groupValue: _currentSelectedBabyMalformationsRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyMalformationsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedBabyMalformationsRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyMalformationsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedBabyMalformationsRadio,
                              onChanged: (String newRadioSelected) {
                                _onBabyMalformationsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  //4th user input element
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('24A.', style: TextStyle(fontSize: 16.0))),
                      Flexible(
                          child: Text(
                            'Compared to other children in your '
                                'area, what was the child\'s size at birth?',
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _birthSizeList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentSelectedBirthSize,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentSelectedBirthSize = newValueSelected;
                        });
                      },
                    ),
                  ),


                  //5th user input element
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            '24B.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Flexible(
                            child: Text(
                              'What was the birth weight (in grams) ?',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        dropDownChildWeight()
                      ],
                    ),
                  ),
                  CheckboxListTile(
                      value: _weightCheck,
                      title: Text('Unknown'),
                      onChanged: (bool value) {
                        setState(() {
                          _weightCheck = value;
                        });
                      }),



                  //6th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did baby stop being able to cry?'
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
                              groupValue: _currentSelectedCryStopRadio,
                              onChanged: (String newRadioSelected) {
                                _onCryStopRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedCryStopRadio,
                              onChanged: (String newRadioSelected) {
                                _onCryStopRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedCryStopRadio,
                              onChanged: (String newRadioSelected) {
                                _onCryStopRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //7th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed '
                                'days after birth did s/he stop crying?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

                  cryStopRadio(),



                  //8th user input element
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('26A.', style: TextStyle(fontSize: 16.0))),
                      Flexible(
                          child: Text(
                            'When was he/she first breastfed?',
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _firstBreastFeed.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentSelectedFirstBreastFeed,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentSelectedFirstBreastFeed = newValueSelected;
                        });
                      },
                    ),
                  ),



                  //9th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '26B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was the baby ever given'
                                ' anything to drink other than breast milk?'
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
                              groupValue: _currentSelectedOtherDrinkRadio,
                              onChanged: (String newRadioSelected) {
                                _onOtherDrinkRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedOtherDrinkRadio,
                              onChanged: (String newRadioSelected) {
                                _onOtherDrinkRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedOtherDrinkRadio,
                              onChanged: (String newRadioSelected) {
                                _onOtherDrinkRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //10th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '27A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was he/she able to '
                                'suckle normally during the first day of life?'
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
                              groupValue: _currentSelectedSuckleRadio,
                              onChanged: (String newRadioSelected) {
                                _onSuckleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedSuckleRadio,
                              onChanged: (String newRadioSelected) {
                                _onSuckleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedSuckleRadio,
                              onChanged: (String newRadioSelected) {
                                _onSuckleRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //11th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '27B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, did he/she stop being'
                                ' able to suck in a normal way?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

                  normalSuckRadio(),


                  //12th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '27C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many '
                                'completed days after birth did he/she stop sucking?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),
                  suckStopRadio(),




                  //13th user input element
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



  //radio setState functions
  void _onBabyCryRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBabyCryRadio = newRadioSelected;
    });
  }

  void _onBabyInjuryRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBabyInjuryRadio = newRadioSelected;
    });
  }

  void _onBabyMalformationsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBabyMalformationsRadio = newRadioSelected;
    });
  }

  void _onCryStopRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedCryStopRadio = newRadioSelected;
    });
  }

  void _onCryStopDaysRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedCryStopDaysRadio = newRadioSelected;
    });
  }

  void _onOtherDrinkRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedOtherDrinkRadio = newRadioSelected;
    });
  }

  void _onSuckleRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedSuckleRadio = newRadioSelected;
    });
  }

  void _onNormalSuckSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedNormalSuckRadio = newRadioSelected;
    });
  }

  void _onNormalSuckStopRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedNormalSuckStopRadio = newRadioSelected;
    });
  }


  //optional menu functions
  Widget dropDownChildWeight(){

    if(_weightCheck == false) {
      return Flexible(
          child: TextFormField(
              controller: birthWeightController,
              validator: (String value) {
                if (value.isEmpty) return 'Please input weight';
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'Weight',
                  hintText: 'Weight (in grams)',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0)))));
    }
    else {
      birthWeightController = null;
      return Text('');
    }
  }

  Widget cryStopRadio(){

    if(_currentSelectedCryStopRadio == 'Yes'){
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
                  groupValue: _currentSelectedCryStopDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onCryStopDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: _currentSelectedCryStopDaysRadio,
                  onChanged: (String newRadioSelected) {
                    _onCryStopDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      _currentSelectedCryStopDaysRadio = null;
      return Text('--Not Required--');
    }
  }

  Widget normalSuckRadio(){
    if(_currentSelectedSuckleRadio == 'Yes'){
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
                  groupValue: _currentSelectedNormalSuckRadio,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckSelect(newRadioSelected);
                  },
                ),
                Text(
                  'No',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'No',
                  groupValue: _currentSelectedNormalSuckRadio,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckSelect(newRadioSelected);
                  },
                ),
                Text(
                  'Unknown',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'Unknown',
                  groupValue: _currentSelectedNormalSuckRadio,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckSelect(newRadioSelected);
                  },
                )
              ]));
    }
    else {
      _currentSelectedNormalSuckRadio = null;
      return Text('--Not Required--');
    }
  }

  Widget suckStopRadio(){

    if(_currentSelectedNormalSuckRadio == 'Yes'){
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
                  groupValue: _currentSelectedNormalSuckStopRadio,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckStopRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: _currentSelectedNormalSuckStopRadio,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckStopRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      _currentSelectedNormalSuckStopRadio = null;
      return Text('--Not Required--');
    }
  }
}