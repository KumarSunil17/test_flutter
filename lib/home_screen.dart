import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 0),
            () {
            Navigator.of(context).pushReplacementNamed('/TableScreen');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  InkWell(
        onTap: (){

        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Expanded(
                  flex: 2,
                  child:  Container(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Image.asset('image.jpg',width: 200.0,height: 200.0,),
                           Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text('welcome')
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircularProgressIndicator(
                        valueColor:  AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Text('Loading..'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}