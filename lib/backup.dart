import 'dart:math';

import 'package:flutter/material.dart';

import './jsonModel.dart';

class DetailScreen extends StatefulWidget {
  // Declare a field that holds the Todo.
  final Programs program;
  // In the constructor, require a program.
  DetailScreen({Key key, @required this.program}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailScreenState();
  }
}
class _DetailScreenState extends State<DetailScreen> {
  Programs _platfroms = null;
  @override
  void initState() {
    // TODO: implement initState
    _platfroms = widget.program;
    super.initState();
  }

  // void _addProduct(String product) {
  //   setState(() {
  //     _platfroms.add(product);
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    // Use the program to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(_platfroms.name),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Text(program.description),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: new Image.network(
                                _platfroms.programimage,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: new Text(
                                _platfroms.name,
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 50.0),
                        width: max(0.0, 400),
                        child: Text(
                          "More Detail",
                          style: TextStyle(
                              fontFamily: 'Oxygen',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: new Text(_platfroms.description,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Center(
                        
                        child: Column(
                          children: _platfroms.socialmediaplatforms.map((element) => Card(
                            child: new ListView(
                              children: <Widget>[
                                
                                Text(element.platform)
                              ],
                            )
                          )).toList(),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

sortSocialMedia (String platform) {
    switch (platform) {
    case 'Facebook':
      return platform;
      break;
    case 'Twitter':
      return platform;
      break;
    case 'Instagram':
      return platform;
      break;
    default:
  }
}