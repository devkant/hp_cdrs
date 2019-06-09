import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB3 extends StatefulWidget {
  @override
  State createState() => SocialAutopsyB3State();
}

class SocialAutopsyB3State extends State<SocialAutopsyB3> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.green.shade50,
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                                                                    8.0)))))
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
                              child: Column(children: <Widget>[
                                ListTile(
                                  leading: Text('13.11.1'),
                                  title: Text(
                                      'Reasons for the delay in initiating treatment (Use your judgement in arriving the reasons)'),
                                  subtitle: Text('(First Health Facility)'),
                                ),
                                CheckboxListTile(
                                  title: Text('Informal Payment'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: false,
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
                                                        8.0)))))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.green.shade50,
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
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: false,
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0)))))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.green.shade50,
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
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: false,
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0)))))
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.green.shade50,
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
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Mobilizing Specialists'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Paramedical workers not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Too much patient rush'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Doctor not available'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Money Problem'),
                                  value: false,
                                ),
                                CheckboxListTile(
                                  title: Text('Investigations could not be done'),
                                  value: false,
                                ),
                                Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 2.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'Others (Specify..)',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0)))))
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: RaisedButton(
                                onPressed: () {
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
