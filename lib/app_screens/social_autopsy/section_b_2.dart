import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_3.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB2 extends StatefulWidget {
   final User user;
   SocialAutopsyB2({Key key, this.user}) : super(key: key);
  //SocialAutopsyB2(this.user);
  @override
  State createState() => SocialAutopsyB2State();
}

class SocialAutopsyB2State extends State<SocialAutopsyB2> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String firstHealthFacilityNilFirstAid = '';
  String referralInstitutionINilFirstAid = '';
  String referralInstitutionIINilFirstAid = '';
  String referralInstitutionIIINilFirstAid = '';
  String firstHealthFacilitySpecialistAndEquipment = '';
  String referralInstitutionISpecialistAndEquipment = '';
  String referralInstitutionIISpecialistAndEquipment = '';
  String referralInstitutionIIISpecialistAndEquipment = '';



  void _handleRadioValueChange1(String value) {
    setState(() {
      firstHealthFacilityNilFirstAid = value;
      if (value == 'NIL') {
        widget.user.nil.add('First Health Facility');
        widget.user.firstAid.remove('First Health Facility');
      } else if(value == 'FirstAid') {
        widget.user.firstAid.add('First Health Facility');
        widget.user.nil.remove('First Health Facility');
      }
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      referralInstitutionINilFirstAid = value;
      if (value == 'NIL') {
        widget.user.nil.add('Referral Institution I');
        widget.user.firstAid.remove('Referral Institution I');
      } else if(value == 'FirstAid') {
        widget.user.firstAid.add('Referral Institution I');
        widget.user.nil.remove('Referral Institution I');
      }
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      referralInstitutionIINilFirstAid = value;
      if (value == 'NIL') {
        widget.user.nil.add('Referral Institution II');
        widget.user.firstAid.remove('Referral Institution II');
      } else if(value == 'FirstAid') {
        widget.user.firstAid.add('Referral Institution II');
        widget.user.nil.remove('Referral Institution II');
      }
    });
  }

  void _handleRadioValueChange4(String value) {
    setState(() {
      referralInstitutionIIINilFirstAid = value;
      if (value == 'NIL') {
        widget.user.nil.add('Referral Institution III');
        widget.user.firstAid.remove('Referral Institution III');
      } else if(value == 'FirstAid') {
        widget.user.firstAid.add('Referral Institution III');
        widget.user.nil.remove('Referral Institution III');
      }
    });
  }

  void _handleRadioValueChange5(String value) {
    setState(() {
      firstHealthFacilitySpecialistAndEquipment = value;
      if (value == 'Specialist') {
        widget.user.lackOfSpecialists.add('First Health Facility');
        widget.user.lackOfEquipments.remove('First Health Facility');
      } else if(value == 'Equipment') {
        widget.user.lackOfEquipments.add('First Health Facility');
        widget.user.lackOfSpecialists.remove('First Health Facility');
      }
    });
  }

  void _handleRadioValueChange6(String value) {
    setState(() {
      referralInstitutionISpecialistAndEquipment = value;
      if (value == 'Specialist') {
        widget.user.lackOfSpecialists.add('First Health Facility');
        widget.user.lackOfEquipments.remove('First Health Facility');
      } else if(value == 'Equipment') {
        widget.user.lackOfEquipments.add('First Health Facility');
        widget.user.lackOfSpecialists.remove('First Health Facility');
      }
    });
  }

  void _handleRadioValueChange7(String value) {
    setState(() {
      referralInstitutionIISpecialistAndEquipment = value;
      if (value == 'Specialist') {
        widget.user.lackOfSpecialists.add('First Health Facility');
        widget.user.lackOfEquipments.remove('First Health Facility');
      } else if(value == 'Equipment') {
        widget.user.lackOfEquipments.add('First Health Facility');
        widget.user.lackOfSpecialists.remove('First Health Facility');
      }
    });
  }

  void _handleRadioValueChange8(String value) {
    setState(() {
      referralInstitutionIIISpecialistAndEquipment = value;
      if (value == 'Specialist') {
        widget.user.lackOfSpecialists.add('First Health Facility');
        widget.user.lackOfEquipments.remove('First Health Facility');
      } else if(value == 'Equipment') {
        widget.user.lackOfEquipments.add('First Health Facility');
        widget.user.lackOfSpecialists.remove('First Health Facility');
      }
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if(form.validate())
    form.save();
    print(widget.user.Hospital);
    print(widget.user.timeTaken);
    print(widget.user.nil);
    print(widget.user.firstAid);
    print(widget.user.otherspecify);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (SocialAutopsyB3(user:widget.user))),
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
            child: Builder(
                builder: (context) => Form(
                  key: this._formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                      ListTile(
                        leading: Text('13.'),
                        title: Text(
                            'Problems faced by the parents in getting treatment in the health facility:'),
                        subtitle: Text(
                            'Now I will ask you questions related to problems you might have faced in getting the treatment from various health facilities.'),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            /*border: Border(top: BorderSide(), bottom: BorderSide() ),*/ color:
                                Colors.green.shade50),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.1'),
                              title: Text(
                                  'Specify in which hospital you took the baby first and then where was the baby taken thereafter?'),
                              subtitle: Text(
                                  'Name, type of the Institution/ hospital/ health centre'),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                            labelText: 'Type..',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                        onSaved: (value) {
                                          widget.user.Hospital.add(value);
                                        },
                                      ))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution I',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.Hospital.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution II',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.Hospital.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution III',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.Hospital.add(value);
                                          }))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.2'),
                              title: Text(
                                  'Specify the problem / complication with which baby was taken to this facility'),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.problem.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution I',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.problem.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution II',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.problem.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution III',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.problem.add(value);
                                          }))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.3'),
                              title: Text(
                                  'Total time taken from the onset of the problem to reach this facility'),
                              subtitle: Text('(in hours)'),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.timeTaken.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution I',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.timeTaken.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution II',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.timeTaken.add(value);
                                          }))
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Referral Institution III',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          onSaved: (value) {
                                            widget.user.timeTaken.add(value);
                                          }))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.4.1'),
                              title: Text(
                                  'Type of treatment received in the institution / hospital'),
                              subtitle: Text('(First Health Facility)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'NIL',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'NIL',
                                    groupValue: firstHealthFacilityNilFirstAid,
                                    onChanged: _handleRadioValueChange1,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'FirstAid',
                                    groupValue: firstHealthFacilityNilFirstAid,
                                    onChanged: _handleRadioValueChange1,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            labelText: 'Type..',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                        onSaved: (value) {
                                          if(value != null)
                                          widget.user.otherspecify
                                              .add('First Health Facility - $value');
                                        },
                                      ))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.4.2'),
                              title: Text(
                                  'Type of treatment received in the institution / hospital'),
                              subtitle: Text('(Referral Institution I)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'NIL',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'NIL',
                                    groupValue: referralInstitutionINilFirstAid,
                                    onChanged: _handleRadioValueChange2,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'FirstAid',
                                    groupValue: referralInstitutionINilFirstAid,
                                    onChanged: _handleRadioValueChange2,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                      onSaved: (value) {
                                        if(value != null)
                                            widget.user.otherspecify.add('Referral Institution I - $value');
                                      },))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.4.3'),
                              title: Text(
                                  'Type of treatment received in the institution / hospital'),
                              subtitle: Text('(Referral Institution II)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'NIL',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'NIL',
                                    groupValue: referralInstitutionIINilFirstAid,
                                    onChanged: _handleRadioValueChange3,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'FirstAid',
                                    groupValue: referralInstitutionIINilFirstAid,
                                    onChanged: _handleRadioValueChange3,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                      onSaved: (value) {
                                        if(value != null)
                                            widget.user.otherspecify.add('Referral Institution II - $value');
                                      },))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.4.4'),
                              title: Text(
                                  'Type of treatment received in the institution / hospital'),
                              subtitle: Text('(Referral Institution III)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'NIL',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'NIL',
                                    groupValue: referralInstitutionIIINilFirstAid,
                                    onChanged: _handleRadioValueChange4,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'First Aid',
                                    groupValue: referralInstitutionIIINilFirstAid,
                                    onChanged: _handleRadioValueChange4,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                      onSaved: (value) {
                                            if(value != null)
                                            widget.user.otherspecify.add('Referral Institution III - $value');
                                      },))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.5.1'),
                              title: Text(
                                  'Specify the reasons for referring to another institution'),
                              subtitle: Text('(First Health Facility)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'Lack of Specialists',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Specialist',
                                    groupValue: firstHealthFacilitySpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange5,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Equipment',
                                    groupValue: firstHealthFacilitySpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange5,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                      onSaved: (value) {
                                        if(value != null)
                                          widget.user.othersreason.add('First Health Facilty - $value');
                                      }
                                      ,))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.5.2'),
                              title: Text(
                                  'Specify the reasons for referring to another institution'),
                              subtitle: Text('(Referral Institution I)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'Lack of Specialists',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Specialist',
                                    groupValue: referralInstitutionISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange6,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Equipment',
                                    groupValue: referralInstitutionISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange6,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)))))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.5.3'),
                              title: Text(
                                  'Specify the reasons for referring to another institution'),
                              subtitle: Text('(Referral Instituion II)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'Lack of Specialists',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Specialist',
                                    groupValue: referralInstitutionIISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange7,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Equipment',
                                    groupValue: referralInstitutionIISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange7,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)))))
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green.shade50,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text('13.5.4'),
                              title: Text(
                                  'Specify the reasons for referring to another institution'),
                              subtitle: Text('(Referral Institution III)'),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    'Lack of Specialists',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Specialist',
                                    groupValue: referralInstitutionIIISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange8,
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'Equipment',
                                    groupValue: referralInstitutionIIISpecialistAndEquipment,
                                    onChanged: _handleRadioValueChange8,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(Specify..)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)))))
                                ])
                              ],
                            )
                          ],
                        ),
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
                    ]))))));
  }
}
