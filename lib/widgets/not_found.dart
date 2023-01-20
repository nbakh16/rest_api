import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  NotFoundWidget({Key? key,
    required this.icon, required this.text
  }) : super(key: key);

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.yellow,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}
