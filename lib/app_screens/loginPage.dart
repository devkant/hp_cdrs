import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:hp_cdrs/common/apifunctions/requestLoginAPI.dart';
import 'forgot_passs.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var currentBackPressTime;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          showToast("Press back again to exit", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text("HPG - CDRS")),
          ),
          backgroundColor: Colors.white,
          body:  Form(
            key: _formKey,
            child: Container(
                child:  SingleChildScrollView(
                  child: Column(
                    children: <Widget>[


                      Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text('H.P. Govt.\n Child Death Review System',
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )),


                      CircleAvatar(
                        radius:60.0,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage('assets/hpgovt.png'),
                          height: 120.0,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'LOGIN HERE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          validator: (value)  {
                            if (value.isEmpty) {
                              return ('Invalid username');
                            }
                          },
                          controller: _userNameController,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20.0),
                                      right: Radius.circular(20.0)
                                  ),
                                  borderSide: BorderSide(width: 20.0, color: Colors.blue)
                              ),
                              labelText: 'Username',
                              hintText: 'Enter Username',
                              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          validator: (value)  {
                            if (value.isEmpty) {
                              return ('Invalid Password');
                            }
                          },
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20.0),
                                      right: Radius.circular(20.0)
                                  ),
                                  borderSide: BorderSide(width: 20.0, color: Colors.blue)
                              ),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              contentPadding: EdgeInsets.only(left: 20.0,bottom: 10.0)
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(20.0)),
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
                          if(_formKey.currentState.validate()) {
                            showAlert();
                            SystemChannels.textInput.invokeMethod(
                                'TextInput.hide');
                            requestLoginAPI(context, _userNameController.text,
                                _passwordController.text);
//                                Navigator.of(context).pop();
                          }
                        },
                        splashColor: Colors.blue,
                      ),

                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child: FlatButton(
                            onPressed: (){
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ForgotPass()));
                              });
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),

                            ),

                          )
                      )
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }


  void showAlert(){

    AlertDialog dialog = AlertDialog(
//      content: Text('Please Wait...', textAlign: TextAlign.center,),
//      contentPadding: EdgeInsets.only(left: 0.0, right: 15.0, top: 15.0, bottom: 15.0),
    );
    showDialog(barrierDismissible: false, context: context,
        builder: (BuildContext context){return Dialog(
//          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: 80.0,
            width: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Image(
                        width: 70.0,
                        height: 70.0,
//                  fit: BoxFit.contain,
                        image: new AssetImage("assets/waiting.gif"))),
                Flexible(child: Text('Please Wait...', style: TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w500
                ),))
              ],
            ),
          ),
        );});

  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }


  void showSnackBar(String message){
    var snackBar = SnackBar(
//      backgroundColor: Colors.blue,
      content: Text(message,
        style: TextStyle(fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}