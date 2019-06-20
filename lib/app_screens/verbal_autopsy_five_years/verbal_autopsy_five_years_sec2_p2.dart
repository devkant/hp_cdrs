import 'package:flutter/material.dart';
import 'user.dart';
import 'verbal_autopsy_five_years_sec2_p3.dart';



//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: _verbalAutopsy5YrSec2Part2(),
//  ));
//}

class verbalAutopsy5YrSec2Part2 extends StatefulWidget {
  final User userObj;
  verbalAutopsy5YrSec2Part2({Key key, @required this.userObj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return verbalAutopsy5YrSec2Part2State();
  }
}

class verbalAutopsy5YrSec2Part2State extends State<verbalAutopsy5YrSec2Part2> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
//  var _daysRadioList = ['Less than 1 day', '01-28 days'];


  //list declarations for drop down menus



  //selection radio variable (stores the value of selected input)
//  var _currentSelectedFeverRadio = '';
//  var _currentSelectedChillRadio = '';
//  var _currentSelectedFitsRadio = '';
//  var _currentSelectedUnconsciousRadio = '';
//  var _currentSelectedBodyStiffnessRadio = '';
//  var _currentSelectedStiffNeckRadio = '';
//  var _currentSelectedDiarrhoeaRadio = '';
//  var _currentSelectedBloodinStoolsRadio = '';



//TextEditingController feverDaysController = TextEditingController();
//TextEditingController diarrhoeaDaysController = TextEditingController();


  @override
  void initState() {
    super.initState();
    widget.userObj.fever = _yesNoRadioList[1];
    widget.userObj.chillsOrRigorsDuringFever = _yesNoRadioList[1];
    widget.userObj.convulsionsOrFits = _yesNoRadioList[1];
    widget.userObj.unconscious = _yesNoRadioList[1];
    widget.userObj.stiffness = _yesNoRadioList[1];
    widget.userObj.stiffneck = _yesNoRadioList[1];
    widget.userObj.diarrhoea = _yesNoRadioList[1];
    widget.userObj.bloodInStools = _yesNoRadioList[1];


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death'"\n"'(Pg 2/4)',
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
                              '15A.',
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
                              groupValue: widget.userObj.fever,
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
                              groupValue: widget.userObj.fever,
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
                              groupValue: widget.userObj.fever,
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
                              '15B.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('If yes, how many completed '
                                'days did the fever last?'
                              ,style: TextStyle(fontSize: 16.0),
                            )),
                        feverCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '15C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was the fever accompanied by'
                                ' chills/rigors?'
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
                              groupValue: widget.userObj.chillsOrRigorsDuringFever,
                              onChanged: (String newRadioSelected) {
                                _onChillRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.userObj.chillsOrRigorsDuringFever,
                              onChanged: (String newRadioSelected) {
                                _onChillRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.chillsOrRigorsDuringFever,
                              onChanged: (String newRadioSelected) {
                                _onChillRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '16 .',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have'
                                ' convulsions or fits?'
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
                              groupValue: widget.userObj.convulsionsOrFits,
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
                              groupValue: widget.userObj.convulsionsOrFits,
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
                              groupValue: widget.userObj.convulsionsOrFits,
                              onChanged: (String newRadioSelected) {
                                _onFitsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '17 .',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was she/he unconscious during the'
                                ' illness that led to death?'
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
                              groupValue: widget.userObj.unconscious,
                              onChanged: (String newRadioSelected) {
                                _onUnconsciousRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.userObj.unconscious,
                              onChanged: (String newRadioSelected) {
                                _onUnconsciousRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.unconscious,
                              onChanged: (String newRadioSelected) {
                                _onUnconsciousRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '18 .',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he develop'
                                ' stiffness of the whole body?'
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
                              groupValue: widget.userObj.stiffness,
                              onChanged: (String newRadioSelected) {
                                _onBodyStiffnessRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.userObj.stiffness,
                              onChanged: (String newRadioSelected) {
                                _onBodyStiffnessRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.stiffness,
                              onChanged: (String newRadioSelected) {
                                _onBodyStiffnessRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '19 .',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have'
                                ' a stiff neck (demonstrate)?'
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
                              groupValue: widget.userObj.stiffneck,
                              onChanged: (String newRadioSelected) {
                                _onStiffNeckRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.userObj.stiffneck,
                              onChanged: (String newRadioSelected) {
                                _onStiffNeckRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.stiffneck,
                              onChanged: (String newRadioSelected) {
                                _onStiffNeckRadioSelect(newRadioSelected);
                              },
                            )
                          ])),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '20A.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Did she/he have diarrhoea'
                                ' (more frequent or more liquid stools)?'
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
                              groupValue: widget.userObj.diarrhoea,
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
                              groupValue: widget.userObj.diarrhoea,
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
                              groupValue: widget.userObj.diarrhoea,
                              onChanged: (String newRadioSelected) {
                                _onDiarrhoeaRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


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
                        diarrhoeaCompletedDays(),
                      ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              '20C.',
                              style: TextStyle(fontSize: 16.0),
                            )),
                        Flexible(
                            child: Text('Was there blood in the stools?'
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
                              groupValue: widget.userObj.bloodInStools,
                              onChanged: (String newRadioSelected) {
                                _onBloodinStoolsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.userObj.bloodInStools,
                              onChanged: (String newRadioSelected) {
                                _onBloodinStoolsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.userObj.bloodInStools,
                              onChanged: (String newRadioSelected) {
                                _onBloodinStoolsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  //for testing purposes
//                  Text('${widget.userObj.daysDiarrhoea}'),



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
                                    verbalAutopsy5YrSec2Part3(
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


  void _onFeverRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.fever = newRadioSelected;
    });
  }

  void _onChillRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.chillsOrRigorsDuringFever = newRadioSelected;
    });
  }

  void _onFitsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.convulsionsOrFits = newRadioSelected;
    });
  }

  void _onUnconsciousRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.unconscious = newRadioSelected;
    });
  }
  void _onBodyStiffnessRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.stiffness = newRadioSelected;
    });
  }

  void _onStiffNeckRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.stiffneck = newRadioSelected;
    });
  }

  void _onDiarrhoeaRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.diarrhoea = newRadioSelected;
    });
  }

  void _onBloodinStoolsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.userObj.bloodInStools = newRadioSelected;
    });
  }



  Widget feverCompletedDays(){

    if(widget.userObj.fever == 'Yes') {
      return Flexible(
          child: TextFormField(
              onSaved: (String value){widget.userObj.daysFeverLast = value;},
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
      widget.userObj.daysFeverLast = null;
      return Text('--Not required--');
    }
  }


  Widget diarrhoeaCompletedDays(){

    if(widget.userObj.diarrhoea == 'Yes') {
      return Flexible(
          child: TextFormField(
              onSaved: (String value){widget.userObj.daysDiarrhoea = value;},
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
      widget.userObj.daysDiarrhoea = null;
      return Text('--Not required--');
    }
  }
}