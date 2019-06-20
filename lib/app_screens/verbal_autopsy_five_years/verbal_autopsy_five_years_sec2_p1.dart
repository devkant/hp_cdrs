import 'package:flutter/material.dart';
import 'user.dart';
import 'verbal_autopsy_five_years_sec2_p2.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Section 2: Child Death',
//    home: verbalAutopsy5YrSec2Part1(),
//  ));
//}

class verbalAutopsy5YrSec2Part1 extends StatefulWidget {
  final User userObj;
  verbalAutopsy5YrSec2Part1({Key key, @required this.userObj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsy5YrSec2Part1State();
  }
}

class _verbalAutopsy5YrSec2Part1State extends State<verbalAutopsy5YrSec2Part1> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
//  var _currentSelectedInjuryRadio = '';
//  var _currentSelectedOtherFoodRadio = '';
//  var _currentSelectedBreastfeedIllnessRadio = '';



  //current variables for drop down menus (variables storing responses)
//  var _currentSelectedInjuryKind = null;
//  var _currentSelectedFirstBreastFeed = '';


  //checkbox variables




  @override
  void initState() {
    super.initState();
    widget.userObj.injury = _yesNoRadioList[1];
    widget.userObj.firstBreastfed = _firstBreastFeed[0];
    widget.userObj.otherThanBreastMilk = _yesNoRadioList[0];
    widget.userObj.breastMilkDuringIllness = _yesNoRadioList[1];
  }


  //controllers for textfeilds


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Section 2: Child death'"\n"'(Pg 1/4)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),),
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
                                groupValue: widget.userObj.injury,
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
                                groupValue: widget.userObj.injury,
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
                                groupValue: widget.userObj.injury,
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
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom:10.0),
                        child: Text(
                          'Details of baby after birth',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        )),


                    //4th form element
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                    Container(
                        width: 230.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            items: _firstBreastFeed.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: widget.userObj.firstBreastfed,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this.widget.userObj.firstBreastfed = newValueSelected;
                              });
                            },
                          ),
                        )),


                    //5th user input element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.userObj.otherThanBreastMilk,
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
                                groupValue: widget.userObj.otherThanBreastMilk,
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
                                groupValue: widget.userObj.otherThanBreastMilk,
                                onChanged: (String newRadioSelected) {
                                  _onOtherFoodRadioSelect(newRadioSelected);
                                },
                              )
                            ])),


                    //6th form element
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                groupValue: widget.userObj.breastMilkDuringIllness,
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
                                groupValue: widget.userObj.breastMilkDuringIllness,
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
                                groupValue: widget.userObj.breastMilkDuringIllness,
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
                          if (widget.userObj.injury == 'Yes' &&
                              widget.userObj.kindOfInjury == null) {
                            // The checkbox wasn't checked
                            showSnackBar('Please select option 13B');
                          }
                          if ((_formKey.currentState.validate() &&
                              widget.userObj.injury == 'Yes' &&
                              widget.userObj.kindOfInjury != null) ||
                              (_formKey.currentState.validate() &&
                                  widget.userObj.injury != 'Yes')
                          ) {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      verbalAutopsy5YrSec2Part2(
                                        userObj : widget.userObj,)));
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
      this.widget.userObj.injury = newRadioSelected;
    });
  }

  void _onOtherFoodRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.userObj.otherThanBreastMilk = newRadioSelected;
    });
  }

  void _onBreastfeedIllnessRadioSelect(String newRadioSelected) {
    setState(() {
      this.widget.userObj.breastMilkDuringIllness= newRadioSelected;
    });
  }


  void _onDropDownInjurySelected(String newValueSelected) {
    setState(() {
      this.widget.userObj.kindOfInjury = newValueSelected;
    });
  }



  Widget injuryKindDropDownFun() {
    if (widget.userObj.injury == 'Yes') {
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
          value: widget.userObj.kindOfInjury,
          onChanged: (String newValueSelected) {
            _onDropDownInjurySelected(newValueSelected);
          },
        ),
      );
    } else {
      widget.userObj.kindOfInjury = null;
      return Text('--Not Required--');
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
