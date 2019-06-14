import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB1 extends StatefulWidget {
  @override
  State createState() => SocialAutopsyB1State();
}

class SocialAutopsyB1State extends State<SocialAutopsyB1> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

  void _handleRadioValueChange1(int value) {
    setState(() {
      _user.careOutsideHome = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _user.adviceOnHospitalTreatment = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _user.conditionOfInfantAtConsultation = value;
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (_user.careOutsideHome < 0)
      _showSnackBar('Please fill a choice');
    else if(_user.adviceOnHospitalTreatment == -1 || _user.conditionOfInfantAtConsultation == -1)
      _showSnackBar('Please fill the form completely');
    else
      form.save();
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Treatment seeking history'),
      ),
      body: Container(
        child: Builder(
            builder: (context) => Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text('9.'),
                          title: Text(
                              'During the illness that led to death, did you seek care outside the home for the infant'),
                        ),
                        RadioListTile(
                          title: Text('Yes'),
                          value: 1,
                          groupValue: _user.careOutsideHome,
                          onChanged: _handleRadioValueChange1,
                        ),
                        RadioListTile(
                          title: Text('No'),
                          value: 0,
                          groupValue: _user.careOutsideHome,
                          onChanged: _handleRadioValueChange1,
                        ),
                        RadioListTile(
                          title: Text("Don't Know"),
                          value: 2,
                          groupValue: _user.careOutsideHome,
                          onChanged: _handleRadioValueChange1,
                        ),
                        _handleCareOutsideHome(),
                        ListTile(
                          leading: Text('11.'),
                          title: Text(
                              'Did ASHA/ AWW/ VHN/ ANM advice on hospital treatment?'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _user.adviceOnHospitalTreatment,
                                onChanged: _handleRadioValueChange2,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 0,
                                groupValue: _user.adviceOnHospitalTreatment,
                                onChanged: _handleRadioValueChange2,
                              ),
                              Text("No"),
                              Radio(
                                value: 2,
                                groupValue: _user.adviceOnHospitalTreatment,
                                onChanged: _handleRadioValueChange2,
                              ),
                              Text("Don't know"),
                            ]),
                        ListTile(
                          leading: Text('12.'),
                          title: Text(
                              'What was the condition of the infant at the time when it was decided for medical consultation?'),
                          subtitle: Text(
                              'Tick if any of the condition mentioned in the options are present'),
                        ),
                        RadioListTile(
                          title: Text("Alert / Active / feeding"),
                          value: 0,
                          groupValue: _user.conditionOfInfantAtConsultation,
                          onChanged: _handleRadioValueChange3,
                        ),
                        RadioListTile(
                          title: Text(
                              "Conscious but Drowsy / Inactive / Unable to feed"),
                          value: 1,
                          groupValue: _user.conditionOfInfantAtConsultation,
                          onChanged: _handleRadioValueChange3,
                        ),
                        RadioListTile(
                          title: Text("Unconscious"),
                          value: 2,
                          groupValue: _user.conditionOfInfantAtConsultation,
                          onChanged: _handleRadioValueChange3,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(
                            onPressed: () {
                              _handleSubmitted();
                            },
                            child: Text(
                              'Proceed to the next section',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  Widget _handleCareOutsideHome() {
    if (_user.careOutsideHome == 0) {
      _user.quack = false;
      _user.traditionalHealer = false;
      _user.subCentre = false;
      _user.phc = false;
      _user.chc = false;
      _user.subDistrictHospital = false;
      _user.districtGovtHospital = false;
      _user.privateAllopathic = false;
      _user.doctorAlternateSystem = false;
      _user.reasonForSeekingCare = '' ;
      return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.green.shade50,
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                  child: ListTile(
                    title: Text('What were the reasons for not seeking care?'),
                  )),
              CheckboxListTile(
                title: Text('Did not think that the illness was serious'),
                value: _user.illnessWasSerious,
                onChanged: (bool value) {
                  setState(() {
                    _user.illnessWasSerious = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Money not available for treatment'),
                value: _user.moneyAvailable,
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyAvailable = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Family members were not able to accompany'),
                value: _user.familyAbleToAccompany,
                onChanged: (bool value) {
                  setState(() {
                    _user.familyAbleToAccompany = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Bad weather'),
                value: _user.badWeather,
                onChanged: (bool value) {
                  setState(() {
                    _user.badWeather = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Did not know where to take the infant'),
                value: _user.whereToTakeInfant,
                onChanged: (bool value) {
                  setState(() {
                    _user.whereToTakeInfant = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('No hope for survival of the infant'),
                value: _user.noHopesOfSurvival,
                onChanged: (bool value) {
                  setState(() {
                    _user.noHopesOfSurvival = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Transport not available'),
                value: _user.transportAvailability,
                onChanged: (bool value) {
                  setState(() {
                    _user.transportAvailability = value;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text('Others (specify)',
                              style: TextStyle(fontSize: 16.0))),
                      Flexible(
                          child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        onSaved: (value) {
                          _user.othersNo = value;
                        },
                      ))
                    ],
                  ))
            ],
          )));
    }
    else if (_user.careOutsideHome == 1) {
      _user.illnessWasSerious = false;
      _user.moneyAvailable = false;
      _user.familyAbleToAccompany = false;
      _user.badWeather = false;
      _user.whereToTakeInfant = false;
      _user.noHopesOfSurvival = false;
      _user.transportAvailability = false;
      _user.othersNo ='';
      return Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.green.shade50,
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                      child: ListTile(
                        leading: Text('10.'),
                        title: Text('Where or from whom did you seek care'),
                      )),
                  CheckboxListTile(
                    title: Text('Quack/informal service providers'),
                    value: _user.quack,
                    onChanged: (bool value) {
                      setState(() {
                        _user.quack = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Traditional healer/ Religious healer'),
                    value: _user.traditionalHealer,
                    onChanged: (bool value) {
                      setState(() {
                        _user.traditionalHealer = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Subcentre'),
                    value: _user.subCentre,
                    onChanged: (bool value) {
                      setState(() {
                        _user.subCentre = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('PHC'),
                    value: _user.phc,
                    onChanged: (bool value) {
                      setState(() {
                        _user.phc = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('CHC'),
                    value: _user.chc,
                    onChanged: (bool value) {
                      setState(() {
                        _user.chc = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Sub-district hospital'),
                    value: _user.subDistrictHospital,
                    onChanged: (bool value) {
                      setState(() {
                        _user.subDistrictHospital = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('District(Govt.) Hospital'),
                    value: _user.districtGovtHospital,
                    onChanged: (bool value) {
                      setState(() {
                        _user.districtGovtHospital = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Private allopathic doctor'),
                    value: _user.privateAllopathic,
                    onChanged: (bool value) {
                      setState(() {
                        _user.privateAllopathic = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Doctors in alternate system of medicine'),
                    value: _user.doctorAlternateSystem,
                    onChanged: (bool value) {
                      setState(() {
                        _user.doctorAlternateSystem = value;
                      });
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Reason for seeking \ncare from there:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration:
                                InputDecoration(border: OutlineInputBorder()),
                                onSaved: (value) {
                                  _user.reasonForSeekingCare = value;
                                },
                              ))
                        ],
                      ))
                ],
              )));
    }
    else
      return Container(
        height: 0.0,
        width: 0.0,
      );
  }
}
