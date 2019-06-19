import 'package:flutter/material.dart';
import 'verbal_autopsy_sec2_part5.dart';
import 'user.dart';


//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: _verbalAutopsyFormSec2Part4(),
//  ));
//}

class verbalAutopsySec2Part4 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec2Part4({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part4State();
  }
}

class _verbalAutopsySec2Part4State extends State<verbalAutopsySec2Part4> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //selection radio variable (stores the value of selected input)
//  var _currentSelectedDiarrhoeaRadio = '';
//  var _currentSelectedDiarrhoeaDaysRadio = '';
//  var _currentSelectedVomitRadio = '';
//  var _currentSelectedVomitDaysRadio = '';
//  var _currentSelectedUmbilicalDischargeRadio = '';
//  var _currentSelectedRashesRadio = '';
//  var _currentSelectedYellowEyesRadio = '';
//  var _currentSelectedFitsRadio = '';
//  var _currentSelectedUnresponsiveRadio = '';




  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.diarrhoea = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.vomit = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.rednessAroundUmbilicalCord = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.pustulesRashes = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.yellowEyesOrSkin = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.spasmsOrFits = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.unresponsiveOrUnconscious = _yesNoRadioList[1];


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death'"\n"'(Pg 4/5)',
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),),
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
                  questionElement('33A.', 'Did he/she have diarrhoea (frequent'
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
                              groupValue: widget.verbal_Autopsy_Obj.diarrhoea,
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
                              groupValue: widget.verbal_Autopsy_Obj.diarrhoea,
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
                              groupValue: widget.verbal_Autopsy_Obj.diarrhoea,
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
                              groupValue: widget.verbal_Autopsy_Obj.vomit,
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
                              groupValue: widget.verbal_Autopsy_Obj.vomit,
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
                              groupValue: widget.verbal_Autopsy_Obj.vomit,
                              onChanged: (String newRadioSelected) {
                                _onVomitRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //4th user input element
                  questionElement('34B.', 'If yes, for how many '
                      'completed days did he/she vomit?'),

                  vomitDaysRadio(),




                  //5th user input element
                  questionElement('35A.', 'Did he/she have redness around, or '
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
                              groupValue: widget.verbal_Autopsy_Obj.rednessAroundUmbilicalCord,
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
                              groupValue: widget.verbal_Autopsy_Obj.rednessAroundUmbilicalCord,
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
                              groupValue: widget.verbal_Autopsy_Obj.rednessAroundUmbilicalCord,
                              onChanged: (String newRadioSelected) {
                                _onUmbilicalDischargeRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //6th user input element
                  questionElement('35B.', 'Did she/he has some '
                      'pustules/rashes?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.pustulesRashes,
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
                              groupValue: widget.verbal_Autopsy_Obj.pustulesRashes,
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
                              groupValue: widget.verbal_Autopsy_Obj.pustulesRashes,
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
                              groupValue: widget.verbal_Autopsy_Obj.yellowEyesOrSkin,
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
                              groupValue: widget.verbal_Autopsy_Obj.yellowEyesOrSkin,
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
                              groupValue: widget.verbal_Autopsy_Obj.yellowEyesOrSkin,
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
                              groupValue: widget.verbal_Autopsy_Obj.spasmsOrFits,
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
                              groupValue: widget.verbal_Autopsy_Obj.spasmsOrFits,
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
                              groupValue: widget.verbal_Autopsy_Obj.spasmsOrFits,
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
                              groupValue: widget.verbal_Autopsy_Obj.unresponsiveOrUnconscious,
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
                              groupValue: widget.verbal_Autopsy_Obj.unresponsiveOrUnconscious,
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
                              groupValue: widget.verbal_Autopsy_Obj.unresponsiveOrUnconscious,
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
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsySec2Part5(
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


  //question generating widget
  Widget questionElement(String questionNo, String question){

    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
      this.widget.verbal_Autopsy_Obj.diarrhoea = newRadioSelected;
    });
  }

  void _onDiarrhoeaDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.diarrhoeaDays = newRadioSelected;
    });
  }

  void _onVomitRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.vomit = newRadioSelected;
    });
  }

  void _onVomitDaysRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.vomitDays = newRadioSelected;
    });
  }

  void _onUmbilicalDischargeRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.rednessAroundUmbilicalCord = newRadioSelected;
    });
  }

  void _onRashesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.pustulesRashes = newRadioSelected;
    });
  }

  void _onYellowEyesRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.yellowEyesOrSkin = newRadioSelected;
    });
  }


  void _onFitsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.spasmsOrFits = newRadioSelected;
    });
  }

  void _onUnresponsiveRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.unresponsiveOrUnconscious = newRadioSelected;
    });
  }



  //optional widget functions
  Widget diarrhoeaDaysRadio(){

    if(widget.verbal_Autopsy_Obj.diarrhoea == 'Yes'){
      return Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Less than 1 day',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'Less than 1 day',
                  groupValue: widget.verbal_Autopsy_Obj.diarrhoeaDays,
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
                  groupValue: widget.verbal_Autopsy_Obj.diarrhoeaDays,
                  onChanged: (String newRadioSelected) {
                    _onDiarrhoeaDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.diarrhoeaDays = null;
      return Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('--Not Required--'));
    }
  }


  Widget vomitDaysRadio(){

    if(widget.verbal_Autopsy_Obj.vomit == 'Yes'){
      return Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Less than 1 day',
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                  value: 'Less than 1 day',
                  groupValue: widget.verbal_Autopsy_Obj.vomitDays,
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
                  groupValue: widget.verbal_Autopsy_Obj.vomitDays,
                  onChanged: (String newRadioSelected) {
                    _onVomitDaysRadioSelect(newRadioSelected);
                  },
                ),
              ]));}

    else {
      widget.verbal_Autopsy_Obj.vomitDays = null;
      return Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('--Not Required--'));
    }
  }

}