import 'package:flutter/material.dart';
import 'user.dart';


//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 3',
//    home: _verbalAutopsyFormSec3(),
//  ));
//}

class verbalAutopsy5YrSec3 extends StatefulWidget {
  final User userObj;
  verbalAutopsy5YrSec3({Key key, @required this.userObj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsy5YrSec3State();
  }
}

class _verbalAutopsy5YrSec3State
    extends State<verbalAutopsy5YrSec3> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//  String langCodeController = '';
//  String narrativeController = '';
//  String interviewerNameController = '';


//  DateTime _interviewDate = DateTime.now();

  bool knowledgeCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Section 3: Written narrative in'"\n"'local language',
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
                                onSaved: (value){widget.userObj.code = value;},
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
                        onSaved: (value){widget.userObj.symptomstype = value;},
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
                    child: CheckboxListTile(
                        value: knowledgeCheck,
                        title: Text('I hereby state that all the details filled'
                            ' above are best and true to my knowledge.'),
                        onChanged: (bool value) {
                          setState(() {
                            knowledgeCheck = value;
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
                          if (knowledgeCheck == false) {
                            // The checkbox wasn't checked
                            showSnackBar('Please check the checkbox to proceed');
                          }
                          if(_formKey.currentState.validate() && knowledgeCheck == true){

                          }
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


  void showSnackBar(String message){
    var snackBar = SnackBar(
//      backgroundColor: Colors.blue,
      content: Text(message,
        style: TextStyle(fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
