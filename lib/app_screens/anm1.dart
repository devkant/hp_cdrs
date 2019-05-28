import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    title: "Nothing",
    home: ANMWorker(),
  ));
}

class ANMWorker extends StatefulWidget {
  @override
  _ANMWorkerState createState() => _ANMWorkerState();
}

class _ANMWorkerState extends State<ANMWorker> {

  var _age = ['0-28 days', '1-12 months', '1-2 years', '2-3 years', '3-4 years', '4-5 years'];
  var _currentItemSelected = '0-28 days';
  var _sex = ['Male', 'Female'];
  var _currentsex = 'Male';
  var _orderOfBirth = ['1', '2', '3', '4', '5 or more'];
  var _currentOrderOfBirth = '1';
  var _category = ['General', 'SC', 'ST', 'OBC'];
  var _currentCategory = 'General';
  var _BPL = ['Yes', 'No'];
  var _currentBPL = 'Yes';
  var _growthCurve = ['Green zone', 'Yellow zone', 'Orange zone', 'None'];
  var _currentGrowthCurve = 'None';
  var _pastIllness = ['Yes', 'No'];
  var _currentPastIllness = 'No';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ANM Worker")
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                TextField(
                  decoration: InputDecoration(
                      labelText: "Name of Child",
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      )
                  ),
                  keyboardType: TextInputType.text,
                ), //Name

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Age:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _age.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentItemSelected,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentItemSelected = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Age

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Sex:",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _sex.map((String value2) {
                          return DropdownMenuItem<String>(
                            value: value2,
                            child:Text(value2),
                          );
                        }).toList(),

                        value: _currentsex,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentsex = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Sex

                //Address

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Order of Birth",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _orderOfBirth.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentOrderOfBirth,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentOrderOfBirth = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Order of Birth

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Category: ",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _category.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentCategory,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentCategory = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Category

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Does the family have Below Poverty Line(BPL) Card:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _BPL.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentBPL,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentBPL = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ),  //BPL

                //Immunization Status

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Weight",
                        hintText: "In Kgs(if recorded in the MCP Card)",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ), //Weight

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Growth Curve (fill for <3 years; check MCP Card):",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _growthCurve.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentGrowthCurve,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentGrowthCurve = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Growth Curve

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Any Past Illness: ",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child:DropdownButton<String>(
                        items: _pastIllness.map((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child:Text(value1),
                          );
                        }).toList(),

                        value: _currentPastIllness,

                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentPastIllness= newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ), //Past Illness

                TextField(
                  decoration: InputDecoration(
                      labelText: "If Yes",
                      hintText: "nature of illness",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      )
                  ),
                  keyboardType: TextInputType.text,
                ), //Nature of Illness

              ],
            ),
          ),
        ),
      ),
    );
  }
}
