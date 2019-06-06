import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_1.dart';

class SocialAutopsyA extends StatefulWidget {
  @override
  State createState() => SocialAutopsyAState();
}

class SocialAutopsyAState extends State<SocialAutopsyA> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  var _user = User();

  void _handleRadioValueChange1(int value) {
    setState(() {
      _user.isBelowPovertyLine = value;
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      if (_user.isBelowPovertyLine < 0)
        _showSnackBar('Please fill your BPL status');
      else
        {
          form.save();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (SocialAutopsyB1())),
          );
        }
    }
    else
      _autoValidate = true;
  }

    void _showSnackBar(message) {
      final snackBar = new SnackBar(
        content: new Text(message),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    String _validateName(value) {

      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
      if (!nameExp.hasMatch(value))
        return 'Please enter only alphabetical values';
      else
        return null;
    }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Background Information'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: '1) Name of key Informant',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0))),
                                validator: (String value) { _validateName(value); },
                              onSaved: (String value) {_user.respondentName = value; },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  labelText: '2) Telephone/Mobile Number',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (value) {
                                if (value.length != 10) {
                                  return 'Please enter valid Phone Number';
                                }
                              },
                              onSaved: (String value) { _user.telephoneNumber = value; },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText:
                                      '3) Total Number of Family members of deceased',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid entry';
                                }
                              },
                              onSaved: (value) { _user.noOfFamilyMembersDeceased = int.parse(value); },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: '4) Number of children <= 5 years',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid entry';
                                }
                              },
                              onSaved: (value) { _user.noOfChildren = int.parse(value); },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: '5) Caste',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                                validator: (String value) { _validateName(value); },
                              onSaved: (value) { _user.caste = value; },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: '6) Religion',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0))),
                              validator: (String value) {
                                final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                                if (!nameExp.hasMatch(value))
                                  return 'Please enter only alphabetical values';
                              },
                              onSaved: (value) { _user.religion = value; },
                            )),
                        Padding(
                          padding: EdgeInsets.only(right:10.0, top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('7) Do you have Below'"\n"'Poverty Line (BPL) card:'),
                                  Radio(
                                    value: 1,
                                    groupValue: _user.isBelowPovertyLine,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                                  Text('Yes'),
                                  Radio(
                                    value: 0,
                                    groupValue: _user.isBelowPovertyLine,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                              Text('No'),
                                ],
                              )
                          ),
                        RaisedButton(
                          onPressed: () {
                            _handleSubmitted();
                            },
                          child: Text('Proceed to the next section', style: TextStyle(color: Colors.white), ),
                          color: Colors.blue,
                          splashColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
          ),
        ));
  }
}
