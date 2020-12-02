import 'package:flutter/material.dart';
import 'package:mbapp/pages/personal/personal_listview_item.dart';
import 'package:mbapp/res/color.dart';

class PersonalListView extends StatefulWidget {
  PersonalListView({Key key}) : super(key: key);

  @override
  _PersonalListViewState createState() => _PersonalListViewState();
}

class _PersonalListViewState extends State<PersonalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          // height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200.0,
          ),
      color: MbColors.backGroundColor,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return PersonalListViewItem(dataIndex: index);
        },
      ),
    );
  }
}
