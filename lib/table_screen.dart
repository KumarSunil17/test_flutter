import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
        elevation: 5.0,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
              child: Row(
                children: <Widget>[
                Container(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width*0.2,
                  child: TextField(
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                ),
                GestureDetector(
                    child: Icon(Icons.search,size: 40.0,)
                ),
                ]
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Row(
                      children: <Widget>[
                        _tableContent('',Colors.lightBlueAccent, Colors.black),
                        _tableContent('1',Colors.lightBlueAccent, Colors.black),
                        _tableContent('2',Colors.lightBlueAccent, Colors.black),
                        _tableContent('3',Colors.lightBlueAccent, Colors.black),
                        _tableContent('4',Colors.lightBlueAccent, Colors.black),
                        _tableContent('5',Colors.lightBlueAccent, Colors.black),
                        _tableContent('6',Colors.lightBlueAccent, Colors.black),
                        _tableContent('7',Colors.lightBlueAccent, Colors.black),
                        _tableContent('8',Colors.lightBlueAccent, Colors.black),
                        _tableContent('9',Colors.lightBlueAccent, Colors.black),
                        _tableContent('10',Colors.lightBlueAccent, Colors.black),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  _tableContent(String text,Color background, Color foreground) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent[100],
        border: Border.all(width: 2.0),
      ),
      height: 35.0,
      width: 35.0,
      child: Center(
        child: Text(text,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

}