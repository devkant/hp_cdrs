import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Section 2: Child Death',
    home: verbalAutopsy5YrSec2Part1(),
  ));
}

class verbalAutopsy5YrSec2Part1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsy5YrSec2Part1State();
  }
}

class _verbalAutopsy5YrSec2Part1State extends State<verbalAutopsy5YrSec2Part1> {
  var _formKey = GlobalKey<FormState>();

  //radio lists
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
  var _firstBreastFeed = ['Immediately/within 1 hour of birth',
    'Same day as child was born', 'Second day or later',
    'Never breastfed', 'Unknown'];


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


  //current variables for radio (variables storing responses)
  var _currentSelectedInjuryRadio = '';
  var _currentSelectedOtherFoodRadio = '';
  var _currentSelectedBreastfeedIllnessRadio = '';



  //current variables for drop down menus (variables storing responses)
  var _currentSelectedInjuryKind = null;
  var _currentSelectedFirstBreastFeed = '';


  //checkbox variables




  @override
  void initState() {
    super.initState();
    _currentSelectedInjuryRadio = _yesNoRadioList[1];
    _currentSelectedFirstBreastFeed = _firstBreastFeed[0];
    _currentSelectedOtherFoodRadio = _yesNoRadioList[0];
    _currentSelectedBreastfeedIllnessRadio = _yesNoRadioList[1];
  }


  //controllers for textfeilds


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Section 2: Child death (Pg 1/4)'),
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
                          'Details of baby after birth',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        )),


                    //4th form element
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('14A.', style: TextStyle(fontSize: 16.0))),
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


                    //5th user input element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('14B.', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'Did the child receive anything other '
                                        'than breast milk to drink during the '
                                        'first 6 months of life?',
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
                                groupValue: _currentSelectedOtherFoodRadio,
                                onChanged: (String newRadioSelected) {
                                  _onOtherFoodRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedOtherFoodRadio,
                                onChanged: (String newRadioSelected) {
                                  _onOtherFoodRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedOtherFoodRadio,
                                onChanged: (String newRadioSelected) {
                                  _onOtherFoodRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //6th form element
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                Text('14C.', style: TextStyle(fontSize: 16.0))),
                            Flexible(
                                child: Text(
                                    'During the illness that led to'
                                        ' death, was the child breastfeeding?',
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
                                groupValue: _currentSelectedBreastfeedIllnessRadio,
                                onChanged: (String newRadioSelected) {
                                  _onBreastfeedIllnessRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'No',
                                groupValue: _currentSelectedBreastfeedIllnessRadio,
                                onChanged: (String newRadioSelected) {
                                  _onBreastfeedIllnessRadioSelect(newRadioSelected);
                                },
                              ),
                              Text(
                                'Unknown',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Radio(
                                value: 'Unknown',
                                groupValue: _currentSelectedBreastfeedIllnessRadio,
                                onChanged: (String newRadioSelected) {
                                  _onBreastfeedIllnessRadioSelect(newRadioSelected);
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

  void _onOtherFoodRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedOtherFoodRadio = newRadioSelected;
    });
  }

  void _onBreastfeedIllnessRadioSelect(String newRadioSelected) {
    setState(() {
      this._currentSelectedBreastfeedIllnessRadio = newRadioSelected;
    });
  }


  void _onDropDownInjurySelected(String newValueSelected) {
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
}
