import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyD extends StatefulWidget {
  @override
  State createState() => SocialAutopsyDState();
}

class SocialAutopsyDState extends State<SocialAutopsyD> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Expenditure History'),
        ),
        body: Container(
            child: Builder(
                builder: (context) => Form(
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                              _question18(),
                              _question19(),
                    ]))))));
  }

  Widget _question18() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green.shade50,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ListTile(
              leading: Text(
                '18',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Text(
                'Can you tell regarding the total amount that you had to spend on your child?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Text('1'),
              title: Text(
                  'Treatment(medicines, consultation, home treatment etc.'),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: 'Type here..')),
            ListTile(
              leading: Text('2'),
              title: Text('Transport'),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: 'Type here..')),
            ListTile(
              leading: Text('3'),
              title: Text('Others'),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    hintText: 'Type here..')),


          ],
        )));
  }

  Widget _question19() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green.shade50,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
              ListTile(
                leading: Text('19'),
                title: Text('How did you(the family) arrange this money?'),
                subtitle: Text('Multiple answers allowed. Check all that apply.'),
              ),
              CheckboxListTile(
                title: Text('Available / Savings'),
                value: _user.moneyArrangement['available'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['available'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Borrowed'),
                value: _user.moneyArrangement['borrowed'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['borrowed'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Sold Assets'),
                value: _user.moneyArrangement['sold assets'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['sold assets'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Community Fund'),
                value: _user.moneyArrangement['community fund'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['community fund'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Govt. Scheme'),
                value: _user.moneyArrangement['govt scheme'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['govt scheme'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Other'),
                value: _user.moneyArrangement['other'],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement['other'] = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Don't Know"),
                value: _user.moneyArrangement["don't know"],
                onChanged: (bool value) {
                  setState(() {
                    _user.moneyArrangement["don't know"] = value;
                  });
                },
              ),
            ])));
  }
}
