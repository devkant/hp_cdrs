import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/mo/dashboard.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'dart:async';
import 'package:hp_cdrs/app_screens/mo/socialAutopsyFormStatus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class SocialAutopsyD extends StatefulWidget {
  final User user;
  SocialAutopsyD({Key key, this.user}) : super(key: key);
  @override
  State createState() => SocialAutopsyDState();
}

class SocialAutopsyDState extends State<SocialAutopsyD> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool _declarationCheck = false;
  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_name": 'Available / Savings'},
      {"category_name": 'Borrowed'},
      {"category_name": 'Sold Assets'},
      {"category_name": 'Community fund'},
      {"category_name": 'Govt. scheme'},
      {"category_name": 'Other'},
      {"category_name": "Don't know"},
    ],
  };

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;
  var okflag = 0;

  File jsonFile;
  Directory dir;
  String fileName = "socialAutopsy.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  void initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(Map data) {

    if (fileExists) {
      jsonFile.writeAsStringSync(json.encode(data),mode: FileMode.append);
    } else {
      createFile(data, dir, fileName);
    }
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  void _onCategorySelected(bool selected, String checkValue) {
    if (selected == true) {
      setState(() {
        widget.user.availableSavings.add(checkValue);
      });
    } else {
      setState(() {
        widget.user.availableSavings.remove(checkValue);
      });
    }
  }

  void _handleSubmitted() {
    setState(() async {
      final FormState form = _formKey.currentState;
      if (form.validate()) {
        if (widget.user.availableSavings.isEmpty)
          _showSnackBar('Please check atleast one checkbox');
        else if (_declarationCheck == false)
          _showSnackBar('Please check the declaration');
        else {
          form.save();
          showWaiting();
          User child = widget.user;
          var data = createMap(child);
          sendData('http://13.235.43.83/api/social', data).then((status) {
            if (status) {
              showAlert('Form submitted successfully!', 'Sent!');
            }
            else {
              writeToFile(data);
              showAlert('Form saved in offline mode. Please do not close '
                  'the app until connected to the internet.', 'Saved');
            }
          });
        }
      _autoValidate = true;

    }});
  }

  void dialogResult(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(BuildContext  context)  =>  Dashboard()), (Route<dynamic> route) => false);
  }

  void showAlert(String value, String dialogTitle){

    AlertDialog dialog = AlertDialog(
      title: Text(dialogTitle, textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0),),
      content: Text(value, textAlign: TextAlign.justify,),
      actions: <Widget>[
        FlatButton(onPressed:(){dialogResult();}, child: Text('OK'))
      ],
    );
    showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) { return dialog;});
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void showWaiting(){

    AlertDialog dialog = AlertDialog(
//      content: Text('Please Wait...', textAlign: TextAlign.center,),
//      contentPadding: EdgeInsets.only(left: 0.0, right: 15.0, top: 15.0, bottom: 15.0),
    );
    showDialog(barrierDismissible: false, context: context,
        builder: (BuildContext context){return Dialog(
//          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: 80.0,
            width: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Image(
                        width: 70.0,
                        height: 70.0,
//                  fit: BoxFit.contain,
                        image: new AssetImage("assets/waiting.gif"))),
                Flexible(child: Text('Please Wait...', style: TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w500
                ),))
              ],
            ),
          ),
        );});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Expenditure History'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Builder(
                builder: (context) => Form(
                    key: this._formKey,
                    autovalidate: _autoValidate,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      _question16(),
                      _question17(),
                      _declaration(),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton(
                          onPressed: () {
                            _handleSubmitted();
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ]))))));
  }

  Widget _declaration() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.green.shade50),
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CheckboxListTile(
              activeColor: Colors.orangeAccent,
                value: _declarationCheck,
                title: Text('I hereby state that all the details filled'
                    ' above are best and true to my knowledge.'),
                onChanged: (bool value) {
                  setState(() {
                    _declarationCheck = value;
                  });
                }),
          ),
        ])));
  }

  Widget _question16() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        color: Colors.green.shade50),
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          ListTile(
            leading: Text(
              '16',
              style: TextStyle(fontSize: 18),
            ),
            title: Text(
              'Can you tell regarding the total amount that you had to spend on your child?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
              title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Treatment(medicines, consultation, home treatment etc.)',
            ),
          )),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.treatment = num.parse(value);
            },
            validator: (value) {
              if (value.isEmpty) return 'Fill the Treatment Cost field';
            },
          ),
          ListTile(
              title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Transport',
            ),
          )),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.transport = num.parse(value);
            },
            validator: (value) {
              if (value.isEmpty) return 'Fill the Transport Cost field';
            },
          ),
          ListTile(
              title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Others',
            ),
          )),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.othersamount = num.parse(value);
            },
            validator: (value) {
              if (value.isEmpty) return 'Fill the Other Cost field';
            },
          ),
          ListTile(
              title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Total',
            ),
          )),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.total = num.parse(value);
            },
            validator: (value) {
              if (value.isEmpty) return 'Fill the Total Cost field';
            },
          ),
        ])));
  }

  Widget _question17() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.green.shade50),
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          ListTile(
            leading: Text('17'),
            title: Text('How did you(the family) arrange this money?'),
            subtitle: Text('Multiple answers allowed. Check all that apply.'),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][0]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][0]['category_name']);
            },
            title: Text(_categories['responseBody'][0]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][1]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][1]['category_name']);
            },
            title: Text(_categories['responseBody'][1]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][2]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][2]['category_name']);
            },
            title: Text(_categories['responseBody'][2]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][3]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][3]['category_name']);
            },
            title: Text(_categories['responseBody'][3]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][4]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][4]['category_name']);
            },
            title: Text(_categories['responseBody'][4]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][5]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][5]['category_name']);
            },
            title: Text(_categories['responseBody'][5]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][6]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][6]['category_name']);
            },
            title: Text(_categories['responseBody'][6]['category_name']),
          ),
        ])));
  }

  Map createMap(User child) {
    var data = {
      'applicationNumber': child.applicationNumber,
      'referenceId': child.referenceId,
      'MCTS': child.MCTS,
      'nameOfInformant': child.nameOfInformant,
      'telephoneNumber': child.telephoneNumber,
      'familyMembers': child.familyMembers,
      'children': child.children,
      'caste': child.caste,
      'religion': child.religion,
      'bplCard': child.bplCard,
      'seekCareOutside': child.seekCareOutside,
      'wasIllnessSerious': child.wasIllnessSerious,
      'moneyNotAvailable': child.moneyNotAvailable,
      'familyMembersNotAbleAccompany': child.familyMembersNotAbleAccompany,
      'badWeather': child.badWeather,
      'didNotKnowAboutInfant': child.didNotKnowAboutInfant,
      'noHopeForSurvival': child.noHopeForSurvival,
      'transportNotAvailable': child.transportNotAvailable,
      'others': child.others,
      'quack': child.quack,
      'traditionalHealer': child.traditionalHealer,
      'subCentre': child.subCentre,
      'phc': child.phc,
      'chc': child.chc,
      'subDistrictHospital': child.subDistrictHospital,
      'districtGovtHospital': child.districtGovtHospital,
      'privateAllopathic': child.privateAllopathic,
      'doctorAlternateSystem': child.doctorAlternateSystem,
      'reasonForSeekingCare': child.reasonForSeekingCare,
      'ashaAdviceOnHospitalTreatment': child.ashaAdviceOnHospitalTreatment,
      'conditionWhenMedical': child.conditionWhenMedical,
      'Hospital': child.Hospital,
      'problem': child.problem,
      'timeTaken': child.timeTaken,
      'nil': child.nil,
      'firstAid': child.firstAid,
      'otherspecify': child.otherspecify,
      'lackOfSpecialists': child.lackOfSpecialists,
      'lackOfEquipments': child.lackOfEquipments,
      'othersreason': child.othersreason,
      'transportModeInGovt': child.transportModeInGovt,
      'transportModeInPrivate': child.transportModeInPrivate,
      'reasonForOtherInstitution': child.reasonForOtherInstitution,
      'reasonForOtherInstitutionDecision':
          child.reasonForOtherInstitutionDecision,
      'timeTakenForTreatment': child.timeTakenForTreatment,
      'informalPayment': child.informalPayment,
      'mobilizingSpecialists': child.mobilizingSpecialists,
      'workersNotAvailable': child.workersNotAvailable,
      'patientRush': child.patientRush,
      'doctorNotAvailable': child.doctorNotAvailable,
      'moneyProblem': child.moneyProblem,
      'investigationsNotDone': child.investigationsNotDone,
      'otherProblem': child.otherProblem,
      'reasonDischargedAgainstMedicalAdvice':
          child.reasonDischargedAgainstMedicalAdvice,
      'dischargedAgainstMedicalAdvice': child.dischargedAgainstMedicalAdvice,
      'circumstancesDischargeBaby': child.circumstancesDischargeBaby,
      'dischargeOnBehalf': child.dischargeOnBehalf,
      'babyDiedBeforeDischarge': child.babyDiedBeforeDischarge,
      'dischargeDueDissatisfactionTreatment':
          child.dischargeDueDissatisfactionTreatment,
      'reasonAgainstdischargedMedicalAdvice':
          child.reasonAgainstdischargedMedicalAdvice,
//      'wasGirlInfant': child.wasGirlInfant,
//      'ifGirlWasBoy': child.ifGirlWasBoy,
//      'alcohol': child.alcohol,
//      'tobacco': child.tobacco,
//      'domesticAbuseMother': child.domesticAbuseMother,
      'dangerSignsWhenNewborn': child.dangerSignsWhenNewborn,
      'listItem': child.listItem,
      'hospitalWhereNewbornTreated': child.hospitalWhereNewbornTreated,
      'nameOfFacilities': child.nameOfFacilities,
      'treatment': child.treatment,
      'transport': child.transport,
      'othersamount': child.othersamount,
      'total': child.total,
      'availableSavings': child.availableSavings,
    };
    return data;
  }
}
