import 'package:baike_flutter/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:baike_flutter/Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('lalala'),
        ),
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}


