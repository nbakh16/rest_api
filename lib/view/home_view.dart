import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provider/dark_theme_provider.dart';
import '../constants/vars.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_tab_btn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var tabOptions = TabOptions.trending;

  @override
  Widget build(BuildContext context) {
    Color txtColor = Provider.of<DarkThemeProvider>(context).getDarkTheme
        ? Colors.white : Colors.black;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Home", style: TextStyle(color: txtColor),),
          iconTheme: IconThemeData(color: txtColor),
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: [
                      MyTabBtn(
                        title: "All News",
                        color: tabOptions == TabOptions.allNews
                            ? Theme.of(context).cardColor : Colors.transparent,
                        fontSize: tabOptions == TabOptions.allNews
                            ? 22 : 16,
                        fontWeight: tabOptions == TabOptions.allNews
                            ? FontWeight.bold: FontWeight.normal,
                        myTap: (){
                          if(tabOptions == TabOptions.allNews) {
                            return;
                          }
                          setState((){
                            tabOptions = TabOptions.allNews;
                          });
                        },
                      ),
                      MyTabBtn(
                        title: "Trending",
                        color: tabOptions == TabOptions.trending
                            ? Theme.of(context).cardColor : Colors.transparent,
                        fontSize: tabOptions == TabOptions.trending
                            ? 22 : 16,
                        fontWeight: tabOptions == TabOptions.trending
                            ? FontWeight.bold: FontWeight.normal,
                        myTap: (){
                          if(tabOptions == TabOptions.trending){
                            return;
                          }
                          setState(() {
                            tabOptions = TabOptions.trending;
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
