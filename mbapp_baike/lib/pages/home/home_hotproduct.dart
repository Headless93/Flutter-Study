import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mbapp/res/color.dart';
import 'package:mbapp/model/RecommendProducts.dart';
import 'package:mbapp/pages/baike/product_detail.dart';

class HotProductWidget extends StatelessWidget {
  final RecommendProductListModal recommendProduct;

  HotProductWidget(this.recommendProduct);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/home/icon_hotsearch.png',
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 2),
                Text(
                  "热门搜索",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MbColors.color_333,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, //两个widget之间横向的间隔
              direction: Axis.horizontal, //方向
              alignment: WrapAlignment.start, //内容排序方式
              children: List<Widget>.generate(
                recommendProduct.products.length,
                (int index) {
                  return ActionChip(
                    //标签文字
                    label: Text(
                      recommendProduct.products[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        color: MbColors.color_333,
                      ),
                    ),
                    //点击事件
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                        ProductDetailPage(molId:recommendProduct.products[index].compound.mol_id)
                        ),
                      );
                    },
                    elevation: 3,
                    backgroundColor: MbColors.color_f4f4f4,
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }
}
