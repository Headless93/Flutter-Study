import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/res/color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mbapp/utils/tools.dart';

// ignore: must_be_immutable
class TimerCountDownWidget extends StatefulWidget {
  Function onTimerBegin;
  Function onTimerFinish;
  TextEditingController testA = TextEditingController();

  TimerCountDownWidget({this.testA, this.onTimerBegin, this.onTimerFinish})
      : super();

  @override
  State<StatefulWidget> createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  static Timer _timer;
  int _countdownTime = 0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      // color: Colors.black12,
      onPressed: () {
        if (Tools.isChinaPhoneLegal(widget.testA.text)) {
          if (_countdownTime == 0) {
            setState(() {
              _countdownTime = 60;
            });
            //开始倒计时
            startCountdownTimer();
          }
        } else {
          Fluttertoast.showToast(
              msg: "手机号格式错误",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER, // 消息框弹出的位置
              // timeInSecForIos: 1, // 消息框持续的时间（目前的版本只有ios有效）
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        // }
      },
      child: Text(
        _countdownTime > 0 ? '重新发送($_countdownTime)' : '获取验证码',
        style: TextStyle(
          fontSize: 16,
          color: _countdownTime > 0 ? MbColors.color_abadc4 : Colors.blue,
        ),
      ),
    );
  }

  void startCountdownTimer() {
    widget.onTimerBegin();
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => {
              setState(() {
                if (_countdownTime < 1) {
                  widget.onTimerFinish();
                  _timer.cancel();
                } else {
                  _countdownTime = _countdownTime - 1;
                }
              })
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
