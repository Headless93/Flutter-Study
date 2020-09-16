import 'package:flutter/material.dart';

import 'package:baike_flutter/util.struct/user_info_struct.dart';
import 'package:baike_flutter/util.struct/article_summary_struct.dart';

import 'package:baike_flutter/widgets/home_page/article_bottom_bar.dart';
import 'package:baike_flutter/widgets/home_page/article_like_bar.dart';
import 'package:baike_flutter/widgets/home_page/article_summary.dart';

class ArticleCard extends StatelessWidget {
  final UserInfoStruct userInfo;
  final ArticleSummaryStruct articleInfo;

  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ArticleSummary(
            title: articleInfo.title,
            summary: articleInfo.summary,
            articleImage: articleInfo.articleImage,
          ),
          Row(
            children: [
              ArticleBottomBar(
                  nickname: userInfo.nickname,
                  headerImage: userInfo.headerImage,
                  commentNum: articleInfo.commentNum),
              ArticleLikeBar(likeNum: articleInfo.likeNum),
            ],
          ),
        ],
      ),
    );
  }
}
