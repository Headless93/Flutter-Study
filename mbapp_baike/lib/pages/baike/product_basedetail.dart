import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/res/strings.dart';

class BaseDetailWidget extends StatelessWidget {
  final ProductBaseDetailData baseDetailData;

  BaseDetailWidget(this.baseDetailData);

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      //图片左右内边距
      decoration: new BoxDecoration(
          color: Colors.white),
      child: _build(context, width, baseDetailData),
    );
  }

  Widget _build(
      BuildContext context, double deviceWidth, ProductBaseDetailData product) {
    //返回产品项
    return GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => ProductDetail(item:i)),
//        );
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            //产品图片
            Container(
              alignment: Alignment.topCenter,
              decoration: new BoxDecoration(
                  border: new Border.all(color: MbColors.color_f2f2f2, width: 1)),
              margin: EdgeInsets.all(15),
              child: Image.network(
                product.structImage,
                width: 100.0,
                height: 100.0,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only( right: 10),
                //产品信息垂直布局
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                      product.cnName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: MbColors.color_323455,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: <Widget>[
                        //产品类型
                        Text(
                          YStrings.casStr,
                          style: ProductFonts.itemProductStyle,
                        ),
                        Text(
                          product.cas,
                          style: ProductFonts.itemProductStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: <Widget>[
                        //产品类型
                        Text(
                          YStrings.enNameStr,
                          style: ProductFonts.itemProductStyle,
                        ),
                        Expanded(
                          child:Text(
                          product.enName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          style: ProductFonts.itemProductStyle,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
