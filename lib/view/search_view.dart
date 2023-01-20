import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/widgets/not_found.dart';

import '../provider/dark_theme_provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final TextEditingController searchTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    if (mounted) {
      searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Color txtColor = Provider.of<DarkThemeProvider>(context).getDarkTheme
        ? Colors.white : Colors.black;

    return SafeArea(
      child: GestureDetector(
        onTap: (){
          // FocusScope.of(context).unfocus();
          focusNode.unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                        focusNode.unfocus();
                      },
                        icon: Icon(IconlyLight.arrowLeft2)
                    ),
                    Flexible(
                      child: TextField(
                        focusNode: focusNode,
                        controller: searchTextController,
                        style: TextStyle(
                          color: txtColor
                        ),
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(5),
                          suffix: IconButton(
                            onPressed: () {
                              searchTextController.clear();
                              focusNode.unfocus();
                              setState(() {});
                            },
                            icon: Icon(IconlyLight.delete, color: Colors.red,),
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),
              NotFoundWidget(
                icon: IconlyBold.danger,
                text: "No result found!"
              )
            ],
          )
        ),
      ),
    );
  }
}
