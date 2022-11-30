import 'package:flutter/material.dart';

class MyTabBtn extends StatelessWidget {
  const MyTabBtn({Key? key,
    required this.title, required this.color,
    required this.fontSize, required this.fontWeight,
    required this.myTap
  }) : super(key: key);

  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final Function myTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        myTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title, style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),),
        ),
      ),
    );
  }
}
