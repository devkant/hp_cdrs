import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_3.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB2 extends StatefulWidget {
   final User user;
   SocialAutopsyB2({Key key, this.user}) : super(key: key);
  @override
  State createState() => SocialAutopsyB2State();
}

class SocialAutopsyB2State extends State<SocialAutopsyB2> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String firstHealthFacilityNilFirstAid = '';
  bool firstHealthFacilityNilFirstAidText = false;
  String referralInstitutionINilFirstAid = '';
  bool referralInstitutionINilFirstAidText = false;
  String referralInstitutionIINilFirstAid = '';
  bool referralInstitutionIINilFirstAidText = false;
  String referralInstitutionIIINilFirstAid = '';
  bool referralInstitutionIIINilFirstAidText = false;
  TextEditingController testController = TextEditingController();


  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if(form.validate())
      form.save();
//    controllerTest();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (SocialAutopsyB3(user:widget.user))),
      );
  }


  void _handleRadioValueChange1(String value) {
    setState(() {
      firstHealthFacilityNilFirstAid = value;
      if (value == 'NIL') {
        firstHealthFacilityNilFirstAidText = false;
        testController.text = '';
        widget.user.nil[0] = true;
        widget.user.firstAid[0] = false;
      } else if(value == 'FirstAid') {
        firstHealthFacilityNilFirstAidText = false;
        widget.user.firstAid[0] = true;
        widget.user.nil[0] = false;
      }
      else {firstHealthFacilityNilFirstAidText = true;}
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      referralInstitutionINilFirstAid = value;
      if (value == 'NIL') {
        referralInstitutionINilFirstAidText = false;
        widget.user.nil[1] = true;
        widget.user.firstAid[1] = false;
      } else if(value == 'FirstAid') {
        referralInstitutionINilFirstAidText = false;
        widget.user.firstAid[1] = true;
        widget.user.nil[1] = false;
      }
      else {referralInstitutionINilFirstAidText = true;}
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      referralInstitutionIINilFirstAid = value;
      if (value == 'NIL') {
        referralInstitutionIINilFirstAidText = false;
        widget.user.nil[2] = true;
        widget.user.firstAid[2] = false;
      } else if(value == 'FirstAid') {
        referralInstitutionIINilFirstAidText = false;
        widget.user.firstAid[2] = true;
        widget.user.nil[2] = false;
      }
      else {referralInstitutionIINilFirstAidText = true;}
    });
  }

  void _handleRadioValueChange4(String value) {
    setState(() {
      referralInstitutionIIINilFirstAid = value;
      if (value == 'NIL') {
        referralInstitutionIIINilFirstAidText = false;
        widget.user.nil[3] = true;
        widget.user.firstAid[3] = false;
      } else if(value == 'FirstAid') {
        referralInstitutionIIINilFirstAidText = false;
        widget.user.firstAid[3] = true;
        widget.user.nil[3] = false;
      }
      else {referralInstitutionIIINilFirstAidText = true;}
    });
  }

//  void controllerTest(){
//    widget.user.otherspecify[0] = testController.text;
//  }

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
                            child: Column(children: <Widget>[
                      ListTile(
                        leading: Text('13.'),
                        title: Text(
                            'Problems faced by the parents in getting treatment in the health facility:'),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.green.shade50),
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
                                          if(value != null)
                                            widget.user.Hospital[0] = value;
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
                                            if(value != null)
                                              widget.user.Hospital[1] = value;
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
                                            if(value != null)
                                              widget.user.Hospital[2] = value;
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
                                            if(value != null)
                                              widget.user.Hospital[3] = value;
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
                                            if(value != null)
                                              widget.user.problem[0] = value;
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
                                            if(value != null)
                                              widget.user.problem[1] = value;
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
                                            if(value != null)
                                              widget.user.problem[2] = value;
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
                                            if(value != null)
                                              widget.user.problem[3] = value;
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
                                            if(value != null)
                                              widget.user.timeTaken[0] = value;
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
                                            if(value != null)
                                              widget.user.timeTaken[1] = value;
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
                                            if(value != null)
                                              widget.user.timeTaken[2] = value;
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
                                            if(value != null)
                                              widget.user.timeTaken[3] = value;
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
                                  ),
                                ]),
                        TableRow(children: [
                          Text(
                            'Others(specify)',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          RadioListTile(
                            value: 'others',
                            groupValue: firstHealthFacilityNilFirstAid,
                            onChanged: _handleRadioValueChange1,
                          ),
                        ]),
                                TableRow(children: [
                                  Text('',),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        enabled: firstHealthFacilityNilFirstAidText,
                                        keyboardType: TextInputType.text,
                                        controller: testController,
                                        decoration: InputDecoration(
                                            labelText: 'Type..',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                        onSaved: (value) {
                                          if(value != null && firstHealthFacilityNilFirstAidText)
                                          widget.user.otherspecify[0] = value;
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
                        decoration: BoxDecoration(
                            color: Colors.green.shade50),
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
                                    'Others(specify)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'others',
                                    groupValue: referralInstitutionINilFirstAid,
                                    onChanged: _handleRadioValueChange2,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text('',),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        enabled: referralInstitutionINilFirstAidText,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                        onSaved: (value) {
                                          if(value != null && referralInstitutionINilFirstAidText)
                                            widget.user.otherspecify[1] = value;
                                        },))
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
                                    'Others(specify)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'others',
                                    groupValue: referralInstitutionIINilFirstAid,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(''),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        enabled: referralInstitutionIINilFirstAidText,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                        onSaved: (value) {
                                          if(value != null && referralInstitutionIINilFirstAidText)
                                            widget.user.otherspecify[2] = value;
                                        },))
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
                                    value: 'FirstAid',
                                    groupValue: referralInstitutionIIINilFirstAid,
                                    onChanged: _handleRadioValueChange4,)
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(specify)',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile(
                                    value: 'others',
                                    groupValue: referralInstitutionIIINilFirstAid,
                                    onChanged: _handleRadioValueChange4,
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(''),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: TextFormField(
                                        enabled: referralInstitutionIIINilFirstAidText,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Type..',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                        onSaved: (value) {
                                          if(value != null && referralInstitutionIIINilFirstAidText)
                                            widget.user.otherspecify[3] = value;
                                        },))
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
                                Checkbox(
                                  value: widget.user.lackOfSpecialists[0],
                                  onChanged: (value) {
                                    setState(() {
                                      widget.user.lackOfSpecialists[0] = value;
                                    });
                                  },
                                )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Checkbox(
                                    value: widget.user.lackOfEquipments[0],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfEquipments[0] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(specify)',
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
                                          widget.user.othersreason[0] = value;
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
                        decoration: BoxDecoration(
                            color: Colors.green.shade50),
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
                                  Checkbox(
                                    value: widget.user.lackOfSpecialists[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfSpecialists[1] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Checkbox(
                                    value: widget.user.lackOfEquipments[1],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfEquipments[1] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                  'Others(specify)',
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
                                              widget.user.othersreason[1] = value;
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
                              leading: Text('13.5.3'),
                              title: Text(
                                  'Specify the reasons for referring to another institution'),
                              subtitle: Text('(Referral Institution II)'),
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
                                  Checkbox(
                                    value: widget.user.lackOfSpecialists[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfSpecialists[2] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Checkbox(
                                    value: widget.user.lackOfEquipments[2],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfEquipments[2] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(specify)',
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
                                              widget.user.othersreason[2] = value;
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
                                  Checkbox(
                                    value: widget.user.lackOfSpecialists[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfSpecialists[3] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Lack of Equipments',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Checkbox(
                                    value: widget.user.lackOfEquipments[3],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.user.lackOfEquipments[3] = value;
                                      });
                                    },
                                  )
                                ]),
                                TableRow(children: [
                                  Text(
                                    'Others(specify)',
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
                                              widget.user.othersreason[3] = value;
                                          }))
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
