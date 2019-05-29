import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:hp_cdrs/common/functions/showDialogSingleButton.dart';
import 'package:hp_cdrs/common/apifunctions/requestLoginAPI.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return  new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "";
  @override
  void initstate(){
    super.initState();
    _saveCurrentRoute("/LoginPage");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    var drawer  = Drawer();
    return WillPopScope(
      onWillPop: () {
        if(Navigator.canPop(context)){
          Navigator.of(context).pushNamedAndRemoveUntil('\HomeScreen',(Route<dynamic> route)  =>false);
        }
        else{
          Navigator.of(context).pushReplacementNamed('\HomeScreen');
        }
      },
      child: Scaffold(
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
                          controller: _userNameController,
                          decoration: InputDecoration(
                              labelText: "Username",
                              hintText: "Enter Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: const EdgeInsets.all(20.0)),
                        TextFormField(
                          controller: _passwordController,
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
                          color: Colors.blue,
                          child: new Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white
                            ),
                          ),
                          onPressed: (){
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                            requestLoginAPI(context, _userNameController.text, _passwordController.text);
                          },
                          splashColor: Colors.blue,
                        ),
                      ],
                    ),
                  )
              )
          )
      ),
    );




  }
}