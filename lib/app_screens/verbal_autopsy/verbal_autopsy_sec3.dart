import 'package:flutter/material.dart';
import 'user.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'package:hp_cdrs/app_screens/mo/neoFormStatus.dart';


void main() {
  runApp(MaterialApp(
    title: 'Verbal Autopsy Form Section 3',
    home: verbalAutopsySec3(),
  ));
}

class verbalAutopsySec3 extends StatefulWidget {
  final user verbal_Autopsy_Obj;
  verbalAutopsySec3({Key key, @required this.verbal_Autopsy_Obj}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsySec3State();
  }
}

class _verbalAutopsySec3State extends State<verbalAutopsySec3> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

//  String langCodeController = '';
//  String narrativeController = '';
//  String interviewerNameController = '';


//  DateTime _interviewDate = DateTime.now();

  bool _knowledgeCheck = false;

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
                          if ( _knowledgeCheck == false) {
                            // The checkbox wasn't checked
                            showSnackBar('Please check the checkbox to proceed');
                          }

                          if(_formKey.currentState.validate() && _knowledgeCheck  ==  true){
                            _formKey.currentState.save();

                            user child  = widget.verbal_Autopsy_Obj;
                            var data  = createMap(child);

                            sendData('http://13.126.72.137/api/test',data).then((status){
                              print(status);
                              if(status) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        neoFormsStatus(
                                          newEntry: null,)));
                              }
                              else{
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        neoFormsStatus(
                                          newEntry: widget.verbal_Autopsy_Obj,)));
                              }


                            });

                          }
                      }
                      )
              )
          ]
    ),)
                      )




    ));
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

  dynamic createMap(user child){
    var data  = {
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

      // Details of respondent
      'respondent': child.respondent,
      'relationship': child.relationship,
      'liveWith': child.liveWith,
      'respondentEducation': child.respondentEducation,
      'category': child.category,
      'religion': child.religion,

      // Details of deceased
      'sex': child.sex,
      'ageInDays': child.ageInDays,
      'dob': child.dob,
      'dod': child.dod,
      'address': child.address,
      'pin': child.pin.toString(),
      'placeOfDeath': child.placeOfDeath,
      'probableCause': child.probableCause,

      // Neonatal
      'injury': child.injury,
      'kindOfInjury': child.kindOfInjury,
      'pregnancyDuration': child.pregnancyDuration.toString(),
      'mothersAge': child.mothersAge.toString(),
      'td': child.td,
      'complications': child.complications,
      'complicationsType': child.complicationsType.toString(),
      'singleOrMultiple': child.singleOrMultiple,
      'birthPlace': child.birthPlace,
      'attendedDelivery': child.attendedDelivery,
      'umbilicalCord': child.umbilicalCord,

      // After Birth
      'moveCryBreathe': child.moveCryBreathe,
      'bruises': child.bruises,
      'malformations': child.malformations,
      'size': child.size,
      'weight': child.weight.toString(),
      'stopCry': child.stopCry,
      'daysAfterStoppedCrying': child.daysAfterStoppedCrying,
      'firstBreastfed': child.firstBreastfed,
      'otherThanBreastMilk': child.otherThanBreastMilk,
      'suckleNormally': child.suckleNormally,
      'StopSuckingInNormalWay': child.StopSuckingInNormalWay,
      'CompletedDays': child.CompletedDays,

      // Details of sickness at death
      'fever': child.fever,
      'feverDays': child.feverDays,
      'difficultyBreathing': child.difficultyBreathing,
      'difficultyBreathingDays': child.difficultyBreathingDays,
      'fastBreathing': child.fastBreathing,
      'fastBreathingDays': child.fastBreathingDays,
      'inDrawingChest': child.inDrawingChest,
      'cough': child.cough,
      'grunting': child.grunting,
      'nostrilsFlare': child.nostrilsFlare,
      'diarrhoea': child.diarrhoea,
      'diarrhoeaDays': child.diarrhoeaDays,
      'vomit': child.vomit,
      'vomitDays': child.vomitDays,
      'rednessAroundUmbilicalCord': child.rednessAroundUmbilicalCord,
      'pustulesRashes': child.pustulesRashes,
      'yellowEyesOrSkin': child.yellowEyesOrSkin,
      'spasmsOrFits': child.spasmsOrFits,
      'unresponsiveOrUnconscious': child.unresponsiveOrUnconscious,
      'bulgingFontanelle': child.bulgingFontanelle,
      'cold': child.cold,
      'legsDiscoloured': child.legsDiscoloured,
      'yellow': child.yellow,
      'blood' : child.blood,
      'narrativeLanguageCode': child.narrativeLanguageCode,

      'symptoms': child.symptoms,
//date: { day: { type: Number }, month: { type: Number }, year: { type: Number } }
    };
    return data;
  }

}
