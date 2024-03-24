import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';

class ProductImageCarousel  extends StatelessWidget {
  const ProductImageCarousel ({super.key});

  @override
  Widget build(BuildContext context) {
   
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        width: width,
        height: 300,
        child: CarouselSlider(
            items: Get.arguments['data'].image
                .map<Widget>((item) => WidgetCachedNetworkImage(
                      imageUrl: item,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enlargeCenterPage: true,
              pageSnapping: true,
            )),
      ),
    );
  }
}