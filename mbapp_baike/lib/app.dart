import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/http/HeaderInterceptor.dart';
import 'package:mbapp/http/LogInterceptor.dart';

class App extends StatefulWidget{
  @override
  AppState createState() => AppState();
}

class AppState extends State<App>{
  // var _currentIndex = 0;
  HomePage homePage;

  @override
  void initState(){
    //初始化 Http，
    HttpManager().init(
      baseUrl: Api.getBaseUrl(),
      interceptors: [
        HeaderInterceptor(),
        LogInterceptor(),
      ],
    );
    if(homePage == null){
      homePage = HomePage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: false);

    return Scaffold(

      body: homePage,
    );
  }
}