import 'package:flutter/material.dart';
import 'verbal_autopsy_sec2_part2.dart';
import 'user.dart';


//void main() {
//  runApp(MaterialApp(
//    title: 'Section 2: Neonatal Death',
//    home: verbalAutopsySec2Part1(),
//  ));
//}

class verbalAutopsySec2Part1 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec2Part1({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part1State();
  }
}

class _verbalAutopsySec2Part1State extends State<verbalAutopsySec2Part1> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
//  var _currentSelectedInjuryRadio = '';
//  var _currentSelectedDosesRadio = '';
//  var _currentSelectedComplicationsRadio = '';
//  var _currentSelectedSingleMultipleRadio = '';
//  var _currentSelectedDisinfectionRadio = '';


  //current variables for drop down menus (variables storing responses)
//  var _currentSelectedInjuryKind = null;
//  var _currentSelectedBornPlace = '';
//  var _currentSelectedDeliveryAttendant = '';
//
//



  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.injury = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.td = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.complications = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.singleOrMultiple = _singleMultipleList[0];
    widget.verbal_Autopsy_Obj.umbilicalCord = _yesNoRadioList[1];

    widget.verbal_Autopsy_Obj.birthPlace = _bornPlaceList[0];
    widget.verbal_Autopsy_Obj.attendedDelivery = _deliveryAttendantList[0];
  }


  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_name": "Mother had fits"},

      {"category_name": "Excessive (more than normal)"
          " bleeding before/during delivery"},

      {"category_name": "Water broke one or"
          " more days before contractions started"},

      {"category_name": "Prolonged/difficult "
          "labour (12 hours or more)"},

      {"category_name": "Operative delivery"},

      {"category_name": "Mother had fever"},

      {"category_name": "Baby had cord around neck"},

      {"category_name": "Instrumental Delivery"},
    ],
  };



  //controllers for textfeilds
  String pregnancyMonthsController = '';
  String motherAgeController = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Section 2: Neonatal Death'"\n"'(Pg 1/5)',
            style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.verbal_Autopsy_Obj.injury,
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
                                groupValue: widget.verbal_Autopsy_Obj.injury,
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
                                groupValue: widget.verbal_Autopsy_Obj.injury,
                                onChanged: (String newRadioSelected) {
                                  _onInjuryRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //2nd form element
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom:10.0),
                        child: Text(
                          'Details of pregnancy and delivery',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
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
                                  onSaved: (value){pregnancyMonthsController = value;
                                  widget.verbal_Autopsy_Obj.pregnancyDuration =
                                      num.parse(pregnancyMonthsController);},
                                  validator: (String value) {
                                    if (value.isEmpty) return 'Invalid input';
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
                                  onSaved: (value){motherAgeController = value;
                                  widget.verbal_Autopsy_Obj.mothersAge =
                                      num.parse(motherAgeController);},
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
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.verbal_Autopsy_Obj.td,
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
                                groupValue: widget.verbal_Autopsy_Obj.td,
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
                                groupValue: widget.verbal_Autopsy_Obj.td,
                                onChanged: (String newRadioSelected) {
                                  _onDosesRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //7th form element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.verbal_Autopsy_Obj.complications,
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
                                groupValue: widget.verbal_Autopsy_Obj.complications,
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
                                groupValue: widget.verbal_Autopsy_Obj.complications,
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

                    complicationsCheckFun(),


                    //9th form element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('17. ', style: TextStyle(fontSize: 16.0))),

                            Flexible(
                              child:
                              Padding(padding: EdgeInsets.only(top: 0.0),
                                  child: Text(
                                      'Was the child a single or multiple birth?',
                                      style: TextStyle(fontSize: 16.0))),),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Single',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Single',
                                groupValue: widget.verbal_Autopsy_Obj.singleOrMultiple,
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
                                groupValue: widget.verbal_Autopsy_Obj.singleOrMultiple,
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
                                groupValue: widget.verbal_Autopsy_Obj.singleOrMultiple,
                                onChanged: (String newRadioSelected) {
                                  _onSingleMultipleRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //10th form element
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                        value: widget.verbal_Autopsy_Obj.birthPlace,
                        onChanged: (String newValueSelected) {
                          _onBornPlaceSelected(newValueSelected);
                        },
                      ),
                    ),


                    //11th form element
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                        value: widget.verbal_Autopsy_Obj.attendedDelivery,
                        onChanged: (String newValueSelected) {
                          _onDeliveryAttendantSelected(newValueSelected);
                        },
                      ),
                    ),


                    //12th form element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.verbal_Autopsy_Obj.umbilicalCord,
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
                                groupValue: widget.verbal_Autopsy_Obj.umbilicalCord,
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
                                groupValue: widget.verbal_Autopsy_Obj.umbilicalCord,
                                onChanged: (String newRadioSelected) {
                                  _onDisinfectionRadioSelect(newRadioSelected);
                                },
                              )
                            ])),

                    //for testing purpose
//                    Text('${widget.verbal_Autopsy_Obj.complicationsType}'),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          if (widget.verbal_Autopsy_Obj.injury == 'Yes' &&
                              widget.verbal_Autopsy_Obj.kindOfInjury == null) {
                            // The checkbox wasn't checked
                            showSnackBar('Please select option 13B');
                          }
                          if ((_formKey.currentState.validate() &&
                              widget.verbal_Autopsy_Obj.injury == 'Yes' &&
                              widget.verbal_Autopsy_Obj.kindOfInjury != null) ||
                              (_formKey.currentState.validate() &&
                                  widget.verbal_Autopsy_Obj.injury != 'Yes')
                          ) {
                            final FormState form = _formKey.currentState;
                            form.save();
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      verbalAutopsySec2Part2(
                                        verbal_Autopsy_Obj: widget.verbal_Autopsy_Obj,)));
                            });
                          }
                        },
                      ),
                    ),
                  ]))),
        ));
  }

  void _onInjuryRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.injury = newRadioSelected;
    });
  }

  void _onDosesRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.td = newRadioSelected;
    });
  }

  void _onComplicationsRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.complications = newRadioSelected;
    });
  }

  void _onSingleMultipleRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.singleOrMultiple = newRadioSelected;
    });
  }

  void _onDisinfectionRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.umbilicalCord = newRadioSelected;
    });
  }

  void _onDropDownInjurySelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.kindOfInjury = newValueSelected;
    });
  }

  void _onBornPlaceSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.birthPlace = newValueSelected;
    });
  }

  void _onDeliveryAttendantSelected(String newValueSelected) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.attendedDelivery = newValueSelected;
    });
  }

  Widget injuryKindDropDownFun() {
    if (widget.verbal_Autopsy_Obj.injury == 'Yes') {
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
          value: widget.verbal_Autopsy_Obj.kindOfInjury,
          onChanged: (String newValueSelected) {
            _onDropDownInjurySelected(newValueSelected);
          },
        ),
      );
    } else {
      widget.verbal_Autopsy_Obj.kindOfInjury = null;
      return Padding( padding: EdgeInsets.all(10.0),
          child: Text('--Not Required--'));
    }
  }

  Widget complicationsCheckFun() {
    if (widget.verbal_Autopsy_Obj.complications == 'Yes') {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.blue.shade50),
//
          child: Column(children: <Widget>[

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][0]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][0]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][0]['category_name']),
            ),
            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][1]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][1]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][1]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][2]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][2]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][2]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][3]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][3]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][3]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][4]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][4]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][4]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][5]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][5]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][5]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][6]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][6]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][6]['category_name']),
            ),

            CheckboxListTile(
              value: widget.verbal_Autopsy_Obj.complicationsType
                  .contains(_categories['responseBody'][7]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][7]['category_name']);
                debugPrint('${widget.verbal_Autopsy_Obj.complicationsType}');
              },
              title: Text(_categories['responseBody'][7]['category_name']),
            ),
          ]
          ));
    } else {
      widget.verbal_Autopsy_Obj.complicationsType.clear();
      return Padding( padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('--Not Required--'));
    }
  }



  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.verbal_Autopsy_Obj.complicationsType.add(category_name);
      });
    } else {
      setState(() {
        widget.verbal_Autopsy_Obj.complicationsType.remove(category_name);
      });
    }
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
