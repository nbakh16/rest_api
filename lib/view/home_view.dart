import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provider/dark_theme_provider.dart';
import '../constants/vars.dart';
import '../widgets/my_btn.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_tab_btn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var tabOptions = TabOptions.allNews;
  int totalPage = 8;
  int currentPageIndex = 0;

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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                children: [
                  Row(
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
                  const SizedBox(height: 4,),
                  tabOptions == TabOptions.trending ? Container() :
                  SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Row(
                      children: [
                        MyButton(
                          btnText: "Prev",
                          myTap: (){
                            setState(() {
                              if(currentPageIndex>0){
                                currentPageIndex -= 1;
                              }
                            });
                          }
                        ),
                        Flexible(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: totalPage,
                            itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                color: currentPageIndex == index ? Theme.of(context).cardColor : Colors.transparent,
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      currentPageIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text("${index+1}")),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        MyButton(
                            btnText: "Next",
                            myTap: (){
                              setState(() {
                                if(currentPageIndex < totalPage-1){
                                  currentPageIndex += 1;
                                }
                              });
                            }
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
