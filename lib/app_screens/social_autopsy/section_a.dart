import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_b_1.dart';

class SocialAutopsyA extends StatefulWidget {
  final User user;
  SocialAutopsyA({Key key, this.user}):super(key:key);
  @override
  State createState() => SocialAutopsyAState();
}

class SocialAutopsyAState extends State<SocialAutopsyA> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  //var user = User();

  void _handleRadioValueChange1(String value) {
    setState(() {
      widget.user.bplCard = value;
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
//      if (widget.user.bplCard == '')
//        _showSnackBar('Please fill your BPL status');
//      else
//        {
          form.save();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (SocialAutopsyB1(user:widget.user))),
          );
//        }
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
      if (!nameExp.hasMatch(value) || value == null)
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
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
                  key: this._formKey,
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
                              onSaved: (String value) {widget.user.nameOfInformant = value; },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
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
                              onSaved: (String value) { widget.user.telephoneNumber = value; },
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
                              onSaved: (value) { widget.user.familyMembers = int.parse(value); },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: '4) Number of children',
                                  hintText: 'Less than equal to years',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid entry';
                                }
                              },
                              onSaved: (value) { widget.user.children = int.parse(value); },
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
                              onSaved: (value) { widget.user.caste = value; },
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: '6) Religion',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0))),
                              validator: (String value) { _validateName(value); },
                              onSaved: (value) { widget.user.religion = value; },
                            )),
                        Padding(
                          padding: EdgeInsets.only(right:10.0, top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('7) Do you have Below'"\n"'Poverty Line (BPL) card:'),
                                  Radio(
                                    value: 'yes',
                                    groupValue: widget.user.bplCard,
                                    onChanged: _handleRadioValueChange1,
                                  ),
                                  Text('Yes'),
                                  Radio(
                                    value: 'no',
                                    groupValue: widget.user.bplCard,
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
