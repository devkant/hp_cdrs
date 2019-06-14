import 'package:flutter/material.dart';
import 'verbal_autopsy_sec2_part3.dart';
import 'user.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: _verbalAutopsyFormSec2Part2(),
//  ));
//}

class verbalAutopsySec2Part2 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec2Part2({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part2State();
  }
}

class _verbalAutopsySec2Part2State extends State<verbalAutopsySec2Part2> {
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
//  var _currentSelectedBabyCryRadio = '';
//  var _currentSelectedBabyInjuryRadio = '';
//  var _currentSelectedBabyMalformationsRadio = '';
//  var _currentSelectedCryStopRadio = '';
//  var _currentSelectedCryStopDaysRadio = '';
//  var _currentSelectedOtherDrinkRadio = '';
//  var _currentSelectedSuckleRadio = '';
//  var _currentSelectedNormalSuckRadio = '';
//  var _currentSelectedNormalSuckStopRadio = '';


  bool weightCheck = false;


  //selection drop down menu variable (stores the value of selected input)
//  var _currentSelectedBirthSize = '';
//  var _currentSelectedFirstBreastFeed = '';


  //controller obj for text fields
  String birthWeight = '';


  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.moveCryBreathe = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.bruises = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.malformations = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.stopCry = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.otherThanBreastMilk = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.suckleNormally = _yesNoRadioList[1];


    widget.verbal_Autopsy_Obj.size = _birthSizeList[0];
    widget.verbal_Autopsy_Obj.firstBreastfed = _firstBreastFeed[0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death (Pg 2/5)',
          style: TextStyle(fontSize: 18.0),
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
                            "Details of baby after birth",
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
                              groupValue: widget.verbal_Autopsy_Obj.moveCryBreathe,
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
                              groupValue: widget.verbal_Autopsy_Obj.moveCryBreathe,
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
                              groupValue: widget.verbal_Autopsy_Obj.moveCryBreathe,
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
                              groupValue: widget.verbal_Autopsy_Obj.bruises,
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
                              groupValue: widget.verbal_Autopsy_Obj.bruises,
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
                              groupValue: widget.verbal_Autopsy_Obj.bruises,
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
                              groupValue: widget.verbal_Autopsy_Obj.malformations,
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
                              groupValue: widget.verbal_Autopsy_Obj.malformations,
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
                              groupValue: widget.verbal_Autopsy_Obj.malformations,
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
                      value: widget.verbal_Autopsy_Obj.size,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.verbal_Autopsy_Obj.size = newValueSelected;
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

                        childWeight(),
//          Flexible(
//              child: TextFormField(
//                validator: (String value) {
//                    if (value.isEmpty) return 'Please fill a valid input';
//                },
//                  onSaved: (value){birthWeight = value;
//                  widget.verbal_Autopsy_Obj.weight = num.parse(birthWeight);},
//                  keyboardType: TextInputType.numberWithOptions(),
//                  decoration: InputDecoration(
//                      labelText: 'Weight',
//                      hintText: 'Weight (in grams)',
//                      border: OutlineInputBorder(
//                          borderRadius:
//                          BorderRadius.circular(10.0)))))
                      ],
                    ),
                  ),
                  CheckboxListTile(
                      value: weightCheck,
                      title: Text('Unknown'),
                      onChanged: (bool value) {
                        setState(() {
                          weightCheck = value;
                          if(weightCheck == true)
                            widget.verbal_Autopsy_Obj.weight = null;
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
                              groupValue: widget.verbal_Autopsy_Obj.stopCry,
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
                              groupValue: widget.verbal_Autopsy_Obj.stopCry,
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
                              groupValue: widget.verbal_Autopsy_Obj.stopCry,
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
                                'days after birth did he/she stop crying?'
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
                      value: widget.verbal_Autopsy_Obj.firstBreastfed,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.widget.verbal_Autopsy_Obj.firstBreastfed = newValueSelected;
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
                              groupValue: widget.verbal_Autopsy_Obj.otherThanBreastMilk,
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
                              groupValue: widget.verbal_Autopsy_Obj.otherThanBreastMilk,
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
                              groupValue: widget.verbal_Autopsy_Obj.otherThanBreastMilk,
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
                              groupValue: widget.verbal_Autopsy_Obj.suckleNormally,
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
                              groupValue: widget.verbal_Autopsy_Obj.suckleNormally,
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
                              groupValue: widget.verbal_Autopsy_Obj.suckleNormally,
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


//                  Text('${widget.verbal_Autopsy_Obj.weight}'),


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
                        if(_formKey.currentState.validate()) {
                          final FormState form = _formKey.currentState;
                          form.save();
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsySec2Part3(
                                      verbal_Autopsy_Obj: widget
                                          .verbal_Autopsy_Obj,)));
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



  //radio setState functions
  void _onBabyCryRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.moveCryBreathe = newRadioSelected;
    });
  }

  void _onBabyInjuryRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.bruises = newRadioSelected;
    });
  }

  void _onBabyMalformationsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.malformations = newRadioSelected;
    });
  }

  void _onCryStopRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.stopCry = newRadioSelected;
    });
  }

  void _onCryStopDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.daysAfterStoppedCrying = newRadioSelected;
    });
  }

  void _onOtherDrinkRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.otherThanBreastMilk = newRadioSelected;
    });
  }

  void _onSuckleRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.suckleNormally = newRadioSelected;
    });
  }

  void _onNormalSuckSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.StopSuckingInNormalWay = newRadioSelected;
    });
  }

  void _onNormalSuckStopRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.CompletedDays = newRadioSelected;
    });
  }


  //optional menu functions
  Widget childWeight(){

    if(weightCheck == false) {
      return Flexible(
          child: TextFormField(
              onSaved: (value){birthWeight = value;
              widget.verbal_Autopsy_Obj.weight = num.parse(birthWeight);},
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
      birthWeight = null;
      if(birthWeight != null)
        widget.verbal_Autopsy_Obj.weight = num.parse(birthWeight);
      return Text('');
    }
  }

  Widget cryStopRadio(){

    if(widget.verbal_Autopsy_Obj.stopCry == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.daysAfterStoppedCrying,
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
                  groupValue: widget.verbal_Autopsy_Obj.daysAfterStoppedCrying,
                  onChanged: (String newRadioSelected) {
                    _onCryStopDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.daysAfterStoppedCrying = null;
      return Text('--Not Required--');
    }
  }

  Widget normalSuckRadio(){
    if(widget.verbal_Autopsy_Obj.suckleNormally == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.StopSuckingInNormalWay,
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
                  groupValue: widget.verbal_Autopsy_Obj.StopSuckingInNormalWay,
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
                  groupValue: widget.verbal_Autopsy_Obj.StopSuckingInNormalWay,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckSelect(newRadioSelected);
                  },
                )
              ]));
    }
    else {
      widget.verbal_Autopsy_Obj.StopSuckingInNormalWay = null;
      return Text('--Not Required--');
    }
  }

  Widget suckStopRadio(){

    if(widget.verbal_Autopsy_Obj.StopSuckingInNormalWay == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.CompletedDays,
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
                  groupValue: widget.verbal_Autopsy_Obj.CompletedDays,
                  onChanged: (String newRadioSelected) {
                    _onNormalSuckStopRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.CompletedDays = null;
      return Text('--Not Required--');
    }
  }
}