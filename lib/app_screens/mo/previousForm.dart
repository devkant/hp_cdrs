import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: PreviousForm(),
    );
  }
}

class Appli{
  String  appliNumber;
  String  name;
  String  neoFilled;
  String  postNeoFilled;
  String  socialFilled;

  Appli({this.appliNumber,this.name,this.neoFilled,this.postNeoFilled,this.socialFilled});

  factory Appli.fromJson(Map<String,dynamic> parsedJson){
    return  Appli(
      appliNumber:  parsedJson['application'],
      name: parsedJson['name'],
      neoFilled:  parsedJson['neonate'],
      postNeoFilled:  parsedJson['postNeonate'],
      socialFilled: parsedJson['social']

    );
  }
}

Future<List<Appli>> loadAppli() async{
  final token = await getToken();
  var response = await http.get('http://13.235.43.83/api/moPreviousForms',
      headers: {
        'authToken': token,
      }
  );
  print(response.statusCode);
  print(response.body);
  if(response.statusCode==200){
    final items = json.decode(response.body).cast<Map<String,dynamic>>();
    List  <Appli> listOfAppli = items.map<Appli>((json) {
      return Appli.fromJson(json);
    }).toList();
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
      body: FutureBuilder<List<Appli>>(
        future: loadAppli(),
        builder: (context, snapshot) {
          print(snapshot);
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
                        child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0, 40.0, 40.0, 40.0),
                            child: Column(
                              children: <Widget>[
                                Text(user.appliNumber,style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                                Text('Name: ${user.name}',style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Wrap(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Text('Neonate: ${user.neoFilled}',
                                        style: TextStyle(fontSize: 18.0,decoration: TextDecoration.underline),

                                      ),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Show(user.appliNumber,'previous'))
                                        );
                                      },

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Text('Postneonate: ${user.postNeoFilled}',
                                        style: TextStyle(fontSize: 18.0,decoration: TextDecoration.underline),

                                      ),
                                      onTap: (){},

                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Text('Social: ${user.socialFilled}',
                                        style: TextStyle(fontSize: 18.0,decoration: TextDecoration.underline),

                                      ),
                                      onTap: (){},

                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      )
                    )

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

  Future<List<dynamic>>  getData() async {
    final String Url  = 'http://13.235.43.83/api/'+widget.url;
    final token = await getToken();
    var response = await http.get(Url,
        headers: {
          'authToken' : token,
          'applicationNumber': widget.appliNumber
        }
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      final list = map.values.toList(growable: true);
      print(list);
      return list;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Text('loading...');
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return createListView(context, snapshot);
          }
        },
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<dynamic> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
            ),
            new Divider(height: 2.0,),
          ],
        );
      },
    );
  }
}