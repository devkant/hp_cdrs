import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: About(),
    );
  }
}


class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<About> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('About',),
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
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                        child: Text('This application has been developed'
                            ' and is currently being maintained by a team'
                            ' of the following students of IIIT Una '
                            'and NIT Hamirpur -\n\n\n'
                            '1. Dev Kant Kumar Chouhan\n\n'
                            '2. Amol Baapde Singhaniya\n\n'
                            '3. Aryan Verma\n\n'
                            '4. Meet Vyas\n\n'
                            '5. Rohit Kumar', style: TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.justify,)),
                      ),),
                  ],
                ),
              ),
            )));
  }
}