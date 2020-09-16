import 'package:flutter/material.dart';

class ArticleSummary extends StatelessWidget {
  final String title;
  final String summary;
  final String articleImage;

  const ArticleSummary({Key key, this.title, this.summary, this.articleImage})
      : super(key: key);

  Widget getLeftInfo() {
    return Column(
      children: <Widget>[Text(title), Text(summary)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          getLeftInfo(),
          Image.network(
            articleImage,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
