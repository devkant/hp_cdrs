import "package:flutter/material.dart";
import 'package:hp_cdrs/app_screens/ANM/user.dart';

import 'anm2.dart';

//void main() {
//  runApp(MaterialApp(
//    title: "ANM Form",
//    home: ANMWorker(),
//  ));
//}

class ANMWorker extends StatefulWidget {

  User user = User();
  final String appliNumber;
  ANMWorker({Key key,@ required this.user, this.appliNumber}):super(key:key);

  @override
  _ANMWorkerState createState() => _ANMWorkerState();
}

class _ANMWorkerState extends State<ANMWorker> {

  @override
  void initState() {
    super.initState();

    widget.user.gender = dropdownGender[0];
    widget.user.orderOfBirth = dropdownOrderOfBirth[0];
    widget.user.caste = dropdownCaste[0];
    widget.user.bplCard = dropdownBPL[0];
    widget.user.growthCurve = growthCurve[0];
    widget.user.pastIllness = dropdownPastIllness[0];
    widget.user.address.district = null;
    widget.user.address.block = null;

  }

  //formkey
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Dropdown
  var dropdownGender = ['Male', 'Female'];
  var dropdownOrderOfBirth = ['1', '2', '3', '4', '5 or more'];
  var dropdownCaste = ['SC', 'ST', 'OBC', 'General'];
  var dropdownBPL = ['Yes', 'No'];
  var growthCurve = ['None', 'Green zone', 'Yellow zone', 'Orange zone'];
  var dropdownPastIllness = ['No', 'Yes'];

  //defining again due to null errors
  //var gender;
//  String area;
//  int pincode;
//  var district = null;
//  var block = null;
//  var orderOfBirth = '1';
//  var caste = 'SC';
//  var bplCard = 'No';
//  var variableGrowthCurve = 'None';
//  var pastIllness = 'No';
//  var immunization = List();

  var _districtName = ['BILASPUR', 'CHAMBA', 'HAMIRPUR', 'KANGRA', 'KINNAUR','KULLU', 'LAHAUL AND SPITI', 'MANDI', 'SHIMLA', 'SIRMOUR', 'SOLAN', 'UNA'];

  var _bilaspurBlocks = ["SADAR","GHUMARWIN","JHANDUTTA"];

  var _chambaBlocks = ["TISSA","CHAMBA","MEHLA","BHATTIYAT","SALOONI","BHARMOUR","PANGI"];

  var _hamirpurBlocks = ["BAMSON","BHORANJ","BIJHARI","HAMIRPUR","NADAUN","SUJANPUR"];

  var _kangraBlocks = ["RAIT","PANCHRUKHI","DEHRA","FATEHPUR","INDORA","NAGROTA BAGWAN","NURPUR","NAGROTA SURIAN","BAIJNATH","BHAWARNA","KANGRA","LAMBAGAON","SULLAH","PRAGPUR","DHARAMSHALA"];

  var _kinnaurBlocks = ["NICHAR","POOH","KALPA"];

  var _kulluBlocks = ["ANNI","NAGGAR","NIRMAND"];

  var _lahulBlocks = ["LAHAUL","SPITI"];

  var _mandiBlocks = ["BALH","CHAUNTRA","DHARAMPUR","DRANG","GOHAR","GOPALPUR","KARSOG","SADAR MANDI","SERAJ","SUNDERNAGAR"];

  var _shimlaBlocks = ["NARKANDA","THEOG","BASANTPUR","NANKHARI","CHHOHARA","MASHOBRA","CHOPAL","JUBBAL & KOTHKAI","ROHRU","RAMPUR"];

  var _sirmourBlocks = ["NAHAN","PAONTA","PACHHAD","RAJGARH","SANGRAH","SHILLAI"];

  var _solanBlocks = ["DHARAMPUR","KANDAGHAT","KUNIHAR","NALAGARH","SOLAN"];

  var _unaBlocks = ["AMB","BANGANA","GAGRET","HAROLI","UNA"];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "1",

        "category_name": "BCG"},

      {"category_id": "2",

        "category_name": "Penta 1"},

      {"category_id": "3",

        "category_name": "Penta 2"},

      {"category_id": "4 ",

        "category_name": "Penta 3"},

      {"category_id": "5",

        "category_name": "MR 1"},

      {"category_id": "6",

        "category_name": "MR booster"},


    ],
    "responseTotalResult":
    6 // Total result is 3 here because we have 3 categories in responseBody.
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("A: Background Information")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: widget.appliNumber,
                    onSaved: (String value) {widget.user.applicationNumber = value;},
                    validator: (String value) {
                      if(value.isEmpty)
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: "Application No",
                        hintText: "Application No",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    keyboardType: TextInputType.number,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "1. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          onSaved: (String value) {widget.user.name = value;},
                          validator: (String value) {
                            final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                            if (!nameExp.hasMatch(value))
                              return 'Please enter only alphabetical values';
                          },
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.only(top: 20.0),
                              labelText: "Name of Child",
                              hintText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ), //Name

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Text(
                        "2. Age:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: TextFormField(
                            validator: (String val) {
                              if (val.isEmpty || int.parse(val)>4) {
                                return 'Please enter a valid input';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Years",
                                hintText: "Years",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {widget.user.age.years = int.parse(value);},
                          ),
                        ),
                      ), //Years
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextFormField(
                            validator: (String val) {
                              if (val.isEmpty || int.parse(val)>11) {
                                return 'Please enter a valid input';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Months",
                                hintText: "Months",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {widget.user.age.months = int.parse(value);},
                          ),
                        ),
                      ), //Months
                      Expanded(
                        child: TextFormField(
                          validator: (String val) {
                            if (int.parse(val)>31 || val.isEmpty) {
                              return 'Please enter a valid input';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Days",
                              hintText: "Days",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.number,
                          onSaved: (String value) {widget.user.age.days = int.parse(value);},
                        ),
                      ), //Days

                    ],
                  ),
                ), //Age

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "3. Gender:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: dropdownGender.map((String value2) {
                          return DropdownMenuItem<String>(
                            value: value2,
                            child: Text(value2),
                          );
                        }).toList(),
                        value: widget.user.gender,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.gender = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Gender

                //new district
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(children: <Widget>[
                    Text('4. District:  ', style: TextStyle(fontSize: 18.0),),

                    DropdownButton<String>(
                      hint: Text('Select here'),
                      items: _districtName.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: widget.user.address.district,
                      onChanged: (String newSelectedValue) {
                        setState(() {
                          _onDropDownDistrictSelected(newSelectedValue);
                        });
                      },
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(children: <Widget>[
                    Text('5. Block:  ', style: TextStyle(fontSize: 18.0),),

                    blocksWidgetFun(),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "6. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          onSaved: (String value) {widget.user.address.area = value;},
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (String val) {
                            if (val.isEmpty) {
                              return 'Please enter a valid input';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Address",
                              hintText: "Address",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                    ],
                  ),
                ), //Area

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "7. ",
                        style: TextStyle(fontSize: 18.0),
                      ),

                      Expanded(
                        child: TextFormField(
                          onSaved: (String value) {widget.user.address.pincode = int.parse(value);},
                          keyboardType: TextInputType.number,
                          validator: (String val) {
                            if (val.isEmpty || int.parse(val)<170000 || int.parse(val)>179999 ) {
                              return 'Please enter a valid input';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Pincode",
                              hintText: "Pincode",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                    ],
                  ),
                ), //Pincode

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "8. Order of Birth:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: dropdownOrderOfBirth.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: widget.user.orderOfBirth,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.orderOfBirth = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Order of Birth

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "9. Caste:  ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: dropdownCaste.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: widget.user.caste,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.caste = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Caste

                Row(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "10. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Does the family have Below Poverty Line(BPL) Card:",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: dropdownBPL.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: widget.user.bplCard,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.bplCard = newValueSelected;
                          });
                        },
                      ),
                    ),
                  ],
                ), //BPL

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "11. Immunization Status: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ), //Immunization Status

                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][0]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][0]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][0]['category_name']),
                ),
                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][1]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][1]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][1]['category_name']),
                ),
                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][2]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][2]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][2]['category_name']),
                ),
                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][3]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][3]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][3]['category_name']),
                ),
                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][4]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][4]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][4]['category_name']),
                ),
                CheckboxListTile(
                  value: widget.user.immunization.contains(_categories['responseBody'][5]['category_name']),
                  onChanged: (bool selected) {
                    _onCategorySelected(selected,_categories['responseBody'][5]['category_name']);
                    debugPrint('${widget.user.immunization}');
                  },
                  title: Text(_categories['responseBody'][5]['category_name']),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[

                      Text(
                        "12. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Flexible(
                        child: TextFormField(
                          validator: (String val) {
                            if (val.isEmpty) {
                              return 'Please enter a valid input';
                            }
                          },
                          onSaved: (String value) { widget.user.weight = double.parse(value);},
                          decoration: InputDecoration(
                              labelText: "Weight",
                              hintText: "In Kgs(if recorded in the MCP Card or 0)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ), //Weight

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "13. ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Growth Curve (fill for <3 years; check MCP Card):  ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: DropdownButton<String>(
                        items: growthCurve.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: widget.user.growthCurve,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.growthCurve = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Growth Curve

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "14. Any Past Illness: ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: DropdownButton<String>(
                        items: dropdownPastIllness.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                        value: widget.user.pastIllness,
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this.widget.user.pastIllness = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Past Illness

                natureOfIllnessFun(), //Nature of Illness

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 4.0,
                      child: Text(
                        'Next Section',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate() && widget.user.address.district != null && widget.user.address.block != null) {
                          setState(() {
                            final form = _formKey.currentState;
                            form.save();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Form2(user: widget.user)));
                          });
                        }
                        else if(widget.user.address.district == null || widget.user.address.block == null) {
                          _showSnackBar('Please select the block & district to proceed');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDropDownDistrictSelected(String newSelectedValue) {
    setState(() {
      this.widget.user.address.district = newSelectedValue;
      this.widget.user.address.block = null;
    });
  }

  Widget blocksWidgetFun(){
    if(widget.user.address.district == null) {
      return DropdownButton<String>(
        disabledHint: Text('Select here'),
        items: null,
        onChanged: (String newValueSelected){
          setState(() {
            widget.user.address.block = null
            ;
          });
        },
      );
    }

    else {
      switch (widget.user.address.district) {
        case 'BILASPUR':
          return
            blocksDropDownFun(_bilaspurBlocks);
          break;

        case 'CHAMBA':
          return
            blocksDropDownFun(_chambaBlocks);
          break;

        case 'HAMIRPUR':
          return
            blocksDropDownFun(_hamirpurBlocks);
          break;

        case 'KANGRA':
          return
            blocksDropDownFun(_kangraBlocks);
          break;

        case 'KINNAUR':
          return
            blocksDropDownFun(_kinnaurBlocks);
          break;

        case 'KULLU':
          return
            blocksDropDownFun(_kulluBlocks);
          break;

        case 'LAHAUL AND SPITI':
          return
            blocksDropDownFun(_lahulBlocks);
          break;

        case 'MANDI':
          return
            blocksDropDownFun(_mandiBlocks);
          break;

        case 'SHIMLA':
          return
            blocksDropDownFun(_shimlaBlocks);
          break;

        case 'SIRMOUR':
          return
            blocksDropDownFun(_sirmourBlocks);
          break;

        case 'SOLAN':
          return
            blocksDropDownFun(_solanBlocks);
          break;

        case 'UNA':
          return
            blocksDropDownFun(_unaBlocks);
          break;
      }
    }
  }

  Widget blocksDropDownFun(List<String> passedList){

    return DropdownButton<String>(
      hint: Text("Select here"),
      items: passedList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: widget.user.address.block,
      onChanged: (String newSelectedValue) {
        setState(() {
          this.widget.user.address.block = newSelectedValue;
        });
      },
    );
  }

  Widget natureOfIllnessFun() {
    if( widget.user.pastIllness == 'Yes') {
      return TextFormField(
        onSaved: (String value) { widget.user.natureOfIllness = value;},
        validator: (String val) {
          if (val.isEmpty) {
            return 'Please enter a valid input';
          }
        },
        decoration: InputDecoration(
            labelText: "If Yes",
            hintText: "nature of illness",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
            )
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      );
    }
    else {
      return Center(child: Text(""));
    }
  }

  void _onCategorySelected(bool selected, category_name) {
    if (selected == true) {
      setState(() {
        widget.user.immunization.add(category_name);
      });
    } else {
      setState(() {
        widget.user.immunization.remove(category_name);
      });
    }
  }

  void _showSnackBar(String message){
    var snackBar = SnackBar(
//      backgroundColor: Colors.blue,
      content: Text(message,
        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}