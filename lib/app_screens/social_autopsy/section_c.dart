import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/section_d.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyC extends StatefulWidget {
  final User user;
  SocialAutopsyC({Key key, this.user}):super(key:key);
  @override
  State createState() => SocialAutopsyCState();
}

class SocialAutopsyCState extends State<SocialAutopsyC> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleRadioValueChange1(String value) {
    setState(() {
      widget.user.dangerSignsWhenNewborn = value;
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      widget.user.hospitalWhereNewbornTreated = value;
    });
  }

//  void _handleRadioValueChange3(String value) {
//    setState(() {
//      widget.user.wasGirlInfant = value;
//    });
//  }

  void _onCategorySelected(bool selected, String checkValue) {
    if (selected == true) {
      setState(() {
        widget.user.listItem.add(checkValue);
      });
    } else {
      setState(() {
        widget.user.listItem.remove(checkValue);
      });
    }
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    form.save();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => (SocialAutopsyD(user:widget.user))),
    );
  }

  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_name": 'Pre-term'},
      {"category_name": 'LBW'},
      {"category_name": 'No cry at birth'},
      {"category_name": 'Fits'},
      {"category_name": 'Drowsiness/inactivity/unconsciousness'},
      {"category_name": 'Jaundice'},
      {"category_name": "Diarrhoea"},
      {"category_name": "Refusal to feed"},
      {"category_name": "Fast Breathing"},
      {"category_name": "High grade fever"},

    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Brief Social History \nof the Family'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Builder(
                builder: (context) => Form(
                  key: this._formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
//                      ListTile(
//                        leading: Text('15'),
//                        title: Text('Was this the death of a girl infant?'),
//                      ),
//                      RadioListTile(
//                        title: Text('Yes'),
//                        value: 'yes',
//                        groupValue: widget.user.wasGirlInfant,
//                        onChanged: _handleRadioValueChange3,
//                      ),
//                      RadioListTile(
//                        title: Text('No'),
//                        value: 'no',
//                        groupValue: widget.user.wasGirlInfant,
//                        onChanged: _handleRadioValueChange3,
//                      ),
//                      _handleWasGirlInfant(),
//                              ListTile(
//                                leading: Text('16)',style: TextStyle(fontWeight: FontWeight.bold),),
//                                title: Text('Does anyone in the family takes alcohol on almost daily basis and / or smokes and is there any history of domestic violence?',style: TextStyle(fontWeight: FontWeight.bold),),
//                              ),
//                              _handleAlcoholTobaccoAbuse(),
                      ListTile(
                        leading: Text('15)',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                          'Awareness of mother & family members about seeking treatment',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Text('15.1'),
                        title: Text(
                            'Do you know the danger signs when a newborn or infant should be taken to health facility?'),
                      ),
                      RadioListTile(
                        title: Text('Yes'),
                        value: 'yes',
                        groupValue: widget.user.dangerSignsWhenNewborn,
                        onChanged: _handleRadioValueChange1,
                      ),
                      RadioListTile(
                        title: Text('No'),
                        value: 'no',
                        groupValue: widget.user.dangerSignsWhenNewborn,
                        onChanged: _handleRadioValueChange1,
                      ),
                      _handleDangerSigns(),
                      ListTile(
                        leading: Text('15.2'),
                        title: Text(
                            'Do you know about any hospital where newborns / infants / children can be admitted and treated?'),
                      ),
                      RadioListTile(
                        title: Text('Yes'),
                        value: 'yes',
                        groupValue: widget.user.hospitalWhereNewbornTreated,
                        onChanged: _handleRadioValueChange2,
                      ),
                      RadioListTile(
                        title: Text('No'),
                        value: 'no',
                        groupValue: widget.user.hospitalWhereNewbornTreated,
                        onChanged: _handleRadioValueChange2,
                      ),
                      _handleNewbornTreated(),
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
                    ]))))));
  }

  Widget _handleDangerSigns() {
    if (widget.user.dangerSignsWhenNewborn == 'yes') {
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.green.shade50),
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
                  ListTile(
                    leading: Text('17.2'),
                    title: Text('List them :'),
                  ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][0]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][0]['category_name']);
                },
                title: Text(_categories['responseBody'][0]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][1]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][1]['category_name']);
                },
                title: Text(_categories['responseBody'][1]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][2]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][2]['category_name']);
                },
                title: Text(_categories['responseBody'][2]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][3]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][3]['category_name']);
                },
                title: Text(_categories['responseBody'][3]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][4]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][4]['category_name']);
                },
                title: Text(_categories['responseBody'][4]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][5]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][5]['category_name']);
                },
                title: Text(_categories['responseBody'][5]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][6]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][6]['category_name']);
                },
                title: Text(_categories['responseBody'][6]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][7]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][7]['category_name']);
                },
                title: Text(_categories['responseBody'][7]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][8]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][8]['category_name']);
                },
                title: Text(_categories['responseBody'][8]['category_name']),
              ),
              CheckboxListTile(
                value: widget.user.listItem
                    .contains(_categories['responseBody'][9]['category_name']),
                onChanged: (bool selected) {
                  _onCategorySelected(
                      selected, _categories['responseBody'][9]['category_name']);
                },
                title: Text(_categories['responseBody'][9]['category_name']),
              ),
            ],
          )));
    } else {
      widget.user.listItem.clear();
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }

  Widget _handleNewbornTreated() {
    if (widget.user.hospitalWhereNewbornTreated == 'yes') {
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green.shade50),
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            ListTile(
              leading: Text('17.4'),
              title: Text('Please name these facilities'),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Type here..'),
            onSaved: (value) {
                  widget.user.nameOfFacilities = value;
            },)
          ])));
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }

//  Widget _handleWasGirlInfant() {
//    if (widget.user.wasGirlInfant == 'yes') {
//      return Container(
//          width: MediaQuery.of(context).size.width,
//          color: Colors.green.shade50,
//          margin: EdgeInsets.all(10.0),
//          child: SingleChildScrollView(
//              child: Column(children: <Widget>[
//            ListTile(
//              title: Text(
//                  'What could have done differently if it could have been a boy?'),
//            ),
//            TextFormField(
//                keyboardType: TextInputType.multiline,
//                maxLines: null,
//                decoration: InputDecoration(hintText: 'Type here..'),
//            onSaved: (value) {
//                  widget.user.ifGirlWasBoy = value;
//            },)
//          ])));
//    } else {
//      return Container(
//        height: 0.0,
//        width: 0.0,
//      );
//    }
//  }

//  Widget _handleAlcoholTobaccoAbuse() {
//    return Container(
//        width: MediaQuery.of(context).size.width,
//        decoration: BoxDecoration(
//            border: Border.all(color: Colors.black),
//            borderRadius: BorderRadius.circular(5.0),
//            color: Colors.green.shade50),
//        margin: EdgeInsets.all(10.0),
//        child: SingleChildScrollView(
//            child: Column(children: <Widget>[
//              ListTile(
//                leading: Text('16.1'),
//                title: Text('Alcohol'),
//              ),
//              CheckboxListTile(
//                title: Text('Mother'),
//                value: widget.user.alcohol[0],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.alcohol[0] = value;
//                  });
//                },
//              ),
//              CheckboxListTile(
//                title: Text('Father'),
//                value: widget.user.alcohol[1],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.alcohol[1] = value;
//                  });
//                },
//              ),
//              CheckboxListTile(
//                title: Text('Other'),
//                value: widget.user.alcohol[2],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.alcohol[2] = value;
//                  });
//                },
//              ),
//              ListTile(
//                leading: Text('16.2'),
//                title: Text('Tobacco'),
//              ),
//              CheckboxListTile(
//                title: Text('Mother'),
//                value: widget.user.tobacco[0],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.tobacco[0] = value;
//                  });
//                },
//              ),
//              CheckboxListTile(
//                title: Text('Father'),
//                value: widget.user.tobacco[1],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.tobacco[1] = value;
//                  });
//                },
//              ),
//              CheckboxListTile(
//                title: Text('Other'),
//                value: widget.user.tobacco[2],
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.tobacco[2] = value;
//                  });
//                },
//              ),
//              ListTile(
//                leading: Text('16.3'),
//                title: Text('Is there any h/o Domestic violence (physical beating or verbal abuses)?'),
//              ),
//              CheckboxListTile(
//                title: Text('Mother'),
//                value: widget.user.domesticAbuseMother,
//                onChanged: (bool value) {
//                  setState(() {
//                    widget.user.domesticAbuseMother = value;
//                  });
//                },
//              ),
//            ])));
//  }

}
