import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/pages/collection/collection_list.dart';
import 'package:mbapp/pages/personal/personal_headview.dart';
import 'package:mbapp/pages/personal/personal_report.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalListViewItem extends StatefulWidget {
  int dataIndex;
  PersonalListViewItem({this.dataIndex}) : super();

  @override
  _PersonalListViewItemState createState() => _PersonalListViewItemState();
}

class _PersonalListViewItemState extends State<PersonalListViewItem> {
  List iconArr = [
    'assets/images/personal/mine_mark_icon.png',
    'assets/images/personal/mine_opinion_icon.png',
    'assets/images/personal/mine_service_icon.png',
    'assets/images/personal/mine_clean_cache_icon.png',
  ];

  List titleList = ['我的书签', '意见反馈', '联系客服', '清除缓存'];

  @override
  Widget build(BuildContext context) {
    if (widget.dataIndex == 0) {
      // return ListTile(
      //   title: Text('data0000'),
      // );
      return PersonalHead();
    } else {
      return ListTile(
        leading: Image.asset(
          iconArr[widget.dataIndex - 1],
          width: 35.0,
          height: 35.0,
        ),
        title: Text(titleList[widget.dataIndex - 1]),
        onTap: () {
          clickItem(context, widget.dataIndex - 1);
        },
      );
    }
  }

  void clickItem(BuildContext context, int index) {
    print('object');

    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CollectionList()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Report()));
    } else if (index == 2) {
      _launchURL();
    } else if (index == 3) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('提示'),
              content: Text('是否清除缓存?'),
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
                    Fluttertoast.showToast(
                      msg: "清除缓存成功",
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
  }

  _launchURL() async {
    const url = 'tel:55010999';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
