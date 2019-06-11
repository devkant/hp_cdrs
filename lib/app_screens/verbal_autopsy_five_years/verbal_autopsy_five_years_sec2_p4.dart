import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy 5 year Form Section 2',
    home: _verbalAutopsy5YrSec2Part4(),
  ));
}

class _verbalAutopsy5YrSec2Part4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsy5YrSec2Part4State();
  }
}

class _verbalAutopsy5YrSec2Part4State extends State<_verbalAutopsy5YrSec2Part4> {
  var _formKey = GlobalKey<FormState>();


  //list for drop down menus
  var _measlesInjectionList = ['Yes-only one', 'Yes-more than one',
    'No-did not recieve any', 'Unknown'];


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //boolean declarations for check boxes
  bool _coughCheck = false;
  bool _diarrhoeaCheck = false;
  bool _earDischargeCheck = false;
  bool _feverCheck = false;
  bool _rashesCheck = false;
  bool _otherCheck = false;
  bool _unknownCheck = false;



  //selection radio variable (stores the value of selected input)
  var _currentSelectedRashRadio = '';
  var _currentSelectedRedEyesRadio = '';
  var _currentSelectedMeaslesRadio = '';
  var _currentSelectedThinRadio = '';
  var _currentSelectedSwellingRadio = '';
  var _currentSelectedPaleRadio = '';
  var _currentSelectedNormalGrowthRadio = '';
  var _currentSelectedMultipleIllnessesRadio = '';
  var _currentSelectedBCGInjectionRadio = '';
  var _currentSelectedPolioRadio = '';


  //selection drop down variable (stores the value of selected input)

  var _currentSelectedMeaslesInjectionDropDown = '';




  TextEditingController DPTDozesController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _currentSelectedRashRadio = _yesNoRadioList[1];
    _currentSelectedRedEyesRadio = _yesNoRadioList[1];
    _currentSelectedMeaslesRadio = _yesNoRadioList[1];
    _currentSelectedThinRadio = _yesNoRadioList[1];
    _currentSelectedSwellingRadio = _yesNoRadioList[1];
    _currentSelectedPaleRadio = _yesNoRadioList[1];
    _currentSelectedNormalGrowthRadio = _yesNoRadioList[1];
    _currentSelectedMultipleIllnessesRadio = _yesNoRadioList[1];
    _currentSelectedBCGInjectionRadio = _yesNoRadioList[0];
    _currentSelectedPolioRadio = _yesNoRadioList[0];


    _currentSelectedMeaslesInjectionDropDown = _measlesInjectionList[0];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death (Pg 4/4)',
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
                              '26A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was there rash all over the body?'
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
                              groupValue: _currentSelectedRashRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedRashRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedRashRadio,
                              onChanged: (String newRadioSelected) {
                                _onRashRadioSelect(newRadioSelected);
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
                              '26B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have red eyes?'
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
                              groupValue: _currentSelectedRedEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRedEyesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedRedEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRedEyesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedRedEyesRadio,
                              onChanged: (String newRadioSelected) {
                                _onRedEyesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '26C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was this measles (use local term)?'
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
                              groupValue: _currentSelectedMeaslesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMeaslesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedMeaslesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMeaslesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedMeaslesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMeaslesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '27. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('During the weeks preceding'
                                ' death, did she/he become very thin?'
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
                              groupValue: _currentSelectedThinRadio,
                              onChanged: (String newRadioSelected) {
                                _onThinRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedThinRadio,
                              onChanged: (String newRadioSelected) {
                                _onThinRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedThinRadio,
                              onChanged: (String newRadioSelected) {
                                _onThinRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '28. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('During the weeks preceding'
                                ' death, did she/he have any swelling'
                                ' of hands, feet or abdomen?'
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
                              groupValue: _currentSelectedSwellingRadio,
                              onChanged: (String newRadioSelected) {
                                _onSwellingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedSwellingRadio,
                              onChanged: (String newRadioSelected) {
                                _onSwellingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedSwellingRadio,
                              onChanged: (String newRadioSelected) {
                                _onSwellingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '29. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('During the weeks preceding'
                                ' death, did she/he suffer from'
                                ' lack of blood or appear pale?'
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
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '29. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('During the weeks preceding'
                                ' death, did she/he suffer from'
                                ' lack of blood or appear pale?'
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
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedPaleRadio,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '30. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Compared to other'
                                ' children of the same age, was'
                                ' she/he growing normally?'
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
                              groupValue: _currentSelectedNormalGrowthRadio,
                              onChanged: (String newRadioSelected) {
                                _onNormalGrowthRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedNormalGrowthRadio,
                              onChanged: (String newRadioSelected) {
                                _onNormalGrowthRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedNormalGrowthRadio,
                              onChanged: (String newRadioSelected) {
                                _onNormalGrowthRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '31A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have multiple illnesses?'
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
                              groupValue: _currentSelectedMultipleIllnessesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMultipleIllnessesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedMultipleIllnessesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMultipleIllnessesRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedMultipleIllnessesRadio,
                              onChanged: (String newRadioSelected) {
                                _onMultipleIllnessesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child:
                              Text('31B.', style: TextStyle(fontSize: 16.0))),
                          Flexible(
                              child: Text(
                                  'If yes, what were the symptoms'
                                      ' associated with these illnesses?'
                                      ' (Check all that apply)',
                                  style: TextStyle(fontSize: 16.0))),
                        ],
                      )),

                  illnessesCheckContainerFun(),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '32A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he receive BCG injection?'
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
                              groupValue: _currentSelectedBCGInjectionRadio,
                              onChanged: (String newRadioSelected) {
                                _onBCGInjectionRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedBCGInjectionRadio,
                              onChanged: (String newRadioSelected) {
                                _onBCGInjectionRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedBCGInjectionRadio,
                              onChanged: (String newRadioSelected) {
                                _onBCGInjectionRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            '32B.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Flexible(
                            child: Text(
                              'Number of dozes received of DPT (DPT-3)?',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: TextFormField(
                                controller: DPTDozesController,
                                validator: (String value) {
                                  if (value.isEmpty)
                                    return 'Please input no. of dozes';
                                },
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                    labelText: 'No. of dozes',
                                    hintText: 'No. of dozes',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0)))))
                      ],
                    ),
                  ),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '32C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he receive'
                                ' polio drops in the mouth?'
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
                              groupValue: _currentSelectedPolioRadio,
                              onChanged: (String newRadioSelected) {
                                _onPolioRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: _currentSelectedPolioRadio,
                              onChanged: (String newRadioSelected) {
                                _onPolioRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: _currentSelectedPolioRadio,
                              onChanged: (String newRadioSelected) {
                                _onPolioRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('32D.', style: TextStyle(fontSize: 16.0))),
                      Flexible(
                          child: Text(
                            'Did she/he receive'
                                ' an injection for measles (use local term)?',
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ]),
                  ),


                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: _measlesInjectionList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentSelectedMeaslesInjectionDropDown,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentSelectedMeaslesInjectionDropDown = newValueSelected;
                        });
                      },
                    ),
                  ),






                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Proceed to Section 3",
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


  void _onRashRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedRashRadio = newRadioSelected;
    });
  }

  void _onRedEyesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedRedEyesRadio = newRadioSelected;
    });
  }

  void _onMeaslesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedMeaslesRadio = newRadioSelected;
    });
  }


  void _onThinRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedThinRadio = newRadioSelected;
    });
  }

  void _onSwellingRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedSwellingRadio = newRadioSelected;
    });
  }

  void _onPaleRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedPaleRadio = newRadioSelected;
    });
  }

  void _onNormalGrowthRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedNormalGrowthRadio = newRadioSelected;
    });
  }

  void _onMultipleIllnessesRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedMultipleIllnessesRadio = newRadioSelected;
    });
  }

  void _onBCGInjectionRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBCGInjectionRadio = newRadioSelected;
    });
  }

  void _onPolioRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedPolioRadio = newRadioSelected;
    });
  }


  Widget illnessesCheckContainerFun(){

    if(_currentSelectedMultipleIllnessesRadio == 'Yes'){
      return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
              children: <Widget>[
                unknownIllnessCheckFun(),
                illnessesCheck(),
              ]
          )
      );
    }

    else {
      _unknownCheck = false;
      return Text('--Not Required--');
    }
  }



  Widget unknownIllnessCheckFun(){

    if(_currentSelectedMultipleIllnessesRadio == 'Yes') {
      return CheckboxListTile(
          value: _unknownCheck,
          title: Text('Unknown'),
          onChanged: (bool value) {
            setState(() {
              _unknownCheck = value;
            });
          });
    }

    else{
      _unknownCheck = false;
      return Text('');
    }
  }


  Widget illnessesCheck() {

    if (_currentSelectedMultipleIllnessesRadio == 'Yes'
        && _unknownCheck == false) {
      return Column(children: <Widget>[
        CheckboxListTile(
            value: _coughCheck,
            title: Text('Cough'),
            onChanged: (bool value) {
              setState(() {
                _coughCheck = value;
              });
            }),
        CheckboxListTile(
            value: _diarrhoeaCheck,
            title: Text('Diarrhoea'),
            onChanged: (bool value) {
              setState(() {
                _diarrhoeaCheck = value;
              });
            }),
        CheckboxListTile(
            value: _earDischargeCheck,
            title: Text('Ear Discharge'),
            onChanged: (bool value) {
              setState(() {
                _earDischargeCheck = value;
              });
            }),
        CheckboxListTile(
            value: _feverCheck,
            title: Text('Fever'),
            onChanged: (bool value) {
              setState(() {
                _feverCheck = value;
              });
            }),
        CheckboxListTile(
            value: _rashesCheck,
            title: Text('Rashes'),
            onChanged: (bool value) {
              setState(() {
                _rashesCheck = value;
              });
            }),
        CheckboxListTile(
            value: _otherCheck,
            title: Text('Other'),
            onChanged: (bool value) {
              setState(() {
                _feverCheck = value;
              });
            }),
      ]);
    } else {
      _coughCheck = false;
      _diarrhoeaCheck = false;
      _earDischargeCheck = false;
      _feverCheck = false;
      _rashesCheck = false;
      _otherCheck = false;
      return Text('');
    }
  }
}