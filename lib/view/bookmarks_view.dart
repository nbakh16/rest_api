import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:rest_api/widgets/not_found.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(IconlyLight.arrowLeft2)
            ),
            const SizedBox(height: 200,),
            Center(
              child: NotFoundWidget(
                icon: IconlyBold.bookmark,
                text: 'No bookmarks found!'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
