import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';

class ImportDetailWidget extends StatelessWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  ImportDetailWidget(this.baikeDetailInfoData);

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    BaikeImportInfo baikeImportInfo =new BaikeImportInfo();
    return Container(decoration: new BoxDecoration(
        color: Colors.white),
      child: _build(context, baikeImportInfo),
    );
  }

  Widget _build(
      BuildContext context, BaikeImportInfo product) {
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
                  YStrings.hscodeNoStr,
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
                      '',
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
                width: 120,
                height: 40,
                child: Text(
                  YStrings.cnSummaryStr,
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
                      '',
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
                width: 120,
                height: 40,
                child: Text(
                  YStrings.elementsStr,
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
                      '',
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
                width: 120,
                height: 40,
                child: Text(
                  YStrings.conditionsStr,
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
                      '',
                      style: ProductFonts.itemValueStyle,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //产品类型
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15),
                width: 120,
                height: 40,
                child: Text(
                  YStrings.categoryStr,
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
                      '',
                      style: ProductFonts.itemValueStyle,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //产品类型
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15),
                width: 120,
                height: 40,
                child: Text(
                  YStrings.enSummaryStr,
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
                      '',
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
