import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/res/color.dart';

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Color btnColor1 = Colors.blue;
  Color btnColor2;
  Color btnColor3;
  Color btnColor4;

  void selectBtn1() {
    setState(() {
      btnColor1 = Colors.blue;
      btnColor2 = null;
      btnColor3 = null;
      btnColor4 = null;
    });
  }

  void selectBtn2() {
    setState(() {
      btnColor2 = Colors.blue;
      btnColor1 = null;
      btnColor3 = null;
      btnColor4 = null;
    });
  }

  void selectBtn3() {
    setState(() {
      btnColor3 = Colors.blue;
      btnColor2 = null;
      btnColor1 = null;
      btnColor4 = null;
    });
  }

  void selectBtn4() {
    setState(() {
      btnColor4 = Colors.blue;
      btnColor2 = null;
      btnColor3 = null;
      btnColor1 = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('意见反馈'),
      ),
      body: Container(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 10,
              ),
              Container(
                // padding: EdgeInsets.only(left:10),
                transform: Matrix4.translationValues(-40, 0, 0),
                width: ScreenUtil().setWidth(255),
                // color: Colors.pink,
                child: Text(
                  '请选择反馈类型',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    // backgroundColor: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: btnColor1,
                    onPressed: selectBtn1,
                    child: Text('程序bug'),
                    highlightColor: Colors.blue,
                  ),
                  RaisedButton(
                      color: btnColor2,
                      onPressed: selectBtn2,
                      child: Text('功能建议')),
                  RaisedButton(
                      color: btnColor3,
                      onPressed: selectBtn3,
                      child: Text('产品纠错')),
                  RaisedButton(
                      color: btnColor4,
                      onPressed: selectBtn4,
                      child: Text('其他')),
                ],
              ),
              SizedBox(
                width: 50,
                height: 10,
              ),
              Container(
                // padding: EdgeInsets.only(left:10),
                transform: Matrix4.translationValues(-40, 0, 0),
                width: ScreenUtil().setWidth(255),
                // color: Colors.pink,
                child: Text(
                  '反馈内容',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    // backgroundColor: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                height: 10,
              ),
              Container(
                // alignment: Alignment.bottomCenter,
                width: ScreenUtil().setWidth(340),
                height: 145,
                child: TextField(
                  // controller: widget.testAccount,
                  // maxLines: 1,
                  // textAlignVertical: TextAlignVertical.bottom,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 3.0,
                              style: BorderStyle.solid) //没什么卵效果
                          ),
                      hintText: '请填写您的意见或建议，谢谢',
                      hintStyle:
                          TextStyle(fontSize: 16, color: MbColors.color_abadc4),
                      isDense: false),
                  style:
                      new TextStyle(fontSize: 16, color: MbColors.titleBlack),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  image: new DecorationImage(
                    image: new AssetImage('assets/images/login_button.png'),
                    fit: BoxFit.cover,
                  ),
                  // border: Border(bottom: BorderSide(color: MbColors.color_f4f4f4)),
                ),
                margin:
                    EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(50), 0, 0),
                width: 335,
                height: 45,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
//  [params setValue:self.selectOption.ID forKey:@"feedback_type"];
//     [params setValue:feedback forKey:@"content"];
//     [params setValue:phone forKey:@"contact_info"];

                    Fluttertoast.showToast(
                      msg: "提交成功",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER, // 消息框弹出的位置
                    );
                    Navigator.pop(context);

                    String url = '';
                    Map<String, String> para = Map<String, String>();
                    //登陆请求
                    print(para);
                    HttpManager().post(
                      url: url,
                      params: para,
                      successCallback: (data) {
                        print('successCallback');
                        //登陆成功页面返回
                        Navigator.pop(context);
                      },
                      errorCallback: (HttpError error) {
                        print('11' + error.message);
                      },
                      tag: "tag",
                    );
                  },
                  child: Text('提交',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
