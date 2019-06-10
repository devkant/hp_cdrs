import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 2',
    home: _verbalAutopsyFormSec2Part3(),
  ));
}

class _verbalAutopsyFormSec2Part3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec2Part3State();
  }
}

class _verbalAutopsyFormSec2Part3State extends State<_verbalAutopsyFormSec2Part3> {
  var _formKey = GlobalKey<FormState>();


  //list declarations for radio buttons
  var _yesNoRadioList = ['Yes', 'No', 'Unknown'];
//  var _daysRadioList = ['Less than 1 day', '01-28 days'];


  //list declarations for drop down menus



  //selection radio variable (stores the value of selected input)
  var _currentSelectedFeverRadio = '';
  var _currentSelectedChillRadio = '';
  var _currentSelectedFitsRadio = '';
  var _currentSelectedUnconsciousRadio = '';
  var _currentSelectedBodyStiffnessRadio = '';
  var _currentSelectedStiffNeckRadio = '';
  var _currentSelectedDiarrhoeaRadio = '';
  var _currentSelectedBloodinStoolsRadio = '';



  TextEditingController feverDaysController = TextEditingController();
  TextEditingController diarrhoeaDaysController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _currentSelectedFeverRadio = _yesNoRadioList[1];
    _currentSelectedChillRadio = _yesNoRadioList[1];
    _currentSelectedFitsRadio = _yesNoRadioList[1];
    _currentSelectedUnconsciousRadio = _yesNoRadioList[1];
    _currentSelectedBodyStiffnessRadio = _yesNoRadioList[1];
    _currentSelectedStiffNeckRadio = _yesNoRadioList[1];
    _currentSelectedDiarrhoeaRadio = _yesNoRadioList[1];
    _currentSelectedBloodinStoolsRadio = _yesNoRadioList[1];


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 2: Child Death (Pg 2/5)',
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
                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedFeverRadio,
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
                              groupValue: _currentSelectedFeverRadio,
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
                              groupValue: _currentSelectedFeverRadio,
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
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedChillRadio,
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
                              groupValue: _currentSelectedChillRadio,
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
                              groupValue: _currentSelectedChillRadio,
                              onChanged: (String newRadioSelected) {
                                _onChillRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedFitsRadio,
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
                              groupValue: _currentSelectedFitsRadio,
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
                              groupValue: _currentSelectedFitsRadio,
                              onChanged: (String newRadioSelected) {
                                _onFitsRadioSelect(newRadioSelected);
                              },
                            )
                          ])),



                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedUnconsciousRadio,
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
                              groupValue: _currentSelectedUnconsciousRadio,
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
                              groupValue: _currentSelectedUnconsciousRadio,
                              onChanged: (String newRadioSelected) {
                                _onUnconsciousRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedBodyStiffnessRadio,
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
                              groupValue: _currentSelectedBodyStiffnessRadio,
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
                              groupValue: _currentSelectedBodyStiffnessRadio,
                              onChanged: (String newRadioSelected) {
                                _onBodyStiffnessRadioSelect(newRadioSelected);
                              },
                            )
                          ])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
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
                              groupValue: _currentSelectedStiffNeckRadio,
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
                              groupValue: _currentSelectedStiffNeckRadio,
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
                              groupValue: _currentSelectedStiffNeckRadio,
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
                              groupValue: _currentSelectedDiarrhoeaRadio,
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
                              groupValue: _currentSelectedDiarrhoeaRadio,
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
                              groupValue: _currentSelectedDiarrhoeaRadio,
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
                ],
              )),
        ),
      ),
    );
  }


  void _onFeverRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedFeverRadio = newRadioSelected;
    });
  }

  void _onChillRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedChillRadio = newRadioSelected;
    });
  }

  void _onFitsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedFitsRadio = newRadioSelected;
    });
  }

  void _onUnconsciousRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedUnconsciousRadio = newRadioSelected;
    });
  }
  void _onBodyStiffnessRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBodyStiffnessRadio = newRadioSelected;
    });
  }

  void _onStiffNeckRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedStiffNeckRadio = newRadioSelected;
    });
  }

  void _onDiarrhoeaRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedDiarrhoeaRadio = newRadioSelected;
    });
  }

  void _onBloodinStoolsRadioSelect(String newRadioSelected){
    setState(() {
      this._currentSelectedBloodinStoolsRadio = newRadioSelected;
    });
  }



  Widget feverCompletedDays(){

    if(_currentSelectedFeverRadio == 'Yes') {
      return Flexible(
          child: TextFormField(
              controller: feverDaysController,
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
      feverDaysController = null;
      return Text('--Not required--');
    }
  }


  Widget diarrhoeaCompletedDays(){

    if(_currentSelectedDiarrhoeaRadio == 'Yes') {
      return Flexible(
          child: TextFormField(
              controller: diarrhoeaDaysController,
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
      diarrhoeaDaysController = null;
      return Text('--Not required--');
    }
  }


}