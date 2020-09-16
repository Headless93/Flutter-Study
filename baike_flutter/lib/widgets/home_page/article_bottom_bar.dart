import 'package:flutter/material.dart';

class ArticleBottomBar extends StatelessWidget {
  final String nickname;
  final String headerImage;
  final int commentNum;

  const ArticleBottomBar(
      {Key key, this.nickname, this.headerImage, this.commentNum})
      : super(key: key);

  Widget getUserWidget() {
    return Row(
      children: [
        Image.network(
          headerImage,
          width: 15.0,
          height: 15.0,
          fit: BoxFit.cover,
        ),
        Text(nickname),
      ],
    );
  }

  Widget getCommentWidget() {
    return Row(
      children: [
        Icon(
          Icons.comment,
          color: Colors.grey,
          size: 18,
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text('$commentNum'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[getUserWidget(), getCommentWidget()],
      ),
    );
  }
}
