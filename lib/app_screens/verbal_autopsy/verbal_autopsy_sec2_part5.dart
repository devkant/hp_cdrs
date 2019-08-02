import 'package:flutter/material.dart';
import 'verbal_autopsy_sec3.dart';
import 'user.dart';

//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 2',
//    home: _verbalAutopsyFormSec2Part5(),
//  ));
//}

class verbalAutopsySec2Part5 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec2Part5({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec2Part5State();
  }
}

class _verbalAutopsySec2Part5State extends State<verbalAutopsySec2Part5> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //selection radio variable (stores the value of selected input)
//  var _currentSelectedBuldgeRadio = '';
//  var _currentSelectedColdRadio = '';
//  var _currentSelectedDiscoloredRadio = '';
//  var _currentSelectedYellowPalmsRadio = '';
//  var _currentSelectedBloodinStoolsRadio = '';





  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.bulgingFontanelle = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.cold = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.legsDiscoloured = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.yellow = _yesNoRadioList[1];
    widget.verbal_Autopsy_Obj.blood = _yesNoRadioList[1];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death'"\n"'(Pg 5/5)',
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
                  questionElement('38. ', 'Did he/she have a'
                      ' bulging fontanelle (describe)?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.bulgingFontanelle,
                              onChanged: (String newRadioSelected) {
                                _onBuldgeRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.bulgingFontanelle,
                              onChanged: (String newRadioSelected) {
                                _onBuldgeRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.bulgingFontanelle,
                              onChanged: (String newRadioSelected) {
                                _onBuldgeRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //2nd user input element
                  questionElement('39. ', 'Did the child\'s body '
                      'feel cold when touched?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.cold,
                              onChanged: (String newRadioSelected) {
                                _onColdRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.cold,
                              onChanged: (String newRadioSelected) {
                                _onColdRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.cold,
                              onChanged: (String newRadioSelected) {
                                _onColdRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //3rd user input element
                  questionElement('40. ', 'Were the child\'s hands, legs '
                      'or lips discoloured (blue, othercolour)?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.legsDiscoloured,
                              onChanged: (String newRadioSelected) {
                                _onDiscoloredRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.legsDiscoloured,
                              onChanged: (String newRadioSelected) {
                                _onDiscoloredRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.legsDiscoloured,
                              onChanged: (String newRadioSelected) {
                                _onDiscoloredRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //4th user input element
                  questionElement('41. ', 'Did he/she have yellow Palms/soles?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.yellow,
                              onChanged: (String newRadioSelected) {
                                _onYellowPalmsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: widget.verbal_Autopsy_Obj.yellow,
                              onChanged: (String newRadioSelected) {
                                _onYellowPalmsRadioSelect(newRadioSelected);
                              },
                            ),
                            Text(
                              'Unknown',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 'Unknown',
                              groupValue: widget.verbal_Autopsy_Obj.yellow,
                              onChanged: (String newRadioSelected) {
                                _onYellowPalmsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //5th user input element
                  questionElement('42. ', 'Was there blood in the stools?'),

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
                              groupValue: widget.verbal_Autopsy_Obj.blood,
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
                              groupValue: widget.verbal_Autopsy_Obj.blood,
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
                              groupValue: widget.verbal_Autopsy_Obj.blood,
                              onChanged: (String newRadioSelected) {
                                _onBloodinStoolsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),





                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Proceed to Section 3",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    verbalAutopsySec3(
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
  void _onBuldgeRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.bulgingFontanelle = newRadioSelected;
    });
  }

  void _onColdRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.cold = newRadioSelected;
    });
  }

  void _onDiscoloredRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.legsDiscoloured = newRadioSelected;
    });
  }

  void _onYellowPalmsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.yellow = newRadioSelected;
    });
  }

  void _onBloodinStoolsRadioSelect(String newRadioSelected){
    setState(() {
      this.widget.verbal_Autopsy_Obj.blood = newRadioSelected;
    });
  }


}