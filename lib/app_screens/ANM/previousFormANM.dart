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
  String  address;

  Appli({this.appliNumber,this.name,this.address});

  factory Appli.fromJson(Map<String,dynamic> parsedJson){
    return  Appli(
        appliNumber:  parsedJson['appliNumber'],
        name: parsedJson['name'],
        address:  parsedJson['address']

    );
  }
}

Future<List<Appli>> loadAppli() async{
  final token = await getToken();
  var response = await http.get('http://13.235.43.83/api/anmPreviousForms',
      headers: {
        'authToken': token,
      }
  );
  print(response.statusCode);
  if(response.statusCode==200){
    final json  = jsonDecode(response.body);
    print(json);
    final items = json.decode(json['docs']).cast<Map<String,dynamic>>();
    List  <Appli> listOfAppli = items.map<Appli>((json) {
      return Appli.fromJson(json);
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
      body: FutureBuilder<List<Appli>>(
        future: loadAppli(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) =>
                ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.appliNumber),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(user.name[0],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )),
                  ),
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Show(user.appliNumber)));},
                )).toList(),
          );
        },
      ),
    );
  }
}


class Show extends StatefulWidget {
  String  appliNumber;
  Show(this.appliNumber);
  @override
  ShowState createState() => ShowState();
}

class ShowState extends State<Show> {
  final String url  = 'http://13.235.43.83/api/test';

  Future<List<dynamic>>  getData() async {
    final token = await getToken();
    var response = await http.get(url,
        headers: {
          'authToken' : token,
          'applicationNumber': widget.appliNumber
        }
    );

    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      final list = map.values.toList(growable: true);

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
