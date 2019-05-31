import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "ANM Form 5",
    home: Form5(),
  ));
}

class Form5 extends StatefulWidget {
  @override
  _Form5State createState() => _Form5State();
}

class _Form5State extends State<Form5> {

  var _isChecked1 = false;
  var _isChecked2 = false;
  var _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANM Form 5"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[

            Text(
              "According to the respondent (parent, close family member), what was the cause of death?",
              style: TextStyle(fontSize: 18.0),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Please mention the cause",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "At what level do you think the delay occured?",
                style: TextStyle(fontSize: 18.0),
              ),
            ),

            CheckboxListTile(
              value: _isChecked1,
              title: Text("Delay at home"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _isChecked1 = value;
                });
              },
            ), //Home

            CheckboxListTile(
              value: _isChecked2,
              title: Text("Delay in transportation"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _isChecked2 = value;
                });
              },
            ), //Transportation

            CheckboxListTile(
              value: _isChecked3,
              title: Text("Dealy at facility level"),
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  _isChecked3 = value;
                });
              },
            ), //Facility level

            Text(
              "Based on your analysis of the situation in which the death took place, what according to you could have been done to avert this death?",
              style: TextStyle(fontSize: 18.0),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Suggestions please",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  RaisedButton(
                    color: Colors.blue,
                    elevation: 4.0,
                    child: Text(
                      'Previous page',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: null,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    elevation: 4.0,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
