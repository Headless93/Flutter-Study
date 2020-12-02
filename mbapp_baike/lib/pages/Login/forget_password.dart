import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/pages/Login/verify_code_down.dart';
import 'package:mbapp/res/color.dart';

// ignore: must_be_immutable
class ForgetPassWord extends StatelessWidget {
  TextEditingController textMobile = TextEditingController();
  TextEditingController textCode = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  TextEditingController textPasswordCon = TextEditingController();

  ForgetPassWord({Key key}) : super(key: key);

  Widget createTextAndTextField(String title, String hintText,
      double textFieldW, double sizeW, TextEditingController textCol) {
    return Container(
        height: 45,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: MbColors.color_f4f4f4)),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(width: sizeW),
            Container(
              width: textFieldW,
              child: TextField(
                controller: textCol,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle:
                        TextStyle(fontSize: 16, color: MbColors.color_abadc4),
                    isDense: false),
                style: new TextStyle(fontSize: 16, color: MbColors.titleBlack),
                onChanged: (value) {
                  
                },
              ),
            ),
            title == '验证码'
                ? TimerCountDownWidget(
                    onTimerBegin: () {
                      print('begin');
                    },
                    onTimerFinish: () {
                      print('finshed');
                    },
                  )
                : Text(''),
          ],
        ));
  }

  Widget createLoginBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        image: new DecorationImage(
          image: new AssetImage('assets/images/login_button.png'),
          fit: BoxFit.cover,
        ),
        // border: Border(bottom: BorderSide(color: MbColors.color_f4f4f4)),
      ),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      width: 335,
      height: 45,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          HttpManager().post(
            url: Api.FORGET_PASSWORD,
            params: {
              "mobile": textMobile.text,
              "code": textCode.text,
              "password": textPassword.text,
              "password_confirmation": textPasswordCon.text,
            },
            successCallback: (data) {
              print('successCallback');
              print('----------$data');
              Fluttertoast.showToast(
                  msg: "修改成功",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER, // 消息框弹出的位置
                  // timeInSecForIos: 1, // 消息框持续的时间（目前的版本只有ios有效）
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pop(context);
            },
            errorCallback: (HttpError error) {
              print('11' + error.message);
              Fluttertoast.showToast(
                  msg: error.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER, // 消息框弹出的位置
                  // timeInSecForIos: 1, // 消息框持续的时间（目前的版本只有ios有效）
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            tag: "tag",
          );
        },
        child: Text('确认',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('找回密码'),
        ),
        body: Center(
            child: Column(
          children: [
            createTextAndTextField('手机号', '请输入手机号', 260, 25, textMobile),
            createTextAndTextField('验证码', '请输入验证码', 170, 25, textCode),
            createTextAndTextField('新密码', '请输入新密码', 260, 25, textPassword),
            createTextAndTextField('重复密码', '请输入新密码', 260, 10, textPasswordCon),
            createLoginBtn(context),
          ],
        )),
      ),
    );
  }
}
