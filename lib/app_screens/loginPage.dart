import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:hp_cdrs/common/functions/showDialogSingleButton.dart';
import 'package:hp_cdrs/common/apifunctions/requestLoginAPI.dart';

import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "HP Govt",
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Child Death Reporting App"),
        ),
        backgroundColor: Colors.white,
        body: new Container(
            child: new Padding(
                padding: const EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: new Column(
                    children: <Widget>[
                      Image(
                        image: new AssetImage("assets/hpgovet.jpg"),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Enter Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        keyboardType: TextInputType.text,
                      ),
                      Padding(padding: const EdgeInsets.all(20.0)),
                      TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(padding: const EdgeInsets.all(40.0)),
                      RaisedButton(
                        child: new Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white
                          ),
                        ),
                        onPressed: null,
                        splashColor: Colors.redAccent,
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }
}