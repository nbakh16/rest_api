import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provider/dark_theme_provider.dart';
import 'package:rest_api/view/search_view.dart';
import 'package:rest_api/view/trending_list.dart';
import '../constants/vars.dart';
import '../widgets/my_btn.dart';
import 'all_items_list.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_tab_btn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var tabOptions = TabOptions.allItems;
  int totalPage = 8;
  int currentPageIndex = 0;

  String? defaultSort = SortListOptions.time.name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
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
                        title: "All Items",
                        color: tabOptions == TabOptions.allItems
                            ? Theme.of(context).cardColor : Colors.transparent,
                        fontSize: tabOptions == TabOptions.allItems
                            ? 22 : 16,
                        fontWeight: tabOptions == TabOptions.allItems
                            ? FontWeight.bold: FontWeight.normal,
                        myTap: (){
                          if(tabOptions == TabOptions.allItems) {
                            return;
                          }
                          setState((){
                            tabOptions = TabOptions.allItems;
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
                  ),

                  tabOptions == TabOptions.trending ? Container() :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Sort by"),
                      const SizedBox(width: 8,),
                      Material(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButton(
                            dropdownColor: Theme.of(context).primaryColor,
                            value: defaultSort,
                            items: dropDownItems,
                            onChanged: (value) {
                              setState((){
                                defaultSort = value;
                              });
                            }
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),
                  tabOptions == TabOptions.allItems
                  ? Expanded(
                    child: ListView.builder(
                      itemCount: 16,
                      itemBuilder: (context, index){
                        return const AllItemsList();
                      }
                    ),
                  )
                  : SizedBox(
                    height: size.height * 0.6,
                    child: Swiper(
                      itemWidth: size.width * 0.85,
                      layout: SwiperLayout.STACK,
                      autoplay: true,
                      viewportFraction: 0.85,
                      itemCount: 16,
                      itemBuilder: (context, index){
                        return const TrendingList();
                      },
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }


  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menu = [
      DropdownMenuItem(
        value: SortListOptions.relevant.name,
        child: Text(SortListOptions.relevant.name),
      ),
      DropdownMenuItem(
        value: SortListOptions.popular.name,
        child: Text(SortListOptions.popular.name),
      ),
      DropdownMenuItem(
        value: SortListOptions.time.name,
        child: Text(SortListOptions.time.name),
      ),
    ];
    return menu;
  }
}
