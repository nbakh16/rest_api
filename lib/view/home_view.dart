import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provider/dark_theme_provider.dart';
import '../widgets/my_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Home",
            style: TextStyle(color: Provider.of<DarkThemeProvider>(context).getDarkTheme
                ? Colors.white : Colors.black),),
          iconTheme: IconThemeData(color: Provider.of<DarkThemeProvider>(context).getDarkTheme
              ? Colors.white : Colors.black),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search)
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Body Text"),

              ],
            )
        ),
      ),
    );
  }
}
