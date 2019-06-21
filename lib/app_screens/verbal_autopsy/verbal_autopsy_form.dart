import 'package:flutter/material.dart';
import 'verbal_autopsy_sec1.dart';
import 'user.dart';


//void main() {
//  runApp(MaterialApp(
//    title: 'Verbal Autopsy Form Section 1',
//    home: verbalAutopsyForm(),
//  ));
//}


class verbalAutopsyForm extends StatefulWidget {

  final user verbal_Autopsy_Obj;
  final String appliNumber;
  verbalAutopsyForm({Key key, @required this.verbal_Autopsy_Obj,this.appliNumber}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _verbalAutopsyFormState();
  }
}

class _verbalAutopsyFormState extends State<verbalAutopsyForm> {

  var _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//  var _currentSelectedDistrict = '';

  @override
  void initState() {
    super.initState();
//    widget.verbal_Autopsy_Obj.district = _districtName[0];
//    widget.verbal_Autopsy_Obj.block = _bilaspurBlocks[0];
  }

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


//  String blockController = '';
//  String villageController = '';
//  String phcController = '';
//  String subCenterController = '';
  String rhcController = '';
  String yearController = '';
//  String headController = '';
//  String nameController = '';
//  String nameMotherDeceasedController = '';

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
                          'Form No.1 Neonatal Deaths'
                              "\n"
                              '(28 Days or less of age)',
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.applicationNumber = value;},
                        validator: (String value) {
                          if (value.isEmpty) return 'Please fill a valid input';
                        },
                        decoration: InputDecoration(
                            labelText: 'Application Number',
                            hintText: 'Application Number',
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
                            value: widget.verbal_Autopsy_Obj.district,
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.village = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.phc = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.subCenter = value;},
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
                        widget.verbal_Autopsy_Obj.rhc = num.parse(rhcController);},
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
                        widget.verbal_Autopsy_Obj.year = num.parse(yearController);},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.head = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.name = value;},
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
                        onSaved: (value){widget.verbal_Autopsy_Obj.mother = value;},
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

                    //for testing purpose
//                    Text('${widget.verbal_Autopsy_Obj.block}'),

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
                          if (widget.verbal_Autopsy_Obj.district == null ||
                              widget.verbal_Autopsy_Obj.block == null) {
                            // The checkbox wasn't checked
                            showSnackBar('Please select the block & district to proceed');
                          }
                          if (_formKey.currentState.validate() && (
                              widget.verbal_Autopsy_Obj.district != null &&
                                  widget.verbal_Autopsy_Obj.block != null)) {
                            final FormState form = _formKey.currentState;
                            form.save();
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      verbalAutopsySec1(
                                        verbal_Autopsy_Obj: widget.verbal_Autopsy_Obj,)));
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


  void _onDropDownDistrictSelected(String newSelectedValue) {
    setState(() {
      this.widget.verbal_Autopsy_Obj.district = newSelectedValue;
      this.widget.verbal_Autopsy_Obj.block = null;
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
      value: widget.verbal_Autopsy_Obj.block,
      onChanged: (String newSelectedValue) {
        setState(() {
          this.widget.verbal_Autopsy_Obj.block = newSelectedValue;
        });
      },
      //      isExpanded: true,
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

    if(widget.verbal_Autopsy_Obj.district == null){

      return
        DropdownButton<String>(
          disabledHint: Text('Select here'),
          items: null,
          onChanged: (String newValueSelected){
            setState(() {
              widget.verbal_Autopsy_Obj.block = null;
            });
          },
        );
    }

    else {
      switch (widget.verbal_Autopsy_Obj.district) {
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
