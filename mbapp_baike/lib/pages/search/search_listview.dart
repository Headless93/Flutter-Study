import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mbapp/model/search_list_model.dart';
import 'package:mbapp/pages/baike/product_detail.dart';
import 'package:mbapp/pages/search/search_provider.dart';
import 'package:mbapp/res/color.dart';
import 'package:provider/provider.dart';

class SearchListView extends StatefulWidget {
  SearchListView({Key key}) : super(key: key);
  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
        builder: (BuildContext context, value, child) {
      print('lenvagth------------lue.searchList.length');
      return Container(
          color: MbColors.backGroundColor,
          child: EasyRefresh(
            bottomBouncing: true,
            child: ListView.builder(
              itemCount: value.searchList.length,
              itemBuilder: (BuildContext context, int index) {
                return createTile(value.searchList[index]);
              },
            ),
            // 加载更多
            onLoad: () async {
              // print('onLoad');
              await Provider.of<SearchProvider>(context, listen: false)
                  .searchListHttpGet(value.searchText, value.currentPage++);
            },
            // onRefresh: () async {
            //   print('onRefresh');
            // },
          ));
    });
  }

  Widget createTile(CompoundsModel com) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(molId: com.id)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: Colors.white,
        // height: ScreenUtil().setHeight(144),
        child: Row(
          children: [
            //图片
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: MbColors.color_f4f4f4,
                  width: 1,
                ),
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: 55,
              height: 55,
              // padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              // color: Colors.red,
              child: Image.network(
                com.struct_image,
                height: ScreenUtil().setHeight(60),
                width: ScreenUtil().setWidth(60),
                fit: BoxFit.cover,
              ),
            ),
            //右边文本
            Container(
              // alignment: Alignment.centerLeft,
              // color: Colors.blue,
              padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //名称
                  Container(
                    width: ScreenUtil().setWidth(255),
                    // color: Colors.pink,
                    child: Text(
                      com.cn_name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //介绍
                  // Container(
                  //   margin: EdgeInsets.only(top: 5),
                  //   height: ScreenUtil().setHeight(20),
                  //   // color: Colors.pink,
                  //   child: Text(
                  //     com.cnNameAlias,
                  //     style: TextStyle(
                  //       fontSize: 14.0,
                  //       color: MbColors.subBlack,
                  //     ),
                  //   ),
                  // ),
                  //分子式
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    height: ScreenUtil().setHeight(20),
                    // color: Colors.pink,
                    child: Text(
                      'CAS：${com.cas}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MbColors.subBlack,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: ScreenUtil().setHeight(20),
                    // color: Colors.pink,
                    child: Text(
                      '分子式：${com.formula}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MbColors.subBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        ///
      ),
    );
  }
}
