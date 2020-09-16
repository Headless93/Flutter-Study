import 'package:flutter/material.dart';
import 'package:baike_flutter/util.struct/article_summary_struct.dart';
import 'package:baike_flutter/util.struct/user_info_struct.dart';
import 'package:baike_flutter/widgets/common/banner_info.dart';
import 'package:baike_flutter/widgets/home_page/article_card.dart';

class HomePage extends StatelessWidget {
  final String bannerImage =
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg';

  final UserInfoStruct userInfo = UserInfoStruct('flutter',
      'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png');

  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      'nihao',
      'summary',
      'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png',
      20,
      30);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BannerInfo(bannerImage:bannerImage),
          ArticleCard(
            userInfo: userInfo,
            articleInfo: articleInfo,
          ),
        ],
      ),
    );
  }
}
