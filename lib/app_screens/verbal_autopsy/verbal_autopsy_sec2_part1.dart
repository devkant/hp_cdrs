import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Section 2: Neonatal Death',
    home: verbalAutopsySec2Part1(),
  ));
}

class verbalAutopsySec2Part1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part1State();
  }
}

class _verbalAutopsySec2Part1State extends State<verbalAutopsySec2Part1> {
  var _formKey = GlobalKey<FormState>();

  //radio lists
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
  var _singleMultipleList = ['Single', 'Multiple', 'Unknown'];


  //drop down lists
  var _kindOfInjuryList = [
    'Road Traffic Injury',
    'Falls',
    'Fall of objects',
    'Burns',
    'Drowning',
    'Poisoning',
    'Bite/Sting',
    'Natural disaster',
    'Himicide/Assault'
  ];
  var _bornPlaceList = [
    'Home',
    'On the way to health facility',
    'PHC/CHC/District hospital',
    'Private hospital',
    'Medical college',
    'Sub center',
    'Other',
    'unknown'
  ];
  var _deliveryAttendantList = [
    'Untrained traditional birth attendant',
    'Trained traditional birth attendant',
    'AHM/Nurse',
    'Allopathic Doctor',
    'None',
    'Other',
    'Unknown'
  ];


  //current variables for radio (variables storing responses)
  var _currentSelectedInjuryRadio = '';
  var _currentSelectedDosesRadio = '';
  var _currentSelectedComplicationsRadio = '';
  var _currentSelectedSingleMultipleRadio = '';
  var _currentSelectedDisinfectionRadio = '';


  //current variables for drop down menus (variables storing responses)
  var _currentSelectedInjuryKind = null;
  var _currentSelectedBornPlace = '';
  var _currentSelectedDeliveryAttendant = '';


  //checkbox variables
  bool _fitsCheck = false;
  bool _deliveryBleedCheck = false;
  bool _waterCheck = false;
  bool _labourCheck = false;
  bool _operativeDeliveryCheck = false;
  bool _feverCheck = false;
  bool _cordAroundNeckCheck = false;
  bool _instrumentalDeliveryCheck = false;



  @override
  void initState() {
    super.initState();
    _currentSelectedInjuryRadio = _yesNoRadioList[1];
    _currentSelectedDosesRadio = _yesNoRadioList[1];
    _currentSelectedComplicationsRadio = _yesNoRadioList[1];
    _currentSelectedSingleMultipleRadio = _singleMultipleList[0];
    _currentSelectedDisinfectionRadio = _yesNoRadioList[0];

    _currentSelectedBornPlace = _bornPlaceList[0];
    _currentSelectedDeliveryAttendant = _deliveryAttendantList[0];
  }


  //controllers for textfeilds
  TextEditingController pregnancyMonthsController = TextEditingController();
  TextEditingController motherAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Section 2: Neonatal Death (Pg 1/6)'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[


                            //1st form element
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('13A.', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Did he/she die from an injury or accident?',
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
                                groupValue: _currentSelectedInjuryRadio,
                                onChanged: (String newRadioSelected) {
                                  _onInjuryRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedInjuryRadio,
                                onChanged: (String newRadioSelected) {
                                  _onInjuryRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedInjuryRadio,
                                onChanged: (String newRadioSelected) {
                                  _onInjuryRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //2nd form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '13B.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Text(
                            'If yes, what kind of injury or accident?',
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    injuryKindDropDownFun(),


                    //3rd form element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0, bottom:10.0),
                        child: Text(
                          'Details of pregnancy and delivery',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        )),


                    //4th form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '14A.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Flexible(
                              child: Text(
                                'How many months long was the pregnancy?',
                                style: TextStyle(fontSize: 16.0),
                              )),
                          Flexible(
                              child: TextFormField(
                                  controller: pregnancyMonthsController,
                                  validator: (String value) {
                                    if (value.isEmpty) return 'Please input months';
                                  },
                                  keyboardType: TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                      labelText: 'Months',
                                      hintText: 'Months',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)))))
                        ],
                      ),
                    ),


                    //5th form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '14B.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Flexible(
                              child: Text(
                                'Mother\'s age (in years):',
                                style: TextStyle(fontSize: 16.0),
                              )),
                          Flexible(
                              child: TextFormField(
                                  controller: motherAgeController,
                                  validator: (String value) {
                                    if (value.isEmpty)
                                      return 'Please input the age';
                                  },
                                  keyboardType: TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                      labelText: 'Age',
                                      hintText: 'Age',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0)))))
                        ],
                      ),
                    ),


                    //6th form element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('15. ', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Did the mother receive 2 doses of Td during pregnancy?',
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
                                groupValue: _currentSelectedDosesRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDosesRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedDosesRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDosesRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedDosesRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDosesRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //7th form element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('16A.', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Were there any complications during '
                                        'the pregnancy, or during labour?',
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
                                groupValue: _currentSelectedComplicationsRadio,
                                onChanged: (String newRadioSelected) {
                                  _onComplicationsRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedComplicationsRadio,
                                onChanged: (String newRadioSelected) {
                                  _onComplicationsRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedComplicationsRadio,
                                onChanged: (String newRadioSelected) {
                                  _onComplicationsRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //8th form element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('16B.', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'If yes, what complication(s) occurred?',
                                    style: TextStyle(fontSize: 16.0))),
                          ],
                        )),


                    //9th form element
                    complicationsCheckFun(),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('17. ', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Was the child a single or multiple birth?',
                                    style: TextStyle(fontSize: 16.0))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Single',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Single',
                                groupValue: _currentSelectedSingleMultipleRadio,
                                onChanged: (String newRadioSelected) {
                                  _onSingleMultipleRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Multiple',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Multiple',
                                groupValue: _currentSelectedSingleMultipleRadio,
                                onChanged: (String newRadioSelected) {
                                  _onSingleMultipleRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedSingleMultipleRadio,
                                onChanged: (String newRadioSelected) {
                                  _onSingleMultipleRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //10th form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('18. ', style: TextStyle(fontSize: 16.0))),
                        Flexible(
                            child: Text(
                              'Where was the baby born?',
                              style: TextStyle(fontSize: 16.0),
                            )),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<String>(
                        items: _bornPlaceList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentSelectedBornPlace,
                        onChanged: (String newValueSelected) {
                          _onBornPlaceSelected(newValueSelected);
                        },
                      ),
                    ),


                    //11th form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('19. ', style: TextStyle(fontSize: 16.0))),
                        Flexible(
                            child: Text(
                              'Who attended the delivery?',
                              style: TextStyle(fontSize: 16.0),
                            )),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<String>(
                        items: _deliveryAttendantList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentSelectedDeliveryAttendant,
                        onChanged: (String newValueSelected) {
                          _onDeliveryAttendantSelected(newValueSelected);
                        },
                      ),
                    ),


                    //12th form element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('20. ', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Was a disinfected or new used to cut the umbilical cord?',
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
                                groupValue: _currentSelectedDisinfectionRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDisinfectionRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedDisinfectionRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDisinfectionRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedDisinfectionRadio,
                                onChanged: (String newRadioSelected) {
                                  _onDisinfectionRadioSelect(newRadioSelected);
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
                  ]))),
        ));
  }

  void _onInjuryRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedInjuryRadio = newRadioSelected;
    });
  }

  void _onDosesRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedDosesRadio = newRadioSelected;
    });
  }

  void _onComplicationsRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedComplicationsRadio = newRadioSelected;
    });
  }

  void _onSingleMultipleRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedSingleMultipleRadio = newRadioSelected;
    });
  }

  void _onDisinfectionRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedDisinfectionRadio = newRadioSelected;
    });
  }

  void _onDropDownInjurySelected(String newValueSelected) {
    setState(() {
      this._currentSelectedInjuryKind = newValueSelected;
    });
  }

  void _onBornPlaceSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedBornPlace = newValueSelected;
    });
  }

  void _onDeliveryAttendantSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedInjuryKind = newValueSelected;
    });
  }

  Widget injuryKindDropDownFun() {
    if (_currentSelectedInjuryRadio == 'Yes') {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: DropdownButton<String>(
          hint: Text('Select here'),
          items: _kindOfInjuryList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: _currentSelectedInjuryKind,
          onChanged: (String newValueSelected) {
            _onDropDownInjurySelected(newValueSelected);
          },
        ),
      );
    } else {
      _currentSelectedInjuryKind = null;
      return Text('--Not Required--');
    }
  }

  Widget complicationsCheckFun() {
    if (_currentSelectedComplicationsRadio == 'Yes') {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(children: <Widget>[
            CheckboxListTile(
                value: _fitsCheck,
                title: Text('Mother had fits'),
                onChanged: (bool value) {
                  setState(() {
                    _fitsCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _deliveryBleedCheck,
                title: Text('Excessive (more than normal) bleeding '
                    'before/during delivery'),
                onChanged: (bool value) {
                  setState(() {
                    _deliveryBleedCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _waterCheck,
                title: Text('Water broke one or more days '
                    'before contractions started'),
                onChanged: (bool value) {
                  setState(() {
                    _waterCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _labourCheck,
                title: Text('Prolonged/difficult labour'
                    ' (12 hours or more)'),
                onChanged: (bool value) {
                  setState(() {
                    _labourCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _operativeDeliveryCheck,
                title: Text('Operative delivery'),
                onChanged: (bool value) {
                  setState(() {
                    _operativeDeliveryCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _feverCheck,
                title: Text('Mother had fever'),
                onChanged: (bool value) {
                  setState(() {
                    _feverCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _cordAroundNeckCheck,
                title: Text('Baby had cord around neck'),
                onChanged: (bool value) {
                  setState(() {
                    _cordAroundNeckCheck = value;
                  });
                }),
            CheckboxListTile(
                value: _instrumentalDeliveryCheck,
                title: Text('Instrumental Delivery'),
                onChanged: (bool value) {
                  setState(() {
                    _instrumentalDeliveryCheck = value;
                  });
                }),
          ]));
    } else {
      _fitsCheck = false;
      _deliveryBleedCheck = false;
      _waterCheck = false;
      _labourCheck = false;
      _operativeDeliveryCheck = false;
      _feverCheck = false;
      _cordAroundNeckCheck = false;
      _instrumentalDeliveryCheck = false;
      return Text('--Not Required--');
    }
  }
}
