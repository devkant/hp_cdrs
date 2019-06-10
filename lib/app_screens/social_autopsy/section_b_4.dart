import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB4 extends StatefulWidget {
  @override
  State createState() => SocialAutopsyB4State();
}

class SocialAutopsyB4State extends State<SocialAutopsyB4> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

  void _handleRadioValueChange1(String value) {
    setState(() {
      _user.dischargedAgainstMedicalAdvice = value;
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      _user.diedBeforeDischarge = value;
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      _user.dissatisfactionTreatment = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Treatment seeking history'),
        ),
        body: Container(
            child: Builder(
                builder: (context) => Form(
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green.shade50,
                          margin: EdgeInsets.all(10.0),
                          child: Column(children: <Widget>[
                            ListTile(
                              leading: Text('14'),
                              title: Text(
                                  'Was the baby shown as having been discharged against medical advice / absconded ?'),
                            ),
                            RadioListTile(
                              value: 'Yes',
                              groupValue: _user.dischargedAgainstMedicalAdvice,
                              title: Text('Yes'),
                              onChanged: _handleRadioValueChange1,
                            ),
                            RadioListTile(
                                value: 'No',
                                groupValue:
                                    _user.dischargedAgainstMedicalAdvice,
                                title: Text('No'),
                                onChanged: _handleRadioValueChange1),
                            _question14(),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: RaisedButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Proceed to the next section',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.blue,
                              ),
                            )
                          ]))
                    ]))))));
  }

  Widget _question14() {
    if (_user.dischargedAgainstMedicalAdvice == 'Yes') {
      return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.green.shade50,
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Text(
                'Please get the answers for the following questions from the relatives:'),
            ListTile(
              leading: Text('14.1'),
              title:
                  Text('Why the baby was discharged against medical advice?'),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: 'Type here..', ),
            ),
            ListTile(
              leading: Text('14.2'),
              title: Text(
                  'Please narrate the circumstances leading to the discharge of the baby against medical advice / left against meddical advice / absconded.'),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Type here..')
            ),
            ListTile(
              leading: Text('14.3'),
              title: Text(
                  'Whether relatives were aware of the discharge of the baby and whether the discharge was on the request of the relatives or on the advice of the doctor / paramedical person(specify)?'),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Type here..')),
            ListTile(
              leading: Text('14.4'),
              title: Text('Whether baby died before discharge?'),
            ),
            RadioListTile(
              title: Text('Yes'),
              value: 'Yes',
              groupValue: _user.diedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            RadioListTile(
              title: Text('No'),
              value: 'No',
              groupValue: _user.diedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            RadioListTile(
              title: Text("Don't Know"),
              value: "Don't Know",
              groupValue: _user.diedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            ListTile(
              leading: Text('14.5'),
              title: Text(
                  'Was the discharge due to the dissatisfaction of the treatment give in the hospital'),
            ),
            RadioListTile(
              title: Text('Yes'),
              value: 'Yes',
              groupValue: _user.dissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            RadioListTile(
              title: Text('No'),
              value: 'No',
              groupValue: _user.dissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            RadioListTile(
              title: Text("Don't Know"),
              value: "Don't Know",
              groupValue: _user.dissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            ListTile(
              leading: Text('14.6'),
              title: Text('Any other reason for discharge against medical advice? Specify.'),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Type here..')
            )
          ])));
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }
}
