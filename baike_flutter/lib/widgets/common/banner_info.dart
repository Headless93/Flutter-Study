import 'package:flutter/material.dart';

class BannerInfo extends StatelessWidget {
  final String bannerImage;
  const BannerInfo({Key key, this.bannerImage}) : super(key: key);

  Widget getLeftInfo() {
    return Row(
      children: [],
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.network(
            bannerImage,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
