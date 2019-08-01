import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_2.dart';

class SocialAutopsyB1 extends StatefulWidget {
  final User user;
  SocialAutopsyB1({Key key, this.user}):super(key:key);
  @override
  State createState() => SocialAutopsyB1State();
}

class SocialAutopsyB1State extends State<SocialAutopsyB1> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleRadioValueChange1(String value) {
    setState(() {
      widget.user.seekCareOutside = value;
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      widget.user.ashaAdviceOnHospitalTreatment = value;
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      widget.user.conditionWhenMedical = value;
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (widget.user.seekCareOutside == '')
      _showSnackBar('Please fill a choice');
    else if(widget.user.ashaAdviceOnHospitalTreatment == '' || widget.user.conditionWhenMedical == '')
      _showSnackBar('Please fill the form completely');
    else
      {
        form.save();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (SocialAutopsyB2(user:widget.user))),
        );
      }
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
        width: MediaQuery.of(context).size.width,
        child: Builder(
            builder: (context) => Form(
              key: this._formKey,
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
                      value: 'yes',
                      groupValue: widget.user.seekCareOutside,
                      onChanged: _handleRadioValueChange1,
                    ),
                    RadioListTile(
                      title: Text('No'),
                      value: 'no',
                      groupValue: widget.user.seekCareOutside,
                      onChanged: _handleRadioValueChange1,
                    ),
                    RadioListTile(
                      title: Text("Don't Know"),
                      value: 'dnk',
                      groupValue: widget.user.seekCareOutside,
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
                            value: 'yes',
                            groupValue: widget.user.ashaAdviceOnHospitalTreatment,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Text('Yes'),
                          Radio(
                            value: 'no',
                            groupValue: widget.user.ashaAdviceOnHospitalTreatment,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Text("No"),
                          Radio(
                            value: 'dnk',
                            groupValue: widget.user.ashaAdviceOnHospitalTreatment,
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
                      value: "Active",
                      groupValue: widget.user.conditionWhenMedical,
                      onChanged: _handleRadioValueChange3,
                    ),
                    RadioListTile(
                      title: Text(
                          "Conscious but Drowsy / Inactive / Unable to feed"),
                      value: "Inactive",
                      groupValue: widget.user.conditionWhenMedical,
                      onChanged: _handleRadioValueChange3,
                    ),
                    RadioListTile(
                      title: Text("Unconscious"),
                      value: "Unconscious",
                      groupValue: widget.user.conditionWhenMedical,
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
    if (widget.user.seekCareOutside == 'no') {
      widget.user.quack = false;
      widget.user.traditionalHealer = false;
      widget.user.subCentre = false;
      widget.user.phc = false;
      widget.user.chc = false;
      widget.user.subDistrictHospital = false;
      widget.user.districtGovtHospital = false;
      widget.user.privateAllopathic = false;
      widget.user.doctorAlternateSystem = false;
      widget.user.reasonForSeekingCare = '' ;
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.green.shade50),
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
                    value: widget.user.wasIllnessSerious,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.wasIllnessSerious = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Money not available for treatment'),
                    value: widget.user.moneyNotAvailable,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.moneyNotAvailable = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Family members were not able to accompany'),
                    value: widget.user.familyMembersNotAbleAccompany,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.familyMembersNotAbleAccompany = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Bad weather'),
                    value: widget.user.badWeather,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.badWeather = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Did not know where to take the infant'),
                    value: widget.user.didNotKnowAboutInfant,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.didNotKnowAboutInfant = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('No hope for survival of the infant'),
                    value: widget.user.noHopeForSurvival,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.noHopeForSurvival = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Transport not available'),
                    value: widget.user.transportNotAvailable,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.transportNotAvailable = value;
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
                                  widget.user.others = value;
                                },
                              ))
                        ],
                      ))
                ],
              )));
    }
    else if (widget.user.seekCareOutside == 'yes') {
      widget.user.wasIllnessSerious = false;
      widget.user.moneyNotAvailable = false;
      widget.user.familyMembersNotAbleAccompany = false;
      widget.user.badWeather = false;
      widget.user.didNotKnowAboutInfant = false;
      widget.user.noHopeForSurvival = false;
      widget.user.transportNotAvailable = false;
      widget.user.others ='';
      return Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.green.shade50),
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
                    value: widget.user.quack,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.quack = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Traditional healer/ Religious healer'),
                    value: widget.user.traditionalHealer,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.traditionalHealer = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Subcentre'),
                    value: widget.user.subCentre,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.subCentre = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('PHC'),
                    value: widget.user.phc,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.phc = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('CHC'),
                    value: widget.user.chc,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.chc = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Sub-district hospital'),
                    value: widget.user.subDistrictHospital,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.subDistrictHospital = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('District(Govt.) Hospital'),
                    value: widget.user.districtGovtHospital,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.districtGovtHospital = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Private allopathic doctor'),
                    value: widget.user.privateAllopathic,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.privateAllopathic = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Doctors in alternate system of medicine'),
                    value: widget.user.doctorAlternateSystem,
                    onChanged: (bool value) {
                      setState(() {
                        widget.user.doctorAlternateSystem = value;
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
                                  widget.user.reasonForSeekingCare = value;
                                },
                              ))
                        ],
                      ))
                ],
              )));
    }
    else {
      widget.user.quack = false;
      widget.user.traditionalHealer = false;
      widget.user.subCentre = false;
      widget.user.phc = false;
      widget.user.chc = false;
      widget.user.subDistrictHospital = false;
      widget.user.districtGovtHospital = false;
      widget.user.privateAllopathic = false;
      widget.user.doctorAlternateSystem = false;
      widget.user.reasonForSeekingCare = '' ;
      widget.user.wasIllnessSerious = false;
      widget.user.moneyNotAvailable = false;
      widget.user.familyMembersNotAbleAccompany = false;
      widget.user.badWeather = false;
      widget.user.didNotKnowAboutInfant = false;
      widget.user.noHopeForSurvival = false;
      widget.user.transportNotAvailable = false;
      widget.user.others ='';
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }
}