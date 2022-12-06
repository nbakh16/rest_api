import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../constants/vars.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                    height: size.height * 0.3,
                    width: double.infinity,
                    boxFit: BoxFit.fill,
                    imageUrl: "https://th.bing.com/th/id/OIP.QPqwoFcftuqUuTLQnXDeSwHaG0?pid=ImgDet&w=640&h=589&rs=1",
                    // errorWidget: ,
                  ),
                ),
                Text("Title", style: titleTxtStyle),
                Text(
                    "Description " * 10,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: descTxtStyle
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
