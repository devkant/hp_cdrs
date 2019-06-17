import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_d.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_a.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = User();
    return MaterialApp(
      home: SocialAutopsyD(user:user),
    );
  }
}

class SocialAutopsyLogin extends StatefulWidget {
  final User user;
  SocialAutopsyLogin({Key key, this.user}):super(key:key);
  @override
  State createState() => SocialAutopsyLoginState();
}

class SocialAutopsyLoginState extends State<SocialAutopsyLogin> {
  final _formKey = GlobalKey<FormState>();
  //var user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade50,
        appBar: AppBar(
          title: Text('Social Autopsy'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
                key: this._formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0)),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 30.0),
                  color: Colors.blue.shade100,
                    child:Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(widget.user.applicationNumber, textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                )),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                              widget.user.referenceId = value;
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                              widget.user.MCTS = value;
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
                                  builder: (context) => (SocialAutopsyA(user:widget.user))),
                            );
                          }
                        },
                        child: Text('Proceed', style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
