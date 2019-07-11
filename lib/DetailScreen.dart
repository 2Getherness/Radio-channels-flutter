import 'dart:math';

import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

import './jsonModel.dart';

class DetailScreen extends StatelessWidget {
  final Programs program;
  DetailScreen({Key key, @required this.program}) : super(key: key);


  final buttonsColor = Colors.white;
  final buttonFontsColor = TextStyle(color: Colors.black);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  // padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                  margin: EdgeInsets.only(left: 50.0, top: 50.0),
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
                                margin: EdgeInsets.only(left: 12.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: new Text(
                  // Name
                                  program.name,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),
                                ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      child: new Text(
                  // Email
                                  program.email,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal),
                                ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 50.0),
                        margin: EdgeInsets.only(left: 50.0),
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
                         margin: EdgeInsets.only(left: 50.0),
                         height: 100,
                            // color: Colors.black12,
                            child: 
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 70.0),
                              child: Column(
                                  children: <Widget>[
                                    Expanded(flex: 8,
                                    child: Center(
                                        child: new Text(program.description,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),)
                                  ],
                              ),
                            )
                       ),
                        SizedBox(height: 50.0),
      // Buttons Container
                        Container(
                          width: 300,
                          child: Row(
                            children: <Widget>[
                              new Center(
                                child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 60.0),
                              height: 200, width: 170,child: ListView(
                              children: program.socialmediaplatforms.map((value) => 
                                    new RaisedButton(
                                      onPressed: (){launchURL(value.platformurl);},
                                      color: buttonsColor,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: getIcon(value.platform),
                                          ),
                                          Spacer(),
                                          Container(
                                            child: Text(
                                              value.platform,
                                              style: buttonFontsColor,
                                            ),
                                          )
                                        ],
                                      ))
                              ).toList(),
                              ),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
launchURL(String url) async {print(url);
  if(await canLaunch(url)) {
    await launch(url);
  } else {
    throw Exception("Could not launch $url");
  }
}
getIcon(String platform) {
    print(platform);
  switch (platform) {
    case 'Facebook':
      return Image.asset("assets/Icons/facebook.png", width: 30, color: Colors.blue);
    case 'Twitter':
      return Image.asset("assets/Icons/twitter.png", width: 30, color: Colors.blue,);
    case 'Instagram':
      return Image.asset("assets/Icons/instagram.png", width: 30, color: Colors.purple,);
      break;
    default:
  }
}
