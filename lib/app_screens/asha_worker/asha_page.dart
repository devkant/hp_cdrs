import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ASHA Form',
    home: hpForm(),
  ));
}

class hpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _hpFormState();
  }
}

class _hpFormState extends State<hpForm> {
  var _formKey = GlobalKey<FormState>();
  var _districtName = ['Hamirpur', 'Shimla', 'Una'];
  var _currentSelectedDistrict = 'Una';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASHA Form'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The name should contain more than two letters';
                    },
                    decoration: InputDecoration(
                        labelText: 'Name of the child',
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left:20.0),
                      child:Text('District:', style:
                      TextStyle(fontSize: 18.0),)

                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<String>(
                          items: _districtName.map((String value1) {
                            return DropdownMenuItem<String>(
                              value: value1,
                              child: Text(value1),
                            );
                          }).toList(),
                          value: _currentSelectedDistrict,
                          onChanged: (String newSelectedDistrict) {
                            _onDropDownDistrictSelected(newSelectedDistrict);
                          }))
                ]),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The block name should contain more than two letters';
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
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The address should contain more than two letters';
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.length != 10)
                        return 'Please input a valid phone number';
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Submit",
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
          )),
    );
  }

  void _onDropDownDistrictSelected(String newSelectedDistrict) {
    setState(() {
      this._currentSelectedDistrict = newSelectedDistrict;
    });
  }
}
