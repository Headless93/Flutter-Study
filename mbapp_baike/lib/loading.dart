import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/screenutil.dart';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage>{
  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds:3),(){
        Navigator.of(context).pushReplacementNamed('app');
    });
  }
  @override
  Widget build(BuildContext context){
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: false);

    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/loading.jpeg'),
            Center(
              child: Text('摩贝百科',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}