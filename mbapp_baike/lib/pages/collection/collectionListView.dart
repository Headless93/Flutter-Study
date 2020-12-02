import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/model/collection_list_model.dart';
import 'package:mbapp/pages/baike/product_detail.dart';
import 'package:mbapp/pages/collection/collection_provider.dart';
import 'package:mbapp/res/color.dart';
import 'package:provider/provider.dart';

class CollectionListView extends StatefulWidget {
  CollectionListView({Key key}) : super(key: key);
  @override
  _CollectionListViewState createState() => _CollectionListViewState();
}

class _CollectionListViewState extends State<CollectionListView> {
  void clickItem(BuildContext context, int index, List ddd) {
    print('object');

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('是否取消收藏?'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  ddd.removeAt(index);
                  //这个和Android的SnackBar差不多
                  Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("${ddd[index]} dismissed")));

                  Fluttertoast.showToast(
                    msg: "取消收藏成功",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER, // 消息框弹出的位置
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionProvider>(
        builder: (BuildContext context, value, child) {
      print('length---------${value.collectionList.length}');
      return Container(
          color: MbColors.backGroundColor,
          child: EasyRefresh(
            bottomBouncing: true,
            child: ListView.builder(
              itemCount: value.collectionList.length,
              itemBuilder: (BuildContext context, int index) {
                List ddd = List.generate(value.collectionList.length,
                    (index) => "Item ${index + 1}");

                //通过拖动来删除小部件的widget
                return new Dismissible(
                    //如果Dismissible是一个列表项 它必须有一个key 用来区别其他项
                    key: new Key(ddd[index]),
                    //在child被取消时调用
                    onDismissed: (direction) {
                      clickItem(context, index, ddd);
                    },
                    //如果指定了background 他将会堆叠在Dismissible child后面 并在child移除时暴露
                    background: new Container(
                      color: Colors.red,
                    ),
                    child: createTile(value.collectionList[index]));
              },
            ),
            // 加载更多
            onLoad: () async {
              // print('onLoad');
              await Provider.of<CollectionProvider>(context, listen: false)
                  .getCollectionList(value.currentPage++);
            },
          ));
    });
  }

  Widget createTile(BaikeModel com) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(molId: com.mol_id)));
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
                com.img,
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
                    width: ScreenUtil().setWidth(265),
                    // color: Colors.pink,
                    child: Text(
                      com.name_zh,
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
                      'CAS：${com.cas_no}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MbColors.subBlack,
                      ),
                    ),
                  ),
                  Container(
                    // width: 300,
                    width: ScreenUtil().setWidth(255),

                    // margin: EdgeInsets.only(top: 5),
                    height: ScreenUtil().setHeight(20),
                    // color: Colors.pink,
                    child: Text(
                      '英文名：${com.name_en}',
                      overflow: TextOverflow.ellipsis,
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
