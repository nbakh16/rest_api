import 'package:flutter/material.dart';

Widget MyButton(
    {
      required Function myTap,
      required String btnText
    }
    ){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
    child: ElevatedButton(
      onPressed: (){
        myTap();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.normal
          )
      ),
      child: Text(btnText),
    ),
  );
}