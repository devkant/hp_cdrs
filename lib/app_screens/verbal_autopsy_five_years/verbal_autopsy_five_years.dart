import 'package:flutter/material.dart';
import 'verbal_autopsy_five_years_sec1.dart';
import 'user.dart';

void main() => runApp(MyApp());


//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 1',
//    home: verbalAutopsy5YrForm(),
//  ));
//}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final userObj = User();
    return MaterialApp(
      home: verbalAutopsy5YrForm(),
    );
  }
}

class verbalAutopsy5YrForm extends StatefulWidget {
  final User userObj;
  final String appliNumber;
  verbalAutopsy5YrForm({Key key, @required this.userObj, this.appliNumber}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return verbalAutopsy5YrFormState();
  }
}

class verbalAutopsy5YrFormState extends State<verbalAutopsy5YrForm> {
  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _firstHYS = false;
  bool _secondHYS = false;

  String rhcController;
  String yearController;

//  @override
//  void initState() {
//    super.initState();
////    _currentItemSelected = _districtName[0];
//  }


  var _districtName = ['BILASPUR', 'CHAMBA', 'HAMIRPUR', 'KANGRA', 'KINNAUR',
    'KULLU', 'LAHUL AND SPITI', 'MANDI', 'SHIMLA', 'SIRMOUR', 'SOLAN', 'UNA'];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Verbal Autopsy Form'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Form No.2 Post Neo-Natal'
                              "\n"
                              'Deaths (29 Days to 5 years)',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        initialValue: widget.appliNumber,
                        keyboardType: TextInputType.numberWithOptions(),
                        onSaved: (value){widget.userObj.applicationNumber = value;},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Application number',
                            hintText: 'Application number',
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
                            value: widget.userObj.district,
                            onChanged: (String newSelectedValue) {
                              setState(() {
                                _onDropDownDistrictSelect(newSelectedValue);
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
                        onSaved: (value){widget.userObj.village = value;},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Village',
                            hintText: 'Village',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){widget.userObj.phc = value;},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'PHC',
                            hintText: 'PHC',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){widget.userObj.subCenter = value;},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Sub-Center',
                            hintText: 'Sub-Center',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        onSaved: (value){rhcController = value;
                        widget.userObj.rhc = num.parse(rhcController);},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'RHC Number of Mother/Baby',
                            hintText: 'RHC Number of Mother/Baby',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){yearController = value;
                        widget.userObj.year = num.parse(yearController);},
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (String value) {
                          if (value.length!=4) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Year',
                            hintText: 'Year',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        onSaved: (value){widget.userObj.head = value;},
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Name of head of household',
                            hintText: 'Name of head of household',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){widget.userObj.name = value;},
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Full name of deceased',
                            hintText: 'Full name of deceased',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        onSaved: (value){widget.userObj.mother = value;},
                        validator: (String value) {
                          final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (!nameExp.hasMatch(value))
                            return 'Please enter only alphabetical values';
                        },
                        decoration: InputDecoration(
                            labelText: 'Full name of mother of deceased',
                            hintText: 'Full name of mother of deceased',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),


                    CheckboxListTile(
                        value: _firstHYS,
                        title: Text('1st HYS:'),
                        onChanged: (bool value) {
                          setState(() {
                            _firstHYS = value;
                            if(_firstHYS == true)
                              widget.userObj.firstHys = '1st HYS';
                          });
                        }),
                    CheckboxListTile(
                        value: _secondHYS,
                        title: Text('2nd HYS:'),
                        onChanged: (bool value) {
                          setState(() {
                            _secondHYS = value;
                            if(_secondHYS == true)
                              widget.userObj.secondHys = '2nd HYS';
                          });
                        }),

                    //for testing purpose
//                    Text('${widget.userObj.village}'),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.blue,
                        child: Text(
                          "Proceed to Section 1",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          if (widget.userObj.district == null ||
                              widget.userObj.block == null) {
                            // The checkbox wasn't checked
                            showSnackBar('Please select the block & district to proceed');
                          }
                          if (_formKey.currentState.validate() && (
                              widget.userObj.district != null &&
                                  widget.userObj.block != null)) {
                            final FormState form = _formKey.currentState;
                            form.save();
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      verbalAutopsy5YrSec1(
                                        userObj: widget.userObj,)));
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }


  void _onDropDownDistrictSelect(String newSelectedValue) {
    setState(() {
      this.widget.userObj.district = newSelectedValue;
      this.widget.userObj.block = null;
    });
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
      value: widget.userObj.block,
      onChanged: (String newSelectedValue) {
        setState(() {
          this.widget.userObj.block = newSelectedValue;
        });
      },
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



  Widget blocksWidgetFun(){

    if(widget.userObj.district == null){

      return
        DropdownButton<String>(
          disabledHint: Text('Select here'),
          items: null,
          onChanged: (String newValueSelected){
            setState(() {
              widget.userObj.block = null;
            });
          },
        );
    }

    else {
      switch (widget.userObj.district) {
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

        case 'LAHUL AND SPITI':
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
}
