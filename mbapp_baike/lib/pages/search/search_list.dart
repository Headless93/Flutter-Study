import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mbapp/pages/search/search_provider.dart';
import 'package:mbapp/res/index.dart';
import 'package:provider/provider.dart';
import 'search_textfeld.dart';
import 'search_listview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.white,
          titleSpacing: 15,
          automaticallyImplyLeading: false, //隐藏返回箭头
          title: TextFeldWidget(),
          actions: <Widget>[
            InkWell(
              child: Container(
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    "取消",
                    style: TextStyle(
                      color: MbColors.btnBlueColor,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: FutureBuilder(
            future: _getDatasInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SearchListView();
              } else {
                return Center(
                  child: SpinKitFadingCircle(color: Colors.grey, size: 50.0),
                );
              }
            }));
  }

  // 获取首页接口homePageContent
  Future _getDatasInfo(BuildContext context) async {
    await Provider.of<SearchProvider>(context, listen: false).searchListHttpGet(
        Provider.of<SearchProvider>(context, listen: false).searchText, 1);
    return '1234';
  }
}
