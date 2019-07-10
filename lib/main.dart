import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './jsonModel.dart';
import './DetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  List data;
  final pageNumber = 1;

  Future fetchPost() async {
    final response =
        await http.get('http://api.sr.se/api/v2/programs?format=json&size=20');

    if (response.statusCode == 200) {
      print("Succeed");
      // If the call to the server was successful, parse the JSON.
      var parsedJSON = new ParentClass.fromJson(json.decode(response.body));
      print('parsedJSON::: ${parsedJSON.copyright}');

      for (var i = 0; i < parsedJSON.programs.length; i++) {
        print(parsedJSON.programs[i].name);
      }
      setState(() {
        data = parsedJSON.programs;
      });
      return parsedJSON;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Radop Channels'),
        ),
        body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () => print(
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(program: data[index]),
                ),
              ),),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  elevation: 60.0,
                  child: new Container(
                      child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: Container(
                                      child: Image.network(
                                        data[index].programimage,
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          data[index].name,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
