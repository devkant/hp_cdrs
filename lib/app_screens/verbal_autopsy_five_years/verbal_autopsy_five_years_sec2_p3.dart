import 'package:flutter/material.dart';
import 'user.dart';
import 'verbal_autopsy_five_years_sec2_p4.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: verbalAutopsy5YrSec2Part3(),
//  ));
//}

class verbalAutopsy5YrSec2Part3 extends StatefulWidget {
  final User userObj;
  verbalAutopsy5YrSec2Part3({Key key, @required this.userObj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return verbalAutopsy5YrSec2Part3State();
  }
}

class verbalAutopsy5YrSec2Part3State extends State<verbalAutopsy5YrSec2Part3> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //list declarations for drop down menus



  //selection radio variable (stores the value of selected input)
//  var _currentSelectedCoughRadio = '';
//  var _currentSelectedBloodinCoughRadio = '';
//  var _currentSelectedBreathingDifficultyRadio = '';
//  var _currentSelectedFastBreathingRadio = '';
//  var _currentSelectedChestInDrawingRadio = '';
//  var _currentSelectedWheezingRadio = '';
//  var _currentSelectedAbdominalPainRadio = '';
//  var _currentSelectedAbdominalDistentionRadio = '';
//  var _currentSelectedVomitRadio = '';
//  var _currentSelectedYellowEyes = '';



//  TextEditingController coughDaysController = TextEditingController();
//  TextEditingController breathingDifficultyDaysController = TextEditingController();
//  TextEditingController vomitDaysController = TextEditingController();



  @override
  void initState() {
    super.initState();
    widget.userObj.cough = _yesNoRadioList[1];
    widget.userObj.difficultyBreathing = _yesNoRadioList[1];
    widget.userObj.fastBreathing = _yesNoRadioList[1];
    widget.userObj.inDrawingChest = _yesNoRadioList[1];
    widget.userObj.wheezing = _yesNoRadioList[1];
    widget.userObj.abdominalPainDuringIllness = _yesNoRadioList[1];
    widget.userObj.abdominalDistention = _yesNoRadioList[1];
    widget.userObj.vomit = _yesNoRadioList[1];
    widget.userObj.yellowEyesOrSkin = _yesNoRadioList[1];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death'"\n"'(Pg 3/4)',
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
                              '20A.',
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
                              groupValue: widget.userObj.cough,
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
                              groupValue: widget.userObj.cough,
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
                              groupValue: widget.userObj.cough,
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
                              '20B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        coughCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '20C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, was there blood?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                      ])),

                  bloodinCough(),



                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21A.',
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
                              groupValue: widget.userObj.difficultyBreathing,
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
                              groupValue: widget.userObj.difficultyBreathing,
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
                              groupValue: widget.userObj.difficultyBreathing,
                              onChanged: (String newRadioSelected) {
                                _onBreathingDifficultyRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                        breathingDifficultyCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21C.',
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
                              groupValue: widget.userObj.fastBreathing,
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
                              groupValue: widget.userObj.fastBreathing,
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
                              groupValue: widget.userObj.fastBreathing,
                              onChanged: (String newRadioSelected) {
                                _onFastBreathingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21D.',
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
                              groupValue: widget.userObj.inDrawingChest,
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
                              groupValue: widget.userObj.inDrawingChest,
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
                              groupValue: widget.userObj.inDrawingChest,
                              onChanged: (String newRadioSelected) {
                                _onChestInDrawingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '21E.',
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
                              groupValue: widget.userObj.wheezing,
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
                              groupValue: widget.userObj.wheezing,
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
                              groupValue: widget.userObj.wheezing,
                              onChanged: (String newRadioSelected) {
                                _onWheezingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22A.',
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
                              groupValue: widget.userObj.abdominalPainDuringIllness,
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
                              groupValue: widget.userObj.abdominalPainDuringIllness,
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
                              groupValue: widget.userObj.abdominalPainDuringIllness,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalPainRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '22B.',
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
                              groupValue: widget.userObj.abdominalDistention,
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
                              groupValue: widget.userObj.abdominalDistention,
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
                              groupValue: widget.userObj.abdominalDistention,
                              onChanged: (String newRadioSelected) {
                                _onAbdominalDistentionRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '23A.',
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
                              groupValue: widget.userObj.vomit,
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
                              groupValue: widget.userObj.vomit,
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
                              groupValue: widget.userObj.vomit,
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
                              '23B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        vomitCompletedDays(),
                      ])),



                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '24. ',
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
                              groupValue: widget.userObj.yellowEyesOrSkin,
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
                              groupValue: widget.userObj.yellowEyesOrSkin,
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
                              groupValue: widget.userObj.yellowEyesOrSkin,
                              onChanged: (String newRadioSelected) {
                                _onYellowEyesRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



//                  for testing purpose
//                  Text('${widget.userObj.daysCough}'),


                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          final FormState form = _formKey.currentState;
                          form.save();
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsy5YrSec2Part4(
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


  void _onCoughRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.cough = newRadioSelected;
    });
  }

  void _onBloodinCoughRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.bloodInCough = newRadioSelected;
    });
  }

  void _onBreathingDifficultyRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.difficultyBreathing = newRadioSelected;
    });
  }

  void _onFastBreathingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.fastBreathing = newRadioSelected;
    });
  }

  void _onChestInDrawingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.inDrawingChest = newRadioSelected;
    });
  }

  void _onWheezingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.wheezing = newRadioSelected;
    });
  }

  void _onAbdominalPainRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.abdominalPainDuringIllness = newRadioSelected;
    });
  }

  void _onAbdominalDistentionRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.abdominalDistention = newRadioSelected;
    });
  }

  void _onVomitRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.vomit = newRadioSelected;
    });
  }

  void _onYellowEyesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.yellowEyesOrSkin = newRadioSelected;
    });
  }


  Widget coughCompletedDays(){

    if(widget.userObj.cough == 'Yes') {
      return Flexible(
          child: TextFormField(
              onSaved: (String value){widget.userObj.daysCough = num.parse(value);},
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
      widget.userObj.daysCough = null;
      return Text('--Not required--');
    }
  }

  Widget breathingDifficultyCompletedDays(){

    if(widget.userObj.difficultyBreathing == 'Yes') {
      return Flexible(
          child: TextFormField(
              onSaved: (String value){widget.userObj.daysDifficultyBreathing = num.parse(value);},
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
      widget.userObj.daysDifficultyBreathing = null;
      return Text('--Not required--');
    }
  }


  Widget vomitCompletedDays(){

    if(widget.userObj.vomit == 'Yes') {
      return Flexible(
          child: TextFormField(
              onSaved: (String value){widget.userObj.daysVomit = num.parse(value);},
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
      widget.userObj.daysVomit = null;
      return Text('--Not required--');
    }
  }



  Widget bloodinCough(){

    if(widget.userObj.cough == 'Yes') {
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
                  groupValue: widget.userObj.bloodInCough,
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
                  groupValue: widget.userObj.bloodInCough,
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
                  groupValue: widget.userObj.bloodInCough,
                  onChanged: (String newRadioSelected) {
                    _onBloodinCoughRadioSelect(newRadioSelected);
                  },
                )
              ]));
    }

    else{
      widget.userObj.bloodInCough = null;
      return Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('--Not Required--'));
    }

  }

}