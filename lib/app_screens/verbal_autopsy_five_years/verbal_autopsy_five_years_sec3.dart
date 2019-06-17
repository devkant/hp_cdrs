import 'package:flutter/material.dart';
import 'user.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'package:hp_cdrs/app_screens/mo/postNeoFormStatus.dart';

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

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;


//  String langCodeController = '';
//  String narrativeController = '';
//  String interviewerNameController = '';


//  DateTime _interviewDate = DateTime.now();

  bool knowledgeCheck = false;

  void  initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

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
                        setState(() async{
                          if (knowledgeCheck == false) {
                            // The checkbox wasn't checked
                            showSnackBar('Please check the checkbox to proceed');
                          }
                          if(_formKey.currentState.validate() && knowledgeCheck == true){
                            final FormState form = _formKey.currentState;
                            form.save();

                            User child  = widget.userObj;
                            var data  = createMap(child);

                            print(data);
                            print(isOffline);
                            var status  = await apiRequest('http://13.126.72.137/api/test',data);
                            if(!isOffline && status){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PostNeoFormsStatus(
                                        newEntry: null,)));
                            }
                            else{
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PostNeoFormsStatus(
                                        newEntry: widget.userObj,)));
                            }
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

  dynamic createMap(User child) {
    var data = {
      'applicationNumber' : child.applicationNumber,
      'district': child.district,
      'block': child.block,
      'village': child.village,
      'phc': child.phc,
      'subCenter': child.subCenter,
      'rhc': child.rhc.toString(),
      'year': child.year.toString(),
      'head': child.head,
      'name': child.name,
      'mother': child.mother,
      'firstHys': child.firstHys,
      'secondHys': child.secondHys,

      'respondent': child.respondent,
      'relationship': child.relationship,
      'liveWith': child.liveWith,
      'respondentEducation': child.respondentEducation,
      'category': child.category,
      'religionHead': child.religionHead,
      'sex': child.sex,
      'ageDays': child.ageDays,
      'dob': child.dob,
      'dod': child.dod,
      'districtAddress': child.districtAddress,
      'locality': child.locality,
      'pincode': child.pincode,
      'placeDeath': child.placeDeath,
      'respondentThink': child.respondentThink,

      'injury': child.injury,
      'kindOfInjury': child.kindOfInjury,
      'firstBreastfed': child.firstBreastfed,
      'otherThanBreastMilk': child.otherThanBreastMilk,
      'breastMilkDuringIllness': child.breastMilkDuringIllness,

      'fever': child.fever,
      'daysFeverLast': child.daysFeverLast,
      'chillsOrRigorsDuringFever': child.chillsOrRigorsDuringFever,
      'convulsionsOrFits': child.convulsionsOrFits,
      'unconscious': child.unconscious,
      'stiffness': child.stiffness,
      'stiffneck': child.stiffneck,
      'diarrhoea': child.diarrhoea,
      'daysDiarrhoea': child.daysDiarrhoea,
      'bloodInStools': child.bloodInStools,

      'cough': child.cough,
      'daysCough': child.daysCough,
      'bloodInCough': child.bloodInCough,
      'difficultyBreathing': child.difficultyBreathing,
      'daysDifficultyBreathing': child.daysDifficultyBreathing,
      'fastBreathing': child.fastBreathing,
      'inDrawingChest':  child.inDrawingChest,
      'wheezing': child.wheezing,
      'abdominalPainDuringIllness': child.abdominalPainDuringIllness,
      'abdominalDistention': child.abdominalDistention,
      'vomit': child.vomit,
      'daysVomit': child.daysVomit,
      'yellowEyesOrSkin': child.yellowEyesOrSkin,

      'rashAllOverBody': child.rashAllOverBody,
      'redEyes': child.redEyes,
      'measles': child.measles,
      'thinWeekPreceedingDeath': child.thinWeekPreceedingDeath,
      'swellingOfHandsFeetOrAbdomenWeekPreceedingDeath': child.swellingOfHandsFeetOrAbdomenWeekPreceedingDeath,
      'lackOfBloodWeekPreceedingDeath': child.lackOfBloodWeekPreceedingDeath,
      'growingNormally': child.growingNormally,
      'multipleIllness': child.multipleIllness,
      'symptomsOfIllness': child.symptomsOfIllness,
      'bcgInjection': child.bcgInjection,
      'dpt3Doses': child.dpt3Doses,
      'polioDrops': child.polioDrops,
      'injectionForMeasles': child.injectionForMeasles,

      'code': child.code,
      'symptomstype': child.symptomstype,
    };
    return data;
  }

}
