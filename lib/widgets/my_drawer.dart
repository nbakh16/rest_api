import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/view/bookmarks_view.dart';

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
            icon: IconlyLight.home,
            title: "Home",
            myTap: (){
              Navigator.pop(context);
            },
          ),
          MyListTile(
            icon: IconlyLight.bookmark,
            title: "Bookmarks",
            myTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookmarksView()),
              );
            },
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
