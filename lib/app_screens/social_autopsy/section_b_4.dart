import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_c.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyB4 extends StatefulWidget {
  final User user;
  SocialAutopsyB4({Key key, this.user}) : super(key: key);
  @override
  State createState() => SocialAutopsyB4State();
}

class SocialAutopsyB4State extends State<SocialAutopsyB4> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleRadioValueChange1(String value) {
    setState(() {
      widget.user.dischargedAgainstMedicalAdvice = value;
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      widget.user.babyDiedBeforeDischarge = value;
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      widget.user.dischargeDueDissatisfactionTreatment = value;
    });
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (SocialAutopsyC(user: widget.user))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Treatment seeking history'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Builder(
                builder: (context) => Form(
                    key: this._formKey,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.green.shade50),
                          margin: EdgeInsets.all(10.0),
                          child: Column(children: <Widget>[
                            ListTile(
                              leading: Text('14'),
                              title: Text(
                                  'Was the baby shown as having been discharged against medical advice / absconded ?'),
                            ),
                            RadioListTile(
                              value: 'yes',
                              groupValue:
                                  widget.user.dischargedAgainstMedicalAdvice,
                              title: Text('Yes'),
                              onChanged: _handleRadioValueChange1,
                            ),
                            RadioListTile(
                                value: 'no',
                                groupValue:
                                    widget.user.dischargedAgainstMedicalAdvice,
                                title: Text('No'),
                                onChanged: _handleRadioValueChange1),
                            _question14(),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: RaisedButton(
                                onPressed: () {
                                  _handleSubmitted();
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
    if (widget.user.dischargedAgainstMedicalAdvice == 'yes') {
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green.shade50),
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
            ListTile(title:TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type here..',
              ),
              onSaved: (value) {
                widget.user.reasonDischargedAgainstMedicalAdvice = value;
              },
              validator: (value) {
                if (value.isEmpty)
                  return 'Please fill the entry';},
            )),
            ListTile(
              leading: Text('14.2'),
              title: Text(
                  'Please narrate the circumstances leading to the discharge of the baby against medical advice / left against medical advice / absconded.'),
            ),
            ListTile
              (
                title: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Type here..',
                ),
                onSaved: (value) {
                  widget.user.circumstancesDischargeBaby = value;
                },
                validator: (value) {
                  if (value.isEmpty)
                    return 'Please fill the entry';
                  else
                    return null;
                })),
            ListTile(
              leading: Text('14.3'),
              title: Text(
                  'Whether relatives were aware of the discharge of the baby and whether the discharge was on the request of the relatives or on the advice of the doctor / paramedical person(specify)?'),
            ),
            ListTile(title:TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: 'Type here..'),
              onSaved: (value) {
                widget.user.dischargeOnBehalf = value;
              },
              validator: (value) {
                if (value.isEmpty)
                  return 'Please fill the entry';
                else
                  return null;
              },
            )),
            ListTile(
              leading: Text('14.4'),
              title: Text('Whether baby died before discharge?'),
            ),
            RadioListTile(
              title: Text('Yes'),
              value: 'yes',
              groupValue: widget.user.babyDiedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            RadioListTile(
              title: Text('No'),
              value: 'no',
              groupValue: widget.user.babyDiedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            RadioListTile(
              title: Text("Don't Know"),
              value: "dnk",
              groupValue: widget.user.babyDiedBeforeDischarge,
              onChanged: _handleRadioValueChange2,
            ),
            ListTile(
              leading: Text('14.5'),
              title: Text(
                  'Was the discharge due to the dissatisfaction of the treatment give in the hospital'),
            ),
            RadioListTile(
              title: Text('Yes'),
              value: 'yes',
              groupValue: widget.user.dischargeDueDissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            RadioListTile(
              title: Text('No'),
              value: 'no',
              groupValue: widget.user.dischargeDueDissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            RadioListTile(
              title: Text("Don't Know"),
              value: "dnk",
              groupValue: widget.user.dischargeDueDissatisfactionTreatment,
              onChanged: _handleRadioValueChange3,
            ),
            ListTile(
              leading: Text('14.6'),
              title: Text(
                  'Any other reason for discharge against medical advice? Specify.'),
            ),
            ListTile(title:TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: 'Type here..'),
              onSaved: (value) {
                widget.user.reasonAgainstdischargedMedicalAdvice = value;
              },
            ))
          ])));
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }
}
