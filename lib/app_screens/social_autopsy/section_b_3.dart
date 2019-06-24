import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_4.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB3 extends StatefulWidget {
  final User user;
  SocialAutopsyB3({Key key, this.user}):super(key:key);
  @override
  State createState() => SocialAutopsyB3State();
}

class SocialAutopsyB3State extends State<SocialAutopsyB3> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    form.save();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => (SocialAutopsyB4(user:widget.user))),
    );
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('13.6'),
                                    title: Text(
                                        'Mode of transport from one institution to other (Government) and distance in KMs'),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'First Health Facility',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                              onSaved: (value) {
                                                if(value != null) widget.user.transportModeInGovt[0] = value;
                                              },))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution I',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInGovt[1] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution II',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInGovt[2] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution III',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInGovt[3] = value;
                                                }))
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('13.7'),
                                    title: Text(
                                        'Mode of transport from one institution to other (Private) and distance in KMs'),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'First Health Facility',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInPrivate[0] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution I',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInPrivate[1] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution II',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInPrivate[2] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution III',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.transportModeInPrivate[3] = value;
                                                }))
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('13.8'),
                                    title: Text(
                                        'If baby was taken to any institution other than referred, state the reasons'),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'First Health Facility',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitution[0] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution I',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitution[1] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution II',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitution[2] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution III',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitution[3] = value;
                                                }))
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('13.9'),
                                    title: Text(
                                        'If baby was taken to any institution other than referred, who took this decision (eg; doctor, caregiver, relatives etc.)'),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'First Health Facility',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitutionDecision[0] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution I',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitutionDecision[1] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution II',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitutionDecision[2] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution III',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.reasonForOtherInstitutionDecision[3] = value;
                                                }))
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('13.10'),
                                    title: Text(
                                        'Time taken to initiate treatment in the institution on reaching the hospital'),
                                    subtitle: Text('(in minutes)'),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          'First Health Facility',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .number,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.timeTakenForTreatment[0] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution I',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .number,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.timeTakenForTreatment[1] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution II',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .number,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.timeTakenForTreatment[2] = value;
                                                }))
                                      ]),
                                      TableRow(children: [
                                        Text(
                                          'Referral Institution III',
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.left,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .number,
                                                decoration: InputDecoration(
                                                    labelText: 'Type..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8.0))),
                                                onSaved: (value) {
                                                  if(value != null) widget.user.timeTakenForTreatment[3] = value;
                                                }))
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(children: <Widget>[
                                ListTile(
                                  leading: Text('13.11.1'),
                                  title: Text(
                                      'Reasons for the delay in initiating treatment (Use your judgement in arriving the reasons)'),
                                  subtitle: Text('(First Health Facility)'),
                                ),
                                CheckboxListTile(
                                  title: Text('Informal Payment'),
                                  value: widget.user.informalPayment[0],
                                  onChanged: (value) {
                                      setState(() {
                                        widget.user.informalPayment[0] = value;
                                      });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: widget.user.mobilizingSpecialists[0],
                                    onChanged: (value) {
                                    setState(() {
                                      widget.user.mobilizingSpecialists[0] = value;
                                    });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: widget.user.workersNotAvailable[0],
                                    onChanged: (value) {
                                    setState(() {
                                      widget.user.workersNotAvailable[0] = value;
                                    });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: widget.user.patientRush[0],
                                    onChanged: (value) {
                                    setState(() {
                                      widget.user.patientRush[0] = value;
                                    });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: widget.user.doctorNotAvailable[0],
                                    onChanged: (value) {
                                    setState(() {
                                      widget.user.doctorNotAvailable[0] = value;
                                    });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: widget.user.moneyProblem[0],
                                    onChanged: (value) {setState(() {
                                      widget.user.moneyProblem[0] = value;
                                    });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: widget.user.investigationsNotDone[0],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.investigationsNotDone[0] = value;
                                      });
                                    }
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                        onSaved: (value) {
                                if(value != null) widget.user.otherProblem[0] = value;
                                }))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(children: <Widget>[
                                ListTile(
                                  leading: Text('13.11.2'),
                                  title: Text(
                                      'Reasons for the delay in initiating treatment (Use your judgement in arriving the reasons)'),
                                  subtitle: Text('(Referral Institution I)'),
                                ),
                                CheckboxListTile(
                                  title: Text('Informal Payment'),
                                  value: widget.user.informalPayment[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.informalPayment[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: widget.user.mobilizingSpecialists[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.mobilizingSpecialists[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: widget.user.workersNotAvailable[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.workersNotAvailable[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: widget.user.patientRush[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.patientRush[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: widget.user.doctorNotAvailable[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.doctorNotAvailable[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: widget.user.moneyProblem[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.moneyProblem[1] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: widget.user.investigationsNotDone[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.investigationsNotDone[1] = value;
                                      });
                                    }
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0))),
                                        onSaved: (value) {
                                          if(value != null) widget.user.otherProblem[1] = value;
                                        }))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(children: <Widget>[
                                ListTile(
                                  leading: Text('13.11.3'),
                                  title: Text(
                                      'Reasons for the delay in initiating treatment (Use your judgement in arriving the reasons)'),
                                  subtitle: Text('(Referral Institution II)'),
                                ),
                                CheckboxListTile(
                                  title: Text('Informal Payment'),
                                  value: widget.user.informalPayment[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.informalPayment[2] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: widget.user.mobilizingSpecialists[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.mobilizingSpecialists[2] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: widget.user.workersNotAvailable[2] ,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.workersNotAvailable[2] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: widget.user.patientRush[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.patientRush[2] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: widget.user.doctorNotAvailable[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.doctorNotAvailable[2] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: widget.user.moneyProblem[2],
                                    onChanged: (value) {
                                     setState(() {
                                       widget.user.moneyProblem[2] = value;
                                     });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: widget.user.investigationsNotDone[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.investigationsNotDone[2] = value;
                                      });
                                    }
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0))),
                                        onSaved: (value) {
                                          if(value != null) widget.user.otherProblem[2] = value;
                                        }))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50),
                              margin: EdgeInsets.all(10.0),
                              child: Column(children: <Widget>[
                                ListTile(
                                  leading: Text('13.11.4'),
                                  title: Text(
                                      'Reasons for the delay in initiating treatment (Use your judgement in arriving the reasons)'),
                                  subtitle: Text('(Referral Institution III)'),
                                ),
                                CheckboxListTile(
                                  title: Text('Informal Payment'),
                                  value: widget.user.informalPayment[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.informalPayment[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: widget.user.mobilizingSpecialists[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.mobilizingSpecialists[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: widget.user.workersNotAvailable[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.workersNotAvailable[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: widget.user.patientRush[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.patientRush[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: widget.user.doctorNotAvailable[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.doctorNotAvailable[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: widget.user.moneyProblem[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.moneyProblem[3] = value;
                                      });
                                    }
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: widget.user.investigationsNotDone[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.investigationsNotDone[3] = value;
                                      });
                                    }
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0))),
                                        onSaved: (value) {
                                          if(value != null) widget.user.otherProblem[3] = value;
                                        }))
                              ]),
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
                            )
                          ],
                        ),
                      ),
                    ))));
  }
}
