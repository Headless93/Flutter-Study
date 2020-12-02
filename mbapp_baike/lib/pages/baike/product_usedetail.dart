import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';
import 'package:flutter_html/flutter_html.dart';

class UseDetailWidget extends StatelessWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  UseDetailWidget(this.baikeDetailInfoData);

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    return Container(      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            height: 2.0,
            indent: 0.0,
            color: MbColors.color_e5e5e5,
          ),
          ListView.builder(
              itemCount: baikeDetailInfoData.data.length,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Container(
                  decoration: new BoxDecoration(
                      color: MbColors.color_fff),
                  child:_build(context,baikeDetailInfoData.data[index].keys.toList().elementAt(0),baikeDetailInfoData.data[index].values.toList().elementAt(0)),
                );
              }),
        ]),
    );
  }

  Widget _build(
      BuildContext context, String key,String values) {
    //返回产品项
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 40,
            child: Text(
              key,
              style: ProductFonts.useTitleStype,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 15, right: 15),
            //产品信息垂直布局
            child:Html(
              data: values,
              backgroundColor: Colors.white70,
              defaultTextStyle: ProductFonts.itemValueStyle,
            )
          ),
        ],
      ),
    );
  }

}
