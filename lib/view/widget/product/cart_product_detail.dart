import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/home_controller.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class CartProductDetail extends StatelessWidget {
  CartProductDetail(
      {this.Engine,
      this.MaxSpeed,
      this.HorsePower,
      this.Tank,
      this.Videoreview,
      this.ViewSpecsDetails,
      this.model});
  String? ViewSpecsDetails;
  String? Engine;
  String? HorsePower;
  String? MaxSpeed;
  String? model;
  String? Tank;
  String? Videoreview;
  @override
  Widget build(BuildContext context) {
    List result = [Engine, HorsePower, MaxSpeed, model, Tank];
    double width = MediaQuery.of(context).size.width;

    HomeController homeController = Get.put(HomeController());

    return Column(children: [
      CustomText(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        text: 'ViewSpecsDetails',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        // color: color1,
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ReadMoreText(
          ViewSpecsDetails!,
          trimLines: 3,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          lessStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          moreStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      CustomText(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        text: 'Specifications',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        // color: color1,
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 110,
        width: width,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.specifications.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(5),
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(homeController.specifications[index]['image'],
                    height: 40, width: 60),
                CustomText(
                  text: homeController.specifications[index]['name'],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: result[index],
                  fontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
      ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 0),
          collapsedIconColor: Colors.white,
          iconColor: Color.fromARGB(255, 158, 145, 145),
          title: CustomText(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            text: 'Video review',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          children: [
            Container(
              //width: 300,
              height: 250,

              child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: 'igfOl9YbEXs',
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    )),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              ),
            )
          ]),
      SizedBox(
        height: 25,
      ),
    ]);
  }
}
