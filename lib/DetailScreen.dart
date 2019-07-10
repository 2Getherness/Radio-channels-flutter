import 'dart:math';

import 'package:flutter/material.dart';

import './jsonModel.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Programs program;

  // In the constructor, require a program.
  DetailScreen({Key key, @required this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the program to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(program.name),
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
                                program.programimage,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: new Text(
                                program.name,
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
                                child: new Text(program.description,
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
                          children: <Widget>[
                            Container(child: RaisedButton(onPressed: () {}, color: Colors.teal, child: Row(children: <Widget>[
                                Container(child: Icon(Icons.card_giftcard),),
                                Spacer(),
                                Container(child: Text('program.socialmediaplatforms[1]',),)
                              ],),),),
                              Container(child: RaisedButton(onPressed: () {}, color: Colors.teal, child: Row(children: <Widget>[
                                Container(child: Icon(Icons.card_giftcard),),
                                Spacer(),
                                Container(child: Text(program.name),)
                              ],),),),
                              Container(child: RaisedButton(onPressed: () {}, color: Colors.teal, child: Row(children: <Widget>[
                                Container(child: Icon(Icons.card_giftcard),),
                                Spacer(),
                                Container(child: Text('data',),)
                              ],),),),
                          ],
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
