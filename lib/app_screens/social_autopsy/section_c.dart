import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyC extends StatefulWidget {
  @override
  State createState() => SocialAutopsyCState();
}

class SocialAutopsyCState extends State<SocialAutopsyC> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

  void _handleRadioValueChange1(String value) {
    setState(() {
      _user.dangerSigns = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Brief Social History of the Family'),
        ),
        body: Container(
            child: Builder(
                builder: (context) =>
                    Form(
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                              ListTile(
                                leading: Text('17)', style: TextStyle(fontWeight: FontWeight.bold )),
                                title: Text('Awareness of mother & family members about treatment seeking', style: TextStyle(fontWeight: FontWeight.bold ),),
                              ),
                              ListTile(
                                leading: Text('17.1'),
                                title: Text('Do you know the danger signs when a newborn or infant should be taken to health facility?'),
                              ),
                              RadioListTile(
                                title: Text('Yes'),
                                value: 'Yes',
                                groupValue: _user.dangerSigns,
                                onChanged: _handleRadioValueChange1,
                              ),
                              RadioListTile(
                                title: Text('No'),
                                value: 'No',
                                groupValue: _user.dangerSigns,
                                onChanged: _handleRadioValueChange1,
                              ),
                              RadioListTile(
                                title: Text("Don't Know"),
                                value: "Don't Know",
                                groupValue: _user.dangerSigns,
                                onChanged: _handleRadioValueChange1,
                              ),

                              _handleDangerSigns(),

                            ]
                            )
                        )
                    )
            )
        )
    );
  }

  Widget _handleDangerSigns() {
    if(_user.dangerSigns == 'Yes') {
      return Container(

      );
    }
    else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }

}