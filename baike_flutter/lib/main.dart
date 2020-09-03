// import 'package:baike_flutter/Pages/my_appBar.dart';
import 'package:flutter/material.dart';
// import 'Pages/tutorial_home.dart';
import 'package:english_words/english_words.dart';
import 'Pages/random_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'sssss',
      home: new RandomWords(),
    );
  }
}