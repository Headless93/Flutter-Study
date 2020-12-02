import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productdetail.dart';
import 'package:mbapp/model/CompoundBaikeDetail.dart';
import 'package:mbapp/res/strings.dart';

class PrecursorDetailWidget extends StatelessWidget {
  final BaikeDetailInfoData baikeDetailInfoData;

  PrecursorDetailWidget(this.baikeDetailInfoData);

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
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(15),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //单个子Widget的水平最大宽度
                  maxCrossAxisExtent: 90,
                  //水平单个子Widget之间间距
                  mainAxisSpacing: 10.0,
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: 10.0,

                  childAspectRatio: 0.65,
              ),
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemCount: baikeDetailInfoData.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _build(BaikeUpDownstreamInfo.fromJson(baikeDetailInfoData.data[index]));
              },
            ),
          ),

        ]),);
  }

  Widget _build(BaikeUpDownstreamInfo product) {
    //返回产品项

    return GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => ProductDetail(item:i)),
//        );
      },
      child: Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  decoration: new BoxDecoration(
                      border: new Border.all(color: MbColors.color_f2f2f2, width: 1)),
                  child: Image.network(
                    product.structImage,
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    product.cas,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ProductFonts.casStreamStyle,
                  ),
                ),

                SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ProductFonts.nameStreamStyle,
                  ),
                ),
             ],
        )),
    );
  }

}
