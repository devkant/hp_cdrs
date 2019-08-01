import 'package:flutter/material.dart';
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/asha_worker/asha_home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:hp_cdrs/model/classes/class_asha.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hp_cdrs/common/apifunctions/sendDataAPI.dart';
import 'package:hp_cdrs/connectionStatus.dart';



class hpForm extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _hpFormState();
  }
}

class _hpFormState extends State<hpForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  var _formKey = GlobalKey<FormState>();

  var _deceasedSexList = ['Male', 'Female'];

  var _districtName = ['BILASPUR', 'CHAMBA', 'HAMIRPUR', 'KANGRA', 'KINNAUR',
    'KULLU', 'LAHAUL AND SPITI', 'MANDI', 'SHIMLA', 'SIRMOUR', 'SOLAN', 'UNA'];

  var _bilaspurBlocks = ["SADAR","GHUMARWIN","JHANDUTTA"];

  var _chambaBlocks = ["TISSA","CHAMBA","MEHLA","BHATTIYAT","SALOONI",
    "BHARMOUR","PANGI"];

  var _hamirpurBlocks = ["BAMSON","BHORANJ","BIJHARI","HAMIRPUR",
    "NADAUN","SUJANPUR"];

  var _kangraBlocks = ["RAIT","PANCHRUKHI","DEHRA","FATEHPUR","INDORA",
    "NAGROTA BAGWAN","NURPUR","NAGROTA SURIAN","BAIJNATH","BHAWARNA",
    "KANGRA","LAMBAGAON","SULLAH","PRAGPUR","DHARAMSHALA"];

  var _kinnaurBlocks = ["NICHAR","POOH","KALPA"];

  var _kulluBlocks = ["ANNI","NAGGAR","NIRMAND"];

  var _lahulBlocks = ["LAHAUL","SPITI"];

  var _mandiBlocks = ["BALH","CHAUNTRA","DHARAMPUR","DRANG","GOHAR",
    "GOPALPUR","KARSOG","SADAR MANDI","SERAJ","SUNDERNAGAR"];

  var _shimlaBlocks = ["NARKANDA","THEOG","BASANTPUR","NANKHARI","CHHOHARA",
    "MASHOBRA","CHOPAL","JUBBAL & KOTHKAI","ROHRU","RAMPUR"];

  var _sirmourBlocks = ["NAHAN","PAONTA","PACHHAD","RAJGARH","SANGRAH","SHILLAI"];

  var _solanBlocks = ["DHARAMPUR","KANDAGHAT","KUNIHAR","NALAGARH","SOLAN"];

  var _unaBlocks = ["AMB","BANGANA","GAGRET","HAROLI","UNA"];

  var block = null;

  var _currentSelectedDistrict = null;

  var _deceasedSex = '';

  var _ageInDays = '';
  var _ageInMonths = '';
  var _ageInYears = '';

  @override
  void initState() {
    super.initState();

    _deceasedSex = _deceasedSexList[0];

    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);

//    _currentSelectedDistrict = _districtName[0];
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  //testing code


  TextEditingController childNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController ashaBlockController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController villageNameController = TextEditingController();
  TextEditingController phnNumberController = TextEditingController();
  TextEditingController ashaNameController = TextEditingController();

  /*Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/asha.txt');
  }
  Future<File> writeToFile(String json) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$json',mode: FileMode.append);
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('ASHA Form'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child:Column(
                  children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: childNameController,
                    validator: (String value) {
                      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                      if (!nameExp.hasMatch(value))
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: 'Name of the child',
                        hintText: 'Name of the child',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child:Row(children: <Widget>[Text('Deceased\'s age:',
                      style: TextStyle(fontSize: 18.0),)],)
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
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
                            onSaved: (String value) {_ageInYears = value;},
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
                            onSaved: (String value) {_ageInMonths = value;},
                          ),
                        ),
                      ), //Months
                      Expanded(
                        child: TextFormField(
                          validator: (String val) {
                            if (val.isEmpty || int.parse(val)>31) {
                              return 'Please enter a valid input';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Days",
                              hintText: "Days",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          keyboardType: TextInputType.number,
                          onSaved: (String value) {_ageInDays = value;},
                        ),
                      ), //Days

                    ],
                  ),
                ), //Age



                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Deceased\'s sex:', style: TextStyle(fontSize: 18.0),),
                    ],
                  )
                ),

                Padding(padding: EdgeInsets.all(10.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        'Male',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 'Male',
                        groupValue: _deceasedSex,
                        onChanged: (String newRadioSelected) {
                          _onSexRadioSelect(newRadioSelected);
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 'Female',
                        groupValue: _deceasedSex,
                        onChanged: (String newRadioSelected) {
                          _onSexRadioSelect(newRadioSelected);
                        },
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: fatherNameController,
                    validator: (String value) {
                      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                      if (!nameExp.hasMatch(value))
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: 'Name of the father',
                        hintText: 'Name of the father',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: phnNumberController,
                    keyboardType: TextInputType.numberWithOptions(),
                    validator: (String value) {
                      if (value.isEmpty || value.length != 10)
                        return 'Please enter a valid phone number';
                    },
                    decoration: InputDecoration(
                        labelText: 'Father\'s contact number',
                        hintText: 'Father\'s contact number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),

                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text('District:', style: TextStyle(fontSize: 18.0),),
                  ),


                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: DropdownButton<String>(
                        hint: Text('Select here'),
                        items: _districtName.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentSelectedDistrict,
                        onChanged: (String newSelectedValue) {
                          setState(() {
                            _onDropDownDistrictSelected(newSelectedValue);
                          });

                        },
                      )),
                ]),

                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Block:', style: TextStyle(fontSize: 18.0),),
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: blocksWidgetFun(),
                  ),
                ]),


                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: addressController,
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The address should contain more than two letters';
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: villageNameController,
                    validator: (String value) {
                      if (value.length < 3)
                        return 'The village name should contain more than two letters';
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Village name',
                        hintText: 'Village name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: ashaNameController,
                    validator: (String value) {
                      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                      if (!nameExp.hasMatch(value))
                        return 'Please enter only alphabetical values';
                    },
                    decoration: InputDecoration(
                        labelText: 'Asha Name',
                        hintText: 'Asha Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_currentSelectedDistrict == null ||
                          block == null) {
                        // The checkbox wasn't checked
                        showSnackBar('Please select the block & district to proceed');
                      }
                      if (_formKey.currentState.validate() && (
                          _currentSelectedDistrict != null &&
                              block != null)){
                        showWaiting();
                        Child newEntry  = new Child(
                          childNameController.text.toString(),
                          this._currentSelectedDistrict.toString(),
                          block.toString(),
                          addressController.text.toString(),
                          ashaNameController.text.toString(),
                        );
                        var data  = {
                          'name': newEntry.name,
                          'district' :  newEntry.district,
                          'block' : newEntry.block,
                          'address':  newEntry.address,
                          'ashaName':newEntry.ashaName,
                        };
                        var status  = await sendData('http://13.235.43.83/api/asha',data);
                        if(!isOffline && status){
                          Navigator.of(context).pop();  //for waiting dialog
                          Navigator.of(context).pop(null);
                        }
                        else{
                          Navigator.of(context).pop(newEntry);
                        }

                      }

                    },
                  ),
                )
              ]),
            ),
          )),
    );

  }


  void _onDropDownDistrictSelected(String newSelectedValue) {
    setState(() {
      this._currentSelectedDistrict = newSelectedValue;
      this.block = null;
    });
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



  Widget blocksDropDownFun(List<String> passedList){

    return DropdownButton<String>(
      hint: Text("Select here"),
      items: passedList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: block,
      onChanged: (String newSelectedValue) {
        setState(() {
          this.block = newSelectedValue;
        });
      },
    );
  }


  Widget blocksWidgetFun(){

    if(_currentSelectedDistrict == null){

      return
        DropdownButton<String>(
          disabledHint: Text('Select here'),
          items: null,
          onChanged: (String newValueSelected){
            setState(() {
              block = null;
            });
          },
        );
    }

    else {
      switch (_currentSelectedDistrict) {
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

  void _onSexRadioSelect(String newRadioSelected) {
    setState(() {
      this._deceasedSex = newRadioSelected;
    });
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

}