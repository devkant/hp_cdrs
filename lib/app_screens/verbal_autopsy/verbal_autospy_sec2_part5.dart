import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 2',
    home: _verbalAutopsyFormSec2Part4(),
  ));
}

class _verbalAutopsyFormSec2Part4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec2Part4State();
  }
}

class _verbalAutopsyFormSec2Part4State extends State<_verbalAutopsyFormSec2Part4> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];



  //selection radio variable (stores the value of selected input)
  var _currentSelectedBuldgeRadio = '';
  var _currentSelectedColdRadio = '';
  var _currentSelectedDiscoloredRadio = '';
  var _currentSelectedYellowPalmsRadio = '';
  var _currentSelectedBloodinStoolsRadio = '';





  @override
  void initState() {
    super.initState();
    _currentSelectedBuldgeRadio = _yesNoRadioList[1];
    _currentSelectedColdRadio = _yesNoRadioList[1];
    _currentSelectedDiscoloredRadio = _yesNoRadioList[1];
    _currentSelectedYellowPalmsRadio = _yesNoRadioList[1];
    _currentSelectedBloodinStoolsRadio = _yesNoRadioList[1];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Neonatal Death (Pg 5/5)',
          style: TextStyle(fontSize: 20.0),
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
                            "Details of sickness at time of death:",
                            style:
                            TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ))),


                  //1st user input element start
                  questionElement('39. ', 'Did he/she have a'
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
                              groupValue: _currentSelectedBuldgeRadio,
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
                              groupValue: _currentSelectedBuldgeRadio,
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
                              groupValue: _currentSelectedBuldgeRadio,
                              onChanged: (String newRadioSelected) {
                                _onBuldgeRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //2nd user input element
                  questionElement('40. ', 'Did the child\'s body '
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
                              groupValue: _currentSelectedColdRadio,
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
                              groupValue: _currentSelectedColdRadio,
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
                              groupValue: _currentSelectedColdRadio,
                              onChanged: (String newRadioSelected) {
                                _onColdRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //3rd user input element
                  questionElement('41. ', 'Were the child\'s hands, legs '
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
                              groupValue: _currentSelectedDiscoloredRadio,
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
                              groupValue: _currentSelectedDiscoloredRadio,
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
                              groupValue: _currentSelectedDiscoloredRadio,
                              onChanged: (String newRadioSelected) {
                                _onDiscoloredRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //4th user input element
                  questionElement('42. ', 'Did he/she have yellow Palms/soles?'),

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
                              groupValue: _currentSelectedYellowPalmsRadio,
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
                              groupValue: _currentSelectedYellowPalmsRadio,
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
                              groupValue: _currentSelectedYellowPalmsRadio,
                              onChanged: (String newRadioSelected) {
                                _onYellowPalmsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  //5th user input element
                  questionElement('43. ', 'Was there blood in the stools?'),

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
                              groupValue: _currentSelectedBloodinStoolsRadio,
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
                              groupValue: _currentSelectedBloodinStoolsRadio,
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
                              groupValue: _currentSelectedBloodinStoolsRadio,
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
                ],
              )),
        ),
      ),
    );
  }


  //question generating widget
  Widget questionElement(String questionNo, String question){

    return Padding(
        padding: EdgeInsets.all(10.0),
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
      this._currentSelectedBuldgeRadio = newRadioSelected;
    });
  }

  void _onColdRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedColdRadio = newRadioSelected;
    });
  }

  void _onDiscoloredRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedDiscoloredRadio = newRadioSelected;
    });
  }

  void _onYellowPalmsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedYellowPalmsRadio = newRadioSelected;
    });
  }

  void _onBloodinStoolsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBloodinStoolsRadio = newRadioSelected;
    });
  }


}