import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'my_list_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            child: const Center(
                child: Text("Drawer\nHeader")
            )
          ),
          MyListTile(
            title: "My",
            myTap: (){},
          ),
          MyListTile(
            title: "Home",
            myTap: (){},
          ),
          Divider(thickness: 2, color: Theme.of(context).primaryColor),
          SwitchListTile(
            title: Text(themeState.getDarkTheme ? "Dark Mode" : "Light Mode"),
            secondary: Icon(
              themeState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onChanged: (bool value){
              themeState.setDarkTheme = value;
            },
            value: themeState.getDarkTheme,
          )
        ],
      ),
    );
  }
}
