import 'package:flutter/material.dart';
import 'package:mbapp/pages/search/search_list.dart';
import 'package:mbapp/pages/search/search_provider.dart';
import 'package:mbapp/res/color.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TextFeldWidget extends StatefulWidget {
  TextFeldWidget({Key key}) : super(key: key);

  @override
  _TextFeldWidgetState createState() => _TextFeldWidgetState();
}

class _TextFeldWidgetState extends State<TextFeldWidget> {
  TextEditingController curr = TextEditingController();

  @override
  void initState() {
    curr.text = Provider.of<SearchProvider>(context, listen: false).searchText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 38,
      decoration: new BoxDecoration(
        // color: Colors.yellow,
        // border: Border.all(color: Colors.grey, width: 1.0), //灰色的一层边框
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: TextField(
        controller: curr,
        onSubmitted: (text) {
          //内容提交(按回车)的回调
          Provider.of<SearchProvider>(context, listen: false)
              .searchListHttpGet(curr.text, 1);
        },
        keyboardType: TextInputType.text,
        // cursorHeight: 10,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            filled: true,
            fillColor: MbColors.backGroundColor,
            border: InputBorder.none,
            hintText: '请输入CAS号',
            hintStyle: TextStyle(fontSize: 14, color: MbColors.titleBlack),
            isDense: false),
        style: new TextStyle(fontSize: 14, color: MbColors.titleBlack),
        // cursorColor: Colors.black, //设置光标
        // cursorWidth: 2,
        // cursorRadius: Radius.elliptical(2, 8),
      ),
    );
  }
}
