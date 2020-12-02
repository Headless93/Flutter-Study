import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/res/font.dart';
import 'package:mbapp/model/productBanner.dart';
import 'package:mbapp/res/strings.dart';
import 'package:mbapp/utils/utils.dart';

class BannerWidget extends StatelessWidget {
  final ProductBannerListModal listProduct;
  List<String> hotKeyDatas = <String>[
    '基本信息',
    '物化信息',
    'MSDS',
    '生产用途',
  ];
  BannerWidget(this.listProduct);

  @override
  Widget build(BuildContext context) {
    //计算宽高 按比例
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      //轮播组件
      child: Swiper(
        itemBuilder: (BuildContext context, index) {
          return Container(
            //图片左右内边距
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 24),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular((8.0))),
            child: _build(context, width, listProduct.data.elementAt(index)),
          );
        },
        //轮播数量
        itemCount: listProduct.data.length,
        //方向
        scrollDirection: Axis.horizontal,
        //是否自动播放
        autoplay: true,
        pagination: buildSwiperPagination(),
      ),
    );
  }

  Widget _build(
      BuildContext context, double deviceWidth, ProductBannerDetail product) {
    product.prop.removeWhere((element) => element.name=='编号系统');
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
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 45),
              height: 80.0,
              child: Image.network(
                product.structImage,
                width: 80.0,
                height: 80.0,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 2, right: 10),
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
                    Text(
                      product.enName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ProductFonts.itemProductStyle,
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
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          YStrings.formulaStr,
                          style: ProductFonts.itemProductStyle,
                        ),
                        Expanded(
                          child:Text(
                          product.molStruc.formula,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          style: ProductFonts.itemProductStyle,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: <Widget>[
                        //产品类型
                        Text(
                          YStrings.aliasStr,
                          style: ProductFonts.itemProductStyle,
                        ),
                        Expanded(
                          child:
                        Text(
                          listToString(product.cnNameAlias),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ProductFonts.itemProductStyle,
                        )),
                      ],
                    ),
                Expanded(
                  child:Wrap(
                      spacing: 5.0, //两个widget之间横向的间隔
                      direction: Axis.horizontal, //方向
                      alignment: WrapAlignment.start, //内容排序方式
                      children: buildType(product.prop),
                    ),
                )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildType(List<PropInfoData> propInfos) {
    return List<Widget>.generate(
      2,
      (int index) {
        return ActionChip(
          //标签文字
          label: Text(
            propInfos[index].enName == 'jianjie'?YStrings.detailBaseStr:propInfos[index].name,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //点击事件
          onPressed: () async {},
          backgroundColor: MbColors.color_abadc4,
        );
      },
    );
  }

// 分页指示器

  buildSwiperPagination() {
    return SwiperPagination(
      //指示器显示的位置

      alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间

      // 距离调整

      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),

      // 指示器构建

      builder: DotSwiperPaginationBuilder(

          // 点之间的间隔
          space: 2,
          // 没选中时的大小
          size: 8,
          // 选中时的大小
          activeSize: 9,

          // 没选中时的颜色

          color: MbColors.unSelectColor,

          //选中时的颜色

          activeColor: MbColors.activeColor),
    );
  }
}
