import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Home")),
      body: Center(child: const Text("Body Text")),
    );
  }
}
