import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  MyListTile({
    Key? key, required this.title, required this.myTap
  }) : super(key: key);

  String title;
  final Function myTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        myTap();
      },
    );
  }
}
