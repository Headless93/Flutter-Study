import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String prefix = '当前时间';
  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  String currentTimeStr;
  @override
  void initState(){
    super.initState();
    // this.currentTimeStr = getCurrentTime();
    refreshTimeStr();
  }

  void refreshTimeStr(){
    const period = Duration(milliseconds: 500);
    Timer.periodic(period, (timer) {
      setState(() {
        this.currentTimeStr = getCurrentTime();
      });
    });
  }

  String getCurrentTime(){
    DateTime now = DateTime.now();
    var formatter = DateFormat('yy-mm-dd H:m:s');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(widget.prefix),Text(this.currentTimeStr)],
    );

  }
}
