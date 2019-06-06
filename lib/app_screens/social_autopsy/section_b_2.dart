import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB2 extends StatefulWidget {
  @override
  State createState() => SocialAutopsyB2State();
}

class SocialAutopsyB2State extends State<SocialAutopsyB2> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Treatment seeking history'),
        ),
        body: Container(
            child: Builder(
                builder: (context) =>
                    Form(
                        child: SingleChildScrollView(
                            child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('9.'),
                                    title: Text(
                                        'Problems faced by the parents in getting treatment in the health facility:'),
                                  ),
                                ]
                            ))))
        ));
  }

}
