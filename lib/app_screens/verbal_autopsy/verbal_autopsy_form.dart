import 'package:flutter/material.dart';
import 'verbal_autopsy_sec1.dart';
import 'user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final verbal_Autopsy_Obj = user();
    return MaterialApp(
      home: verbalAutopsyForm(verbal_Autopsy_Obj: verbal_Autopsy_Obj),
    );
  }
}


class verbalAutopsyForm extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsyForm({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormState();
  }
}

class _verbalAutopsyFormState extends State<verbalAutopsyForm> {
  var _formKey = GlobalKey<FormState>();
//  var _currentSelectedDistrict = '';

  @override
  void initState() {
    super.initState();
    widget.verbal_Autopsy_Obj.district = _districtName[0];
  }

  var _districtName = ['Bilaspur', 'Chamba', 'Hamirpur', 'Kangra', 'Kinnaur',
    'Kullu', 'Lahaul & Spiti', 'Mandi', 'Shimla', 'Sirmaur', 'Solan', 'Una'];
//  String blockController = '';
//  String villageController = '';
//  String phcController = '';
//  String subCenterController = '';
  String rhcController = '';
  String yearController = '';
//  String headController = '';
//  String nameController = '';
//  String nameMotherDeceasedController = '';

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
                            value: widget.verbal_Autopsy_Obj.district,
                            onChanged: (String newSelectedValue) {
                              _onDropDownItemSelected(newSelectedValue);
                            },
                          )),
                    ]),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){widget.verbal_Autopsy_Obj.block = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.village = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.phc = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.subCenter = value;},
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
                        onSaved: (value){rhcController = value;
                        widget.verbal_Autopsy_Obj.rhc = num.parse(rhcController);;},
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
                        onSaved: (value){yearController = value;
                        widget.verbal_Autopsy_Obj.year = num.parse(yearController);},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.head = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.name = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.mother = value;},
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
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      verbalAutopsySec1(
                                        verbal_Autopsy_Obj: widget.verbal_Autopsy_Obj,)));
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


  void _onDropDownItemSelected(String newSelectedValue) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.district = newSelectedValue;
    });
  }
}
