import 'package:flutter/material.dart';
import 'pages/page_intro.dart';
import 'pages/page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home':(context) => MyHomePage(),
      },
      title: 'Flutter Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: page_intro(),
    );
  }
}
