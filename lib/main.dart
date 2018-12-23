import 'package:flutter/material.dart';
import 'package:test_flutter/home_screen.dart';
import 'package:test_flutter/table_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/TableScreen': (BuildContext context) => new TableScreen()
      },
    );
  }
}
