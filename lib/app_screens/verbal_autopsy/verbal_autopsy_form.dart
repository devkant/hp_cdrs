import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form',
    theme: ThemeData(primaryColor: Colors.deepPurple),
    home: _verbalAutopsyForm(),
  ));
}

class _verbalAutopsyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormState();
  }
}

class _verbalAutopsyFormState extends State<_verbalAutopsyForm> {
  var _formKey = GlobalKey<FormState>();
  var _districtName = ['Hamirpur', 'Shimla', 'Una'];
  var _currentSelectedDistrict = 'Una';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verbal Autopsy Form'),
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
                      child: Center(
                        child: Text(
                          'Form No.1 Neonatal Deaths'
                              "\n"
                              '(28 Days or less of age)',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    textBoxFunction('District'),
                    textBoxFunction('Block'),
                    textBoxFunction('Village'),
                    textBoxFunction('PHC'),
                    textBoxFunction('Sub-Center'),
                    textBoxFunction('RHC Number of Mother/Baby'),
                    textBoxFunction('Name of the head of the Household'),
                    textBoxFunction('Full Name of the deceased'),
                    textBoxFunction('Full Name of the mother of deceased'),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.deepPurple,
                        child: Text(
                          "Proceed",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate())
                              AlertDialog(
                                title: Text('Form Submitted Sucessfully'),
                                content: Text('Success'),
                              );
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ))
    );
  }

  Widget textBoxFunction(String hintAndLabelString) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) return 'Please fill a valid input';
        },
        decoration: InputDecoration(
            labelText: hintAndLabelString,
            hintText: hintAndLabelString,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}
