import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/ANM/user.dart';

import 'anm5.dart';

/*
void main() {
  runApp(MaterialApp(
    title: "ANM Form 4",
    home: Form4(),
  ));
}
*/

class Form4 extends StatefulWidget {

  //user data
  final User user;
  Form4({Key key,this.user}):super(key:key);

  @override
  _Form4State createState() => _Form4State();
}

class _Form4State extends State<Form4> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var dropdownCause = ['Yes', 'No'];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "1",

        "category_name": "Diarrhoea"},

      {"category_id": "2",

        "category_name": "Pneumonia"},

      {"category_id": "3",

        "category_name": "Malaria"},

      {"category_id": "4 ",

        "category_name": "Measles"},

      {"category_id": "5",

        "category_name": "Septicemia (Infection)"},

      {"category_id": "6",

        "category_name": "Meningitis"},

      {"category_id": "7",

        "category_name": "Injury"},

      {"category_id": "8", "category_name": "Preterm"},
      {"category_id": "9", "category_name": "Birth asphyxia"},
      {"category_id": "10", "category_name": "Infection"},
      {"category_id": "11", "category_name": "Congenital Malformations"},

    ],
    "responseTotalResult":
    12 // Total result is 3 here because we have 3 categories in responseBody.
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("D: Probable causes of death"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[

                  /*
                  Row(
                    children: <Widget>[

                      Text(
                        "1. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: Text(
                          "Any Identifiable Cause: ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),

                      DropdownButton<String>(
                        items: dropdownCause.map((String value2) {
                          return DropdownMenuItem<String>(
                            value: value2,
                            child: Text(value2),
                          );
                        }).toList(),
                        value: widget.user.probable,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.probable = newValueSelected;
                          });
                        },
                      ),

                    ],
                  ),
                  */

                  causesOfDeath(),

                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      elevation: 4.0,
                      splashColor: Colors.greenAccent,
                      child: Text(
                        'Next Section',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        final FormState form = _formKey.currentState;
                        form.save();
                        if(/*widget.user.probable == 'Yes' &&*/ widget.user.disease.isEmpty) {
                          _showSnackBar("Please check the checkbox to proceed");
                        }
                        else {
                          //debugPrint('${widget.user.disease.length}');
                          //debugPrint('${widget.user.disease}');
                          //debugPrint('${widget.user.probable}');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Form5(user: widget.user,)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget causesOfDeath() {
      return Column(
        children: <Widget>[

          Row(
            children: <Widget>[

              Text(
                "1.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][0]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][0]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][0]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "2.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][1]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][1]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][1]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "3.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][2]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][2]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][2]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "4.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][3]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][3]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][3]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "5.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][4]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][4]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][4]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "6.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][5]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][5]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][5]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "7.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][6]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][6]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][6]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "8.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][7]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][7]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][7]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "9.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][8]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][8]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][8]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "10.",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child:CheckboxListTile(
                  value: widget.user.disease.contains(_categories['responseBody'][9]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][9]['category_name']);
                    debugPrint('${widget.user.disease}');
                  },
                  title: Text(_categories['responseBody'][9]['category_name']),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[

              Text(
                "11. ",
                style: TextStyle(fontSize: 18.0),
              ),

              Expanded(
                child: TextFormField(
                  onSaved: (String value) {
                    if( value != '') {
                      widget.user.disease.add(value);
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Any other Cause",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ],
          ), //Any other cause

        ],
      );
  }

  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.user.disease.add(category_name);
      });
    } else {
      setState(() {
        widget.user.disease.remove(category_name);
      });
    }
  }

  void _showSnackBar(message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}