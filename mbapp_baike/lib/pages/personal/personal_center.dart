import 'package:flutter/material.dart';
import 'package:mbapp/pages/personal/personal_listview.dart';

class PersonCenter extends StatelessWidget {
  const PersonCenter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: PersonalListView(),
    );
  }
}
