import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/Utils.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baseShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 16,
        itemBuilder: (context, index){
          return ShimmerLoadingEffect(
            size: size,
            baseShimmerColor: baseShimmerColor,
            highlightShimmerColor: highlightShimmerColor,
            widgetShimmerColor: widgetShimmerColor
          );
        }
      ),
    );
  }
}

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({
    Key? key,
    required this.size,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.widgetShimmerColor,
  }) : super(key: key);

  final Size size;
  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Theme.of(context).cardColor,
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
              child: Shimmer.fromColors(
                baseColor: baseShimmerColor,
                highlightColor: highlightShimmerColor,
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: size.height*0.1,
                      width: size.height*0.1,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: widgetShimmerColor
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.03,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: widgetShimmerColor
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Container(
                          height: size.height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: widgetShimmerColor
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Container(
                                height: size.height * 0.02,
                                width: size.height * 0.02,
                                color: widgetShimmerColor
                              ),
                            ),
                            Container(
                              height: size.height * 0.02,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: widgetShimmerColor
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
