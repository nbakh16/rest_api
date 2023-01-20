import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({Key? key,
    required this.title, required this.myTap, required this.icon
  }) : super(key: key);

  final String title;
  final Function myTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: (){
        myTap();
      },
    );
  }
}
