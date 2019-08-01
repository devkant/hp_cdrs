import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';


class Applianm{
  String  appliNumber;
  String  name;
  String address;


  Applianm({this.appliNumber,this.name,this.address});

  factory Applianm.fromJson(Map<dynamic,dynamic> parsedJson){

    return  Applianm(
        appliNumber:  parsedJson['application'].toString(),
        name: parsedJson['name'],
        address: parsedJson['address'],
    );
  }
}

Future<List<Applianm>> loadAppli() async{
  final token = await getToken();
  var response = await http.get('http://13.235.43.83/api/anmPreviousForms',
      headers: {
        'authToken': token,
      }
  );

  print(response.body);
  print(response.statusCode);
  if(response.statusCode==200){
    final items = json.decode(response.body).cast<Map<String,dynamic>>();
    print(items);
    List  <Applianm> listOfAppli = items.map<Applianm>((json) {
      return Applianm.fromJson(json);
    }).toList();
    print(listOfAppli);
    return  listOfAppli;
  }
  else{
    throw Exception('Failed to load Internet');
  }
}

class PreviousForm extends StatefulWidget {
  @override
  PreviousFormState createState() => PreviousFormState();
}

class PreviousFormState extends State<PreviousForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Previous Filled Forms',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
      ),
      body: FutureBuilder<List<Applianm>>(
        future: loadAppli(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if(snapshot.data.isEmpty)
            return Center(
              child: Text(
                'No Forms Filled',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),

            );
          else {
            return ListView(
              children: snapshot.data
                  .map((user) =>
                  InkWell(
                      child: Card(
                          margin: new EdgeInsets.all(10.0),
                          elevation: 20.0,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10.0, 40.0, 40.0, 40.0),
                            child: Column(
                              children: <Widget>[
                                Text(user.appliNumber,style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                                Center(
                                  child: Text('Name: ${user.name}',style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                                ),
                                Center(
                                  child: Text('Address: ${user.address}',style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                      ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Show(user.appliNumber,'previousFbi'))
                      );
                    },


                  )).toList(),
            );
          }
        },
      ),
    );
  }
}


class Show extends StatefulWidget {
  final String  appliNumber;
  final String  url;
  Show(this.appliNumber,this.url);
  @override
  ShowState createState() => ShowState();
}

class ShowState extends State<Show> {
  Future<Map<String,dynamic>>  getData() async {
    final String Url  = 'http://13.235.43.83/api/'+widget.url+'/'+widget.appliNumber;
    final token = await getToken();
    var response = await http.get(Url,
        headers: {
          'authToken' : token,
          'applicationNumber': widget.appliNumber.toString()
        }
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      return map;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(child: CircularProgressIndicator(),);
            default:
              if  (!snapshot.hasData){
                return  Center(child:Text('No Data',style: TextStyle(fontSize: 20.0),));
              }
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot);
          }
        },
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
    Map values = snapshot.data;
    Map<String,dynamic> myMap = Map.from(snapshot.data ); // transform your snapshot data in map
    var keysList = myMap.keys.toList();
    return ListView.builder(
        itemCount: myMap.length, // getting map length you can use keyList.length too
        itemBuilder: (BuildContext context, int index) {
          return Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0,
            children: <Widget>[
              Text('  ${keysList[index]}: ${myMap[keysList[index]]}',
                style: TextStyle(fontSize: 18.0),)
            ],
          );
        }
    );
  }
}