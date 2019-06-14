import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form',
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
  var _currentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _districtName[0];
  }

  var _districtName = ['Bilaspur', 'Chamba', 'Hamirpur', 'Kangra', 'Kinnaur',
    'Kullu', 'Lahaul & Spiti', 'Mandi', 'Shimla', 'Sirmaur', 'Solan', 'Una'];
  TextEditingController blockController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController phcController = TextEditingController();
  TextEditingController subCenterController = TextEditingController();
  TextEditingController rhcController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController householdHeadController = TextEditingController();
  TextEditingController nameOfDeceasedController = TextEditingController();
  TextEditingController nameMotherOfDeceasedController = TextEditingController();

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
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),


                    Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text('District:', style: TextStyle(fontSize: 18.0),),
                      ),


                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: DropdownButton<String>(
                            items: _districtName.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _currentItemSelected,
                            onChanged: (String newSelectedValue) {
                              _onDropDownItemSelected(newSelectedValue);
                            },
                          )),
                    ]),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: blockController,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Block/Tehsil',
                            hintText: 'Block/Tehsil',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: villageController,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Village',
                            hintText: 'Village',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: phcController,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'PHC',
                            hintText: 'PHC',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: subCenterController,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Sub-Center',
                            hintText: 'Sub-Center',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: rhcController,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'RHC Number of Mother/Baby',
                            hintText: 'RHC Number of Mother/Baby',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: yearController,
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (String value) {
                          if (value.length!=4) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Year',
                            hintText: 'Year',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: householdHeadController,
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Name of head of household',
                            hintText: 'Name of head of household',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: nameOfDeceasedController,
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Full name of deceased',
                            hintText: 'Full name of deceased',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: nameMotherOfDeceasedController,
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Full name of mother of deceased',
                            hintText: 'Full name of mother of deceased',
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
                          "Proceed to Section 1",
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
            )));
  }


  void _onDropDownItemSelected(String newSelectedValue) {
    setState(() {
      this._currentItemSelected = newSelectedValue;
    });
  }
}
