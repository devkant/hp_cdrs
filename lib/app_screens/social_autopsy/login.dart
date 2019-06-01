import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_a.dart';

class SocialAutopsyLogin extends StatefulWidget {
  @override
  State createState() => SocialAutopsyLoginState();
}

class SocialAutopsyLoginState extends State<SocialAutopsyLogin> {
  final _formKey = GlobalKey<FormState>();
  var _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Social Autopsy'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0)),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Reference ID',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid entry';
                              }
                            },
                            onSaved: (value) {
                              _user.referenceID = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'MCTS Number',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid entry';
                              }
                            },
                            onSaved: (value) {
                              _user.mctsNumber = value;
                            },
                          )),
                      RaisedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (SocialAutopsyA())),
                            );
                          }
                        },
                        child: Text('Proceed'),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
