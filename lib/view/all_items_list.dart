import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/constants/vars.dart';

class AllItemsList extends StatelessWidget {
  const AllItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: (){

          },
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  height: size.height*0.08,
                  width: size.height*0.08,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: size.height*0.08,
                  width: size.height*0.08,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      height: size.height*0.1,
                      width: size.height*0.1,
                      boxFit: BoxFit.fill,
                      imageUrl: "https://th.bing.com/th/id/OIP.QPqwoFcftuqUuTLQnXDeSwHaG0?pid=ImgDet&w=640&h=589&rs=1",
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  )
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
