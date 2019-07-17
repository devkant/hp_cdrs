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
                        child: Text('Child Death Review (CDR) is a strategy to '
                            'understand the geographical variation in causes of '
                            'child deaths and thereby initiating specific child '
                            'health interventions. Analysis of child deaths '
                            'provides information about the medical causes of '
                            'death, helps to identify the gaps in health '
                            'service delivery and social factors that '
                            'contribute to child deaths. ',
                          style: TextStyle(fontSize: 18.0),
                          textAlign: TextAlign.justify,)),
                      ),),
                  ],
                ),
              ),
            )));
  }
}