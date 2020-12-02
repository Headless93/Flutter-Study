import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';

class PropertiesDetailWidget extends StatelessWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  PropertiesDetailWidget(this.baikeDetailInfoData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
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
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 120,
                  height: 40,
                  child: Text(
                    key,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 2, right: 15),
                      //产品信息垂直布局
                      child:
                      Text(
                        values,
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
          ],
        ),
    );
  }

}
