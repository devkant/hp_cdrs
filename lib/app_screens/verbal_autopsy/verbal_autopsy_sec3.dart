import 'package:flutter/material.dart';
import 'user.dart';


//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 3',
//    home: _verbalAutopsyFormSec3(),
//  ));
//}

class verbalAutopsySec3 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec3({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec3State();
  }
}

class _verbalAutopsySec3State
    extends State<verbalAutopsySec3> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//  String langCodeController = '';
//  String narrativeController = '';
//  String interviewerNameController = '';


//  DateTime _interviewDate = DateTime.now();

  bool _knowledgeCheck = false;


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
                          child: Text('44. ', style: TextStyle(fontSize: 16.0),),
                        ),


                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('Narrative language'"\n"'code:', style: TextStyle(fontSize: 16.0),)
                            ,),),
                        Flexible(
                            child: TextFormField(
                                onSaved: (value){widget.verbal_Autopsy_Obj.narrativeLanguageCode = value;},
                                keyboardType: TextInputType.numberWithOptions(),
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.symptoms = value;},
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
                          if ( _knowledgeCheck == false) {
                            // The checkbox wasn't checked
                            showSnackBar('Please check the checkbox to proceed');
                          }
                          if(_formKey.currentState.validate()){
                            final FormState form = _formKey.currentState;
                            form.save();
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
