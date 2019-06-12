import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB2 extends StatefulWidget {
  @override
  State createState() => SocialAutopsyB2State();
}

class SocialAutopsyB2State extends State<SocialAutopsyB2> {
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                                          8.0)))))
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
                                  RadioListTile()
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile()
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
                              leading: Text('13.4.2'),
                              title: Text(
                                  'Type of treatment received in the institution / hospital'),
                              subtitle: Text('(Referral Institution I )'),
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
                                  RadioListTile()
                                ]),
                                TableRow(children: [
                                  Text(
                                    'First Aid',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  RadioListTile()
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
                                      leading: Text('13.4.3'),
                                      title: Text('Type of treatment received in the institution / hospital'),
                                      subtitle: Text('(Referral Institution II)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('NIL', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('First Aid', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
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
                                      title: Text('Type of treatment received in the institution / hospital'),
                                      subtitle: Text('(Referral Institution III)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('NIL', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('First Aid', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
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
                                      title: Text('Specify the reasons for referring to another institution'),
                                      subtitle: Text('(First Health Facility)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('Lack of Specialists', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Lack of Equipments', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
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
                                      title: Text('Specify the reasons for referring to another institution'),
                                      subtitle: Text('(Referral Institution I)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('Lack of Specialists', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Lack of Equipments', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
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
                                      title: Text('Specify the reasons for referring to another institution'),
                                      subtitle: Text('(Referral Instituion II)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('Lack of Specialists', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Lack of Equipments', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
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
                                      title: Text('Specify the reasons for referring to another institution'),
                                      subtitle: Text('(Referral Institution III)'),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                            children: [
                                              Text('Lack of Specialists', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Lack of Equipments', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              RadioListTile(
                                              )
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text('Others(Specify..)', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                                              Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
                                                  child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          labelText: 'Type..',
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
                                                      )
                                                  ))
                                            ]
                                        )
                                      ],
                                    )
                                  ],
                                ),
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
                    ]))))));
  }
}
