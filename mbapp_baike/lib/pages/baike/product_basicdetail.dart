import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';

class BasicDetailWidget extends StatelessWidget {
  final ProductBaseDetailData baseDetailData;
  final BaikeDetailInfoData baikeDetailInfoData;

  BasicDetailWidget(this.baseDetailData,this.baikeDetailInfoData);

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    String desc=baikeDetailInfoData.data[0].values.toList().elementAt(0);
    return Container(
      //图片左右内边距
      decoration: new BoxDecoration(
          color: Colors.white),
      child: _build(context, width, baseDetailData,desc),
    );
  }

  Widget _build(
      BuildContext context, double deviceWidth, ProductBaseDetailData product,String desc) {
    //返回产品项
    return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 2.0,
              indent: 0.0,
              color: MbColors.color_e5e5e5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child:  Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: MbColors.color_333,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.formulaDetailStr,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 2, right: 15),
                  height: 30,
                  //产品信息垂直布局
                  child:
                        Text(
                          product.molStruc.formula,
                          style: ProductFonts.itemValueStyle,
                        ),
                ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.molWeightStr,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 2, right: 15),
                      height: 30,
                      //产品信息垂直布局
                      child:
                      Text(
                        product.molStruc.molWeight.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.exactMassStr,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 2, right: 15),
                      height: 30,
                      //产品信息垂直布局
                      child:
                      Text(
                        product.molStruc.exactMass.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.logpStr,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 2, right: 15),
                      height: 30,
                      //产品信息垂直布局
                      child:
                      Text(
                        product.molStruc.logp.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.psaStr,
                    style: ProductFonts.itemTitleStype,
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 2, right: 15),
                      height: 30,
                      //产品信息垂直布局
                      child:
                      Text(
                        product.molStruc.psa.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.cnNameAliasStr,
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
                        product.cnNameAlias.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //产品类型
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 30,
                  child: Text(
                    YStrings.enNameAliasStr,
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
                        product.enNameAlias.toString(),
                        style: ProductFonts.itemValueStyle,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      )
    ;
  }

}
