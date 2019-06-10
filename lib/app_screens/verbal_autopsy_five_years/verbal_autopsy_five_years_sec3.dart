import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 3',
    home: _verbalAutopsyFormSec3(),
  ));
}

class _verbalAutopsyFormSec3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormSec3State();
  }
}

class _verbalAutopsyFormSec3State
    extends State<_verbalAutopsyFormSec3> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController langCodeController = TextEditingController();
  TextEditingController narrativeController = TextEditingController();
  TextEditingController interviewerNameController = TextEditingController();


  DateTime _interviewDate = DateTime.now();

  bool _knowledgeCheck = false;


  Future<Null> _selectInterviewDate(BuildContext context) async {
    final DateTime pickedDOB = await showDatePicker(
      context: context,
      initialDate: _interviewDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if (pickedDOB != null && pickedDOB != _interviewDate) {
      print('Date Selected');
      setState(() {
        _interviewDate = pickedDOB;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Section 3: Written narrative in local language',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[


                  //1st user input element start
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text('33. ', style: TextStyle(fontSize: 16.0),),
                        ),


                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('Narrative language'"\n"'code:', style: TextStyle(fontSize: 16.0),)
                            ,),),
                        Flexible(
                            child: TextFormField(
                                controller: langCodeController,
                                validator: (String value) {
                                  if (value.isEmpty) return 'Please input the Code';
                                },
                                decoration: InputDecoration(
                                    labelText: 'Language Code',
                                    hintText: 'Language Code',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0))))
                        )],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Please describe the symptoms in order of appearance, '
                        'doctor consulted or hospitalization, history of similar'
                        ' episodes, enter the results'
                        ' from reports of the investigations if available.'
                      , style: TextStyle(fontSize: 16.0),)
                    ,),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: narrativeController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please input a valid entry';
                        },
                        decoration: InputDecoration(
                          labelText: 'Narrative in local language',
                          hintText: 'Narrative in local language',
                        )),),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(children:
                      <Widget>[

                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child:  Text('Interviewer name:', style: TextStyle(fontSize: 16.0),),),

                        Flexible(
                          child: TextFormField(
                              controller: interviewerNameController,
                              validator: (String value) {
                                if (value.isEmpty) return 'Please input a valid entry';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Interviewer name',
                                  hintText: 'Interviewer name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0))
                              )),)])),


                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[

                          Text(
                            'Date of interview:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RaisedButton(
                                color: Colors.white,
                                elevation: 2.0,
                                child: Text(
                                  "${_interviewDate.day}/${_interviewDate.month}"
                                      "/${_interviewDate.year}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {
                                  _selectInterviewDate(context);
                                }),
                          )
                        ],
                      )),



                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CheckboxListTile(
                        value: _knowledgeCheck,
                        title: Text('I hereby state that all the details filled'
                            ' above are best and true to my knowledge.'),
                        onChanged: (bool value) {
                          setState(() {
                            _knowledgeCheck = value;
                          });
                        }),
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
                          if (_formKey.currentState.validate() && _knowledgeCheck == true)
                            AlertDialog(
                              title: Text('Form Submitted Sucessfully'),
                              content: Text('Success'),
                            );
                        });
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
