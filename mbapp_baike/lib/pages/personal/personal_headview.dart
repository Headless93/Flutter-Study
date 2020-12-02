import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalHead extends StatelessWidget {
  PersonalHead({Key key}) : super(key: key);

  String mobile2 = '123';

  void getUserMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
    if (prefs.getString('mobile') != null) {
      mobile2 = prefs.getString('mobile');
    } else {
      mobile2 = '未知用户';
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserMobile();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_button.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.red,
      ),
      height: 100,
      child: Row(
        children: [
          SizedBox(width: 15.0),
          ClipOval(
            child: Image.asset(
              'assets/images/home/icon_default.png',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Text(
                  mobile2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(width: 10.0),
                // Text(
                // '开发',
                // style: TextStyle(color: Colors.white, fontSize: 14.0),
                // ),
              ]),
              // Container(
              //   width: 100,
              //   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              //   // decoration: BoxDecoration(
              //   //   color: Colors.red,
              //   // ),
              //   child: Text(
              //     '摩贝',
              //     textAlign: TextAlign.left,
              //     style: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14.0,
              //     ),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}

// Image.asset('assets/images/baike/icon_home.png')
