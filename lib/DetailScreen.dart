import 'dart:math';

import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";
import "package:flutter/services.dart";

import './jsonModel.dart';

class CallsAndMessagesService {
  // void call(String number) => launch("tel:$number");
  // void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launch("mailto:$email");
}

class DetailScreen extends StatelessWidget {
  final Programs program;
  DetailScreen({Key key, @required this.program}) : super(key: key);

  void sendEmail(String email) => launch("mailto:$email");

  final buttonsColor = Colors.black12;
  final buttonFontsColor = TextStyle(color: Colors.black);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Use the program to create the UI.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(program.name),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Text(program.description),
      // ),
      body: Center(
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Image.network(
                            program.programimage,
                            height: 400,
                          ),
                          Center(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              program.responsibleeditor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  sendEmail(program.email);
                                },
                                color: Colors.black,
                                child: new Text(
                                  // Email
                                  "Mejla",
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      fontFamily: 'RobotoMono',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 10.0),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              new Text(
                                // Program name label
                                'Pragram namn: ',
                                style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              new Text(
                                // Name
                                program.name,
                                style: TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          )),

                      SizedBox(height: 5.0),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Mer Detalj",
                                style: TextStyle(
                                    fontFamily: 'Oxygen',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          height: 60,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Text(program.description,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              )
                            ],
                            // ),
                          )),
                      SizedBox(height: 30.0),

                      // Buttons Container
                      Container(
                        child: Row(
                          children: <Widget>[
                            new Center(
                              child: Container(
                                width: 300,
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: program.socialmediaplatforms
                                      .map((value) => FlatButton(
                                          // padding: EdgeInsets.all(0),
                                          // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          onPressed: () {
                                            launchURL(value.platformurl);
                                          },
                                          // color: buttonsColor,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 40,
                                                child: getIcon(value.platform),
                                              ),
                                              // Spacer(),
                                              // Container(
                                              //   child: Text(
                                              //     value.platform,
                                              //     style: buttonFontsColor,
                                              //   ),
                                              // )
                                            ],
                                          )))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        // ),
      ),
    );
  }
}

launchURL(String url) async {
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw Exception("Could not launch $url");
  }
}

getIcon(String platform) {
  print(platform);
  switch (platform) {
    case 'Facebook':
      return Image.asset("assets/Icons/facebook.png",
          width: 30, color: Colors.blue);
    case 'Twitter':
      return Image.asset(
        "assets/Icons/twitter.png",
        width: 30,
        color: Colors.blue,
      );
    case 'Instagram':
      return Image.asset(
        "assets/Icons/instagram.png",
        width: 30,
        color: Colors.purple,
      );
      break;
    default:
  }
}
