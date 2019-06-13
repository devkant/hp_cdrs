import 'package:flutter/material.dart';
import 'verbal_autopsy_sec2_part4.dart';
import 'user.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: _verbalAutopsyFormSec2Part3(),
//  ));
//}

class verbalAutopsySec2Part3 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec2Part3({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part3State();
  }
}

class _verbalAutopsySec2Part3State extends State<verbalAutopsySec2Part3> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
  var _daysRadioList = ['Less than 1 day', '01-28 days'];


  //list declarations for drop down menus
  var _birthSizeList = ['Very small', 'Smaller than average',
    'Average', 'Larger than average', 'Unknown'];


  //selection radio variable (stores the value of selected input)
//  var _currentSelectedFeverRadio = '';
//  var _currentSelectedFeverDaysRadio = '';
//  var _currentSelectedBreathingDifficultyRadio = '';
//  var _currentSelectedBreathingDifficultyDaysRadio = '';
//  var _currentSelectedFastBreathingRadio = '';
//  var _currentSelectedFastBreathingDaysRadio = '';
//  var _currentSelectedInDrawingChestRadio = '';
//  var _currentSelectedCoughRadio = '';
//  var _currentSelectedGruntingRadio = '';
//  var _currentSelectedNostrilFlareRadio = '';



  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.fever = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.difficultyBreathing = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.fastBreathing = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.inDrawingChest = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.cough = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.grunting = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.nostrilsFlare = _yesNoRadioList[1];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death (Pg 3/5)',
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
                              '28A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have fever?'
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
                              groupValue: widget.verbal_Autopsy_Obj.fever,
                              onChanged: (String newRadioSelected) {
                                _onFeverRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.fever,
                              onChanged: (String newRadioSelected) {
                                _onFeverRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.fever,
                              onChanged: (String newRadioSelected) {
                                _onFeverRadioSelect(newRadioSelected);
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
                              '28B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed days did the fever last?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

                  feverDaysRadio(),




                  //3rd user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '29A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have any difficulty with breathing?'
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
                              groupValue: widget.verbal_Autopsy_Obj.difficultyBreathing,
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
                              groupValue: widget.verbal_Autopsy_Obj.difficultyBreathing,
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
                              groupValue: widget.verbal_Autopsy_Obj.difficultyBreathing,
                              onChanged: (String newRadioSelected) {
                                _onBreathingDifficultyRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //4th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '29B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed'
                                ' days did the difficulty with breathing last?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

                  breathingDifficultyDaysRadio(),




                  //5th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '30A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have fast breathing?'
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
                              groupValue: widget.verbal_Autopsy_Obj.fastBreathing,
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
                              groupValue: widget.verbal_Autopsy_Obj.fastBreathing,
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
                              groupValue: widget.verbal_Autopsy_Obj.fastBreathing,
                              onChanged: (String newRadioSelected) {
                                _onFastBreathingRadioSelect(newRadioSelected);
                              },
                            )
                          ])),




                  //6th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '30B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, for how many'
                                ' completed days did the fast breathing last?'
                              ,style: TextStyle(fontSize: 16.0),
                            )
                        )
                      ])),

                  fastBreathingDaysRadio(),




                  //7th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '31. ',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have in-drawing of the chest?'
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
                              groupValue: widget.verbal_Autopsy_Obj.inDrawingChest,
                              onChanged: (String newRadioSelected) {
                                _onInDrawingChestRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.inDrawingChest,
                              onChanged: (String newRadioSelected) {
                                _onInDrawingChestRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.inDrawingChest,
                              onChanged: (String newRadioSelected) {
                                _onInDrawingChestRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //8th user input element
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
                            child: Text('Did he/she have a cough?'
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
                              groupValue: widget.verbal_Autopsy_Obj.cough,
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
                              groupValue: widget.verbal_Autopsy_Obj.cough,
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
                              groupValue: widget.verbal_Autopsy_Obj.cough,
                              onChanged: (String newRadioSelected) {
                                _onCoughRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //9th user input element
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '32B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did he/she have grunting (demonstrate)?'
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
                              groupValue: widget.verbal_Autopsy_Obj.grunting,
                              onChanged: (String newRadioSelected) {
                                _onGruntingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.grunting,
                              onChanged: (String newRadioSelected) {
                                _onGruntingRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.grunting,
                              onChanged: (String newRadioSelected) {
                                _onGruntingRadioSelect(newRadioSelected);
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
                              '32C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did his/her nostrils flare with breathing?'
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
                              groupValue: widget.verbal_Autopsy_Obj.nostrilsFlare,
                              onChanged: (String newRadioSelected) {
                                _onNostrilFlareRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.nostrilsFlare,
                              onChanged: (String newRadioSelected) {
                                _onNostrilFlareRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.nostrilsFlare,
                              onChanged: (String newRadioSelected) {
                                _onNostrilFlareRadioSelect(newRadioSelected);
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
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsySec2Part4(
                                      verbal_Autopsy_Obj: widget.verbal_Autopsy_Obj,)));
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


  void _onFeverRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.fever = newRadioSelected;
    });
  }

  void _onFeverDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.feverDays = newRadioSelected;
    });
  }

  void _onBreathingDifficultyRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.difficultyBreathing = newRadioSelected;
    });
  }

  void _onBreathingDifficultyDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.difficultyBreathingDays = newRadioSelected;
    });
  }

  void _onFastBreathingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.fastBreathing = newRadioSelected;
    });
  }

  void _onFastBreathingDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.fastBreathingDays = newRadioSelected;
    });
  }

  void _onInDrawingChestRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.inDrawingChest = newRadioSelected;
    });
  }

  void _onCoughRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.cough = newRadioSelected;
    });
  }

  void _onGruntingRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.grunting = newRadioSelected;
    });
  }

  void _onNostrilFlareRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.nostrilsFlare = newRadioSelected;
    });
  }


  Widget feverDaysRadio(){

    if(widget.verbal_Autopsy_Obj.fever == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.feverDays,
                  onChanged: (String newRadioSelected) {
                    _onFeverDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: widget.verbal_Autopsy_Obj.feverDays,
                  onChanged: (String newRadioSelected) {
                    _onFeverDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.feverDays = null;
      return Text('--Not Required--');
    }
  }


  Widget breathingDifficultyDaysRadio(){

    if(widget.verbal_Autopsy_Obj.difficultyBreathing == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.difficultyBreathingDays,
                  onChanged: (String newRadioSelected) {
                    _onBreathingDifficultyDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: widget.verbal_Autopsy_Obj.difficultyBreathingDays,
                  onChanged: (String newRadioSelected) {
                    _onBreathingDifficultyDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.difficultyBreathingDays = null;
      return Text('--Not Required--');
    }
  }

  Widget fastBreathingDaysRadio(){

    if(widget.verbal_Autopsy_Obj.fastBreathing == 'Yes'){
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
                  groupValue: widget.verbal_Autopsy_Obj.fastBreathingDays,
                  onChanged: (String newRadioSelected) {
                    _onFastBreathingDaysRadioSelect(newRadioSelected);
                  },
                ),
                Text(
                  '01-28 days',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: '01-28 days',
                  groupValue: widget.verbal_Autopsy_Obj.fastBreathingDays,
                  onChanged: (String newRadioSelected) {
                    _onFastBreathingDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.fastBreathingDays = null;
      return Text('--Not Required--');
    }
  }

}