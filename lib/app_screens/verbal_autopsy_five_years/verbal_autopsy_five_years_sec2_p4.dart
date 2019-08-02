import 'package:flutter/material.dart';
import 'user.dart';
import 'verbal_autopsy_five_years_sec3.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy 5 year Form Section 2',
//    home: verbalAutopsy5YrSec2Part4(),
//  ));
//}

class verbalAutopsy5YrSec2Part4 extends StatefulWidget {
  final User userObj;
  verbalAutopsy5YrSec2Part4({Key key, @required this.userObj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return verbalAutopsy5YrSec2Part4State();
  }
}

class verbalAutopsy5YrSec2Part4State extends State<verbalAutopsy5YrSec2Part4> {
  var _formKey = GlobalKey<FormState>();


  //list for drop down menus
  var _measlesInjectionList = ['Yes-only one', 'Yes-more than one',
    'No-did not recieve any', 'Unknown'];


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //boolean declarations for check boxes
//  bool _coughCheck = false;
//  bool _diarrhoeaCheck = false;
//  bool _earDischargeCheck = false;
//  bool _feverCheck = false;
//  bool _rashesCheck = false;
//  bool _otherCheck = false;
  bool _unknownCheck = false;

  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_name": "Cough"},

      {"category_name": "Diarrhoea"},

      {"category_name": "Ear Discharge"},

      {"category_name": "Fever"},

      {"category_name": "Rashes"},

      {"category_name": "Other"},
    ],
  };



  //selection radio variable (stores the value of selected input)
//  var _currentSelectedRashRadio = '';
//  var _currentSelectedRedEyesRadio = '';
//  var _currentSelectedMeaslesRadio = '';
//  var _currentSelectedThinRadio = '';
//  var _currentSelectedSwellingRadio = '';
//  var _currentSelectedPaleRadio = '';
//  var _currentSelectedNormalGrowthRadio = '';
//  var _currentSelectedMultipleIllnessesRadio = '';
//  var _currentSelectedBCGInjectionRadio = '';
//  var _currentSelectedPolioRadio = '';


  //selection drop down variable (stores the value of selected input)

//  var _currentSelectedMeaslesInjectionDropDown = '';




//  TextEditingController DPTDozesController = TextEditingController();



  @override
  void initState() {
    super.initState();
    widget.userObj.rashAllOverBody = _yesNoRadioList[1];
    widget.userObj.redEyes = _yesNoRadioList[1];
    widget.userObj.measles = _yesNoRadioList[1];
    widget.userObj.thinWeekPreceedingDeath = _yesNoRadioList[1];
    widget.userObj.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath = _yesNoRadioList[1];
    widget.userObj.lackOfBloodWeekPreceedingDeath = _yesNoRadioList[1];
    widget.userObj.growingNormally = _yesNoRadioList[1];
    widget.userObj.multipleIllness = _yesNoRadioList[1];
    widget.userObj.bcgInjection = _yesNoRadioList[0];
    widget.userObj.polioDrops = _yesNoRadioList[0];


    widget.userObj.injectionForMeasles = _measlesInjectionList[0];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death'"\n"'(Pg 4/4)',
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
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
                                fontSize: 18.0, fontWeight: FontWeight.w800),
                          ))),


                  //1st user input element start
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25A.',
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
                              groupValue: widget.userObj.rashAllOverBody,
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
                              groupValue: widget.userObj.rashAllOverBody,
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
                              groupValue: widget.userObj.rashAllOverBody,
                              onChanged: (String newRadioSelected) {
                                _onRashRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //2nd user input element

                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25B.',
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
                              groupValue: widget.userObj.redEyes,
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
                              groupValue: widget.userObj.redEyes,
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
                              groupValue: widget.userObj.redEyes,
                              onChanged: (String newRadioSelected) {
                                _onRedEyesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '25C.',
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
                              groupValue: widget.userObj.measles,
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
                              groupValue: widget.userObj.measles,
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
                              groupValue: widget.userObj.measles,
                              onChanged: (String newRadioSelected) {
                                _onMeaslesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '26. ',
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
                              groupValue: widget.userObj.thinWeekPreceedingDeath,
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
                              groupValue: widget.userObj.thinWeekPreceedingDeath,
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
                              groupValue: widget.userObj.thinWeekPreceedingDeath,
                              onChanged: (String newRadioSelected) {
                                _onThinRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '27. ',
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
                              groupValue: widget.userObj.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath,
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
                              groupValue: widget.userObj.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath,
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
                              groupValue: widget.userObj.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath,
                              onChanged: (String newRadioSelected) {
                                _onSwellingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '28. ',
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
                              groupValue: widget.userObj.lackOfBloodWeekPreceedingDeath,
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
                              groupValue: widget.userObj.lackOfBloodWeekPreceedingDeath,
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
                              groupValue: widget.userObj.lackOfBloodWeekPreceedingDeath,
                              onChanged: (String newRadioSelected) {
                                _onPaleRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '29. ',
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
                              groupValue: widget.userObj.growingNormally,
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
                              groupValue: widget.userObj.growingNormally,
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
                              groupValue: widget.userObj.growingNormally,
                              onChanged: (String newRadioSelected) {
                                _onNormalGrowthRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '30A.',
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
                              groupValue: widget.userObj.multipleIllness,
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
                              groupValue: widget.userObj.multipleIllness,
                              onChanged: (String newRadioSelected) {
                                _onMultipleIllnessesRadioSelect(newRadioSelected);
                                widget.userObj.symptomsOfIllness.clear();
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.multipleIllness,
                              onChanged: (String newRadioSelected) {
                                _onMultipleIllnessesRadioSelect(newRadioSelected);
                                widget.userObj.symptomsOfIllness.clear();
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
                              Text('30B.', style: TextStyle(fontSize: 16.0))),
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
                              '31A.',
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
                              groupValue: widget.userObj.bcgInjection,
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
                              groupValue: widget.userObj.bcgInjection,
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
                              groupValue: widget.userObj.bcgInjection,
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
                            '31B.',
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
                                onSaved: (String value){widget.userObj.dpt3Doses = num.parse(value);},
                                validator: (String value) {
                                  if (value.isEmpty)
                                    return 'Please input dozes';
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
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '31C.',
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
                              groupValue: widget.userObj.polioDrops,
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
                              groupValue: widget.userObj.polioDrops,
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
                              groupValue: widget.userObj.polioDrops,
                              onChanged: (String newRadioSelected) {
                                _onPolioRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('31D.', style: TextStyle(fontSize: 16.0))),
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
                      value: widget.userObj.injectionForMeasles,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.userObj.injectionForMeasles = newValueSelected;
                        });
                      },
                    ),
                  ),


                  //for testing purpose
//                  Text('${widget.userObj.symptomsOfIllness}'),


                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Proceed to next Section",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          final FormState form = _formKey.currentState;
                          form.save();
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsy5YrSec3(
                                      userObj: widget.userObj,
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


  void _onRashRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.rashAllOverBody = newRadioSelected;
    });
  }

  void _onRedEyesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.redEyes = newRadioSelected;
    });
  }

  void _onMeaslesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.measles = newRadioSelected;
    });
  }


  void _onThinRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.thinWeekPreceedingDeath = newRadioSelected;
    });
  }

  void _onSwellingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath = newRadioSelected;
    });
  }

  void _onPaleRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.lackOfBloodWeekPreceedingDeath = newRadioSelected;
    });
  }

  void _onNormalGrowthRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.growingNormally = newRadioSelected;
    });
  }

  void _onMultipleIllnessesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.multipleIllness  = newRadioSelected;
    });
  }

  void _onBCGInjectionRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.bcgInjection = newRadioSelected;
    });
  }

  void _onPolioRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.polioDrops = newRadioSelected;
    });
  }


  Widget illnessesCheckContainerFun(){

    if(widget.userObj.multipleIllness == 'Yes'){
      return Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(
              children: <Widget>[
                illnessesCheck(),
                unknownIllnessCheckFun(),
              ]
          )
      );
    }

    else {
      _unknownCheck = false;
      return Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('--Not Required--'));
    }
  }



  Widget unknownIllnessCheckFun(){

    if(widget.userObj.multipleIllness == 'Yes') {
      return CheckboxListTile(
          value: _unknownCheck,
          title: Text('Unknown'),
          onChanged: (bool value) {
            setState(() {
              _unknownCheck = value;
              widget.userObj.symptomsOfIllness.clear();
              widget.userObj.symptomsOfIllness.add('Unknown');
              if(_unknownCheck == false)
                widget.userObj.symptomsOfIllness.removeLast();
            });
          });
    }
    else{
      _unknownCheck = false;
      return Text('');
    }
  }


  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.userObj.symptomsOfIllness.add(category_name);
      });
    } else {
      setState(() {
        widget.userObj.symptomsOfIllness.remove(category_name);
      });
    }
  }


  Widget illnessesCheck() {

    if (widget.userObj.multipleIllness == 'Yes'
        && _unknownCheck == false) {
      return Column(
          children: <Widget>[
            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][0]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][0]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][0]['category_name']),
            ),
            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][1]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][1]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][1]['category_name']),
            ),

            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][2]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][2]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][2]['category_name']),
            ),

            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][3]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][3]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][3]['category_name']),
            ),

            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][4]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][4]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][4]['category_name']),
            ),

            CheckboxListTile(
              value: widget.userObj.symptomsOfIllness
                  .contains(_categories['responseBody'][5]['category_name']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][5]['category_name']);
                debugPrint('${widget.userObj.symptomsOfIllness}');
              },
              title: Text(_categories['responseBody'][5]['category_name']),
            ),

          ]);
    }

    else{
      return Text('');
    }
  }
}