import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mbapp/pages/collection/collection_provider.dart';
import 'package:mbapp/pages/search/search_provider.dart';
import 'package:provider/provider.dart';
import 'loading.dart';
import 'app.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'pages/Login/login.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => CollectionProvider()),
        // tabbar切换页面
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter实战',
        theme: mDefaultTheme,
        routes: <String, WidgetBuilder>{
          "app": (BuildContext context) => App(),
          "company_info": (BuildContext context) => WebviewScaffold(
                url: "https://www.baidu.com",
                appBar: AppBar(
                  title: Text('公司介绍'),
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("app");
                    },
                  ),
                ),
              ),
        },
        home: LoadingPage(),
        // home: SearchList(),
        //home: LoginState(),
      )));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.blueAccent,
);
