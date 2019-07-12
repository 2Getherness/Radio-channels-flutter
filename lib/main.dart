import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import './jsonModel.dart';
import './DetailScreen.dart';
import './ListViewWriter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  ScrollController _scrollController = new ScrollController();
  List data = [];
  List<Programs> data1;
  var pageNumber = 1;

  Future fetchPost() async {
    final response = await http.get(
        'http://api.sr.se/api/v2/programs?format=json&size=20&page=' +
            '$pageNumber');

    if (response.statusCode == 200) {
      print("Succeed");
      // If the call to the server was successful, parse the JSON.
      var parsedJSON = new ParentClass.fromJson(json.decode(response.body));
      print('parsedJSON::: $parsedJSON');

      for (var i = 0; i < parsedJSON.programs.length; i++) {
        // print(parsedJSON.programs[i].name);
      }

      data1 = parsedJSON.programs;
      setState(() {
        for (var item in data1) {
          data.add(item);
        }
      });
      return parsedJSON.programs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
          fetchPost();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print(
            'ScrollController.postion.pixels: $_scrollController.position.pixels');
        print('Page number is : $pageNumber');
        pageNumber = pageNumber + 1;
        fetchPost();
        print('Page number is : $pageNumber');
      }
    });
  }

  // void _populateList(List program) {
  //   setState(() {
  //     data.add(program);
  //   });
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getMoreData() {
    fetchPost();
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
          controller: _scrollController, 
          scrollDirection: Axis.vertical,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () => print(
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(program: data[index]),
                      ),
                    ),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  elevation: 60.0,
                  child: new Container(
                      child: Row(
                    children: <Widget>[
                      // ListViewWriter(data)
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
