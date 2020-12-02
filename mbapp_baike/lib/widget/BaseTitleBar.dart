import 'package:flutter/material.dart';
import 'package:mbapp/res/color.dart';

class BaseTitleBar extends StatelessWidget {
  String title;
  IconData leftIcon = Icons.arrow_back_ios;
  String rightText;
  final VoidCallback rightClick;
  String rightIcon1;
  final VoidCallback rightIcon1Click;
  String rightIcon2;
  final VoidCallback rightIcon2Click;

  BaseTitleBar(this.title, {this.leftIcon, this.rightText, this.rightClick,this.rightIcon1,this.rightIcon1Click,this.rightIcon2,this.rightIcon2Click});

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.transparent,
      title: new Text(this.title,style: TextStyle(color: MbColors.color_111,fontSize: 18),),
      leading: new IconButton(
        /// 左边图标，视情况而定，自己穿参数
        icon: Icon(this.leftIcon),
        color: MbColors.color_111,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      brightness: Brightness.dark,
      elevation: 0,
      centerTitle: true,
      actions: <Widget>[
        /// 右边的 布局，自己可以添加，是一个widget的一个集合，自已需求添加即可，我这里写了一个Text，和text的点击事件，
        Offstage(
          offstage: null == rightIcon2, //这里控制 true  false 布尔值
          child: new RightImageView(iconUrl: rightIcon2, rightClick: rightIcon2Click),
        ),
        Offstage(
          offstage: null == rightIcon1, //这里控制 true  false 布尔值
          child: new RightImageView(iconUrl: rightIcon1, rightClick: rightIcon1Click),
        ),
        Offstage(
          offstage: null == title, //这里控制 true  false 布尔值
          child: new RightTextView(title: rightText, rightClick: rightClick),
        ),
      ],
    );
  }
}

/// 右边的 布局，以及点击事件
class RightTextView extends StatelessWidget {
  String title;
  VoidCallback rightClick;

  RightTextView({this.title, this.rightClick});

  @override
  Widget build(BuildContext context) {
    var containView;
    if (title != null) {
      containView = new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Text(
            this.title,
            style: TextStyle(color: MbColors.color_111, fontSize: 18.0),
          ),
          onTap: this.rightClick,
        ),
      );
    } else {
      containView = Text("");
    }
    return containView;
  }
}

class RightImageView extends StatelessWidget {
  String iconUrl;
  VoidCallback rightClick;

  RightImageView({this.iconUrl, this.rightClick});

  @override
  Widget build(BuildContext context) {
    var containView;
    if (iconUrl != null) {
      containView = new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          child: new Image.asset(
          this.iconUrl,
          height: 16,
          width: 16,
          fit: BoxFit.contain,
        ),
          onTap: this.rightClick,
        ),
      );
    } else {
      containView = Text("");
    }
    return containView;
  }
}
