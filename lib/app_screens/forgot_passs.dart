import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ForgotPass(),
    );
  }
}


class ForgotPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPassState();
  }
}

class ForgotPassState extends State<ForgotPass> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  String emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]'
      r'+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
      r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Forgot Password'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text('Please input your E-mail address below '
                            'to reset your password:', style: TextStyle(fontSize: 18.0),),
                      ),),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (String value) {
                          final RegExp nameExp = RegExp(emailRegex);
                          if (!nameExp.hasMatch(value))
                            return 'Please enter a valid E-mail address';
                        },
                        decoration: InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'abcdef@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.blue,
                        child: Text(
                          "Send",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final FormState form = _formKey.currentState;
                            form.save();
                            showSnackBar('Please check your inbox for password reset link');
                            setState(() {
                              var data = {'email': emailController.text};
                              sendData('http://13.126.72.137/api/forget', data);
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
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
