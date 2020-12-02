import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mbapp/common/api.dart';
import 'package:mbapp/http/HeaderInterceptor.dart';
import 'package:mbapp/http/HttpError.dart';
import 'package:mbapp/http/HttpManager.dart';
import 'package:mbapp/res/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'verify_code_down.dart';
import 'forget_password.dart';

// ignore: must_be_immutable
class LoginState extends StatefulWidget {
  TextEditingController testAccount = TextEditingController();

  TextEditingController testPassWord = TextEditingController();

  bool isPhone = true;

  LoginState({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginState> {
  String hintText = '请输入验证码';
  int textFeldWidth = 200;
  int loginButtonTopEdge = 50;
  // List<String> testList = [];
  String stroo = '';

  @override
  void initState() {
    //初始化 Http，
    HttpManager().init(
      baseUrl: Api.getBaseUrl(),
      interceptors: [
        HeaderInterceptor(),
        LogInterceptor(),
      ],
    );
  }

  Widget createLoginSwap() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
      // color: Colors.pink,
      height: 45,
      child: Row(
        children: [
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              setState(() {
                widget.isPhone = true;
                MbColors.loginPhone = Colors.black;
                MbColors.loginPassWord = MbColors.color_abadc4;
                hintText = '请输入验证码';
                textFeldWidth = 180;
                loginButtonTopEdge = 50;
              });
            },
            child: Text('短信登录',
                style: TextStyle(
                  color: MbColors.loginPhone,
                  fontSize: 24,
                )),
          ),
          Container(
            alignment: Alignment.center,
            width: 20.0,
            child: Text('/',
                style: TextStyle(
                  color: MbColors.color_abadc4,
                  fontSize: 25,
                )),
          ),
          FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              setState(() {
                widget.isPhone = false;
                MbColors.loginPhone = MbColors.color_abadc4;
                MbColors.loginPassWord = Colors.black;
                hintText = '请输入密码';
                textFeldWidth = 260;
                loginButtonTopEdge = 27;
              });
            },
            child: Text('密码登录',
                style: TextStyle(
                  color: MbColors.loginPassWord,
                  fontSize: 24,
                )),
          ),
        ],
      ),
    );
  }

  Widget isAddText() {
    return widget.isPhone
        ? Row(
            children: [
              Text('+86',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              Container(
                alignment: Alignment.center,
                width: 20.0,
                child: Text('|',
                    style: TextStyle(
                      color: MbColors.color_abadc4,
                      fontSize: 20,
                    )),
              ),
            ],
          )
        : Text('');
  }

  Widget isAddVerifyBtn() {
    return widget.isPhone
        ? Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 30.0,
                child: Text('|',
                    style: TextStyle(
                      color: MbColors.color_abadc4,
                      fontSize: 20,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: TimerCountDownWidget(
                  testA: widget.testAccount,
                  onTimerBegin: () {
                    print('Begin');
                    HttpManager().post(
                      url: Api.VerifyCode,
                      params: {"mobile": widget.testAccount.text},
                      successCallback: (data) {
                        print('successCallback');
                      },
                      errorCallback: (HttpError error) {
                        print('11' + error.message);
                      },
                      tag: "tag",
                    );
                  },
                  onTimerFinish: () {
                    print('finshed');
                  },
                ),
              ),
            ],
          )
        : Text('');
  }

  Widget createAccountPhone() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: MbColors.color_f4f4f4)),
        // color: Colors.blue,
      ),
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isAddText(),
          Container(
            // alignment: Alignment.bottomCenter,
            width: ScreenUtil().setWidth(textFeldWidth),
            height: 45,
            child: TextField(
              controller: widget.testAccount,
              // 内容改变回调,第一个参数是输入框的内容,修改状态使用setState,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.bottom,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.red,
                  border: InputBorder.none,
                  // border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: '请输入手机号',
                  hintStyle:
                      TextStyle(fontSize: 16, color: MbColors.color_abadc4),
                  isDense: false),
              style: new TextStyle(fontSize: 16, color: MbColors.titleBlack),
            ),
          ),
        ],
      ),
    );
  }

  Widget createPassWordVerify() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border(bottom: BorderSide(color: MbColors.color_f4f4f4)),
      ),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 45,
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(textFeldWidth),
            height: 45,
            child: TextField(
              controller: widget.testPassWord,
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: !widget.isPhone,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // suffixIcon: Icon(Icons.remove_red_eye_sharp),
                border: InputBorder.none,
                // border: OutlineInputBorder(borderSide: BorderSide.none),

                hintText: hintText,
                hintStyle:
                    TextStyle(fontSize: 16, color: MbColors.color_abadc4),
                // isDense: false
              ),
              style: new TextStyle(fontSize: 16, color: MbColors.titleBlack),
            ),
          ),
          isAddVerifyBtn(),
        ],
      ),
    );
  }

  Widget isAddForgetPassWord() {
    return !widget.isPhone
        ? Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(260), 10, 20, 0),
            height: 30,
            child: Row(
              children: [
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    return pushForgetPassWord();
                  },
                  child: Text('忘记密码？',
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          )
        : Text('');
  }

//登录按钮
  Widget createLoginBtn() {
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
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil().setHeight(loginButtonTopEdge), 0, 0),
      width: 335,
      height: 45,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          String url = '';
          Map<String, String> para = Map<String, String>();
          //登陆请求
          if (widget.isPhone == false) {
            url = Api.PASSWORD_LOGIN;
            para = {
              "identification": widget.testAccount.text,
              "password": widget.testPassWord.text,
              "clientType": '1'
            };
          } else {
            url = Api.PHONE_LOGIN;
            para = {
              "mobile": widget.testAccount.text,
              "code": widget.testPassWord.text,
              "clientType": '1'
            };
          }
          print(para);
          HttpManager().post(
            url: url,
            params: para,
            successCallback: (data) {
              print('successCallback');

              print('----------$data');
              shareAdd(data);
              //登陆成功页面返回
              Navigator.pop(context);

              // Navigator.of(context).pushAndRemoveUntil(
              //     new MaterialPageRoute(builder: (context) => null),
              //     (route) => route == null);
            },
            errorCallback: (HttpError error) {
              print('11' + error.message);
            },
            tag: "tag",
          );
        },
        child: Text('登录',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
    );
  }

  void shareAdd(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
    prefs.setString('uid', data['uid']);
    prefs.setString('user_id', data['user_id']);
    prefs.setString('mobile', data['mobile']);
    prefs.setString('SN_API', data['SN_API']);
    prefs.setString('realname', data['realname']);
  }

  // void phoneLogin() {}
  // void passWordLogin() {}

//忘记密码跳转
  void pushForgetPassWord() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return ForgetPassWord();
    }));
  }

  @override
  void dispose() {
    // 释放
    widget.testAccount.dispose();
    widget.testPassWord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667, allowFontScaling: false);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            createLoginSwap(),
            createAccountPhone(),
            createPassWordVerify(),
            isAddForgetPassWord(),
            createLoginBtn(),
          ],
        ),
      ),
    );
  }
}
