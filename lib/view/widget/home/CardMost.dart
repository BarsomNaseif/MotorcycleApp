import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class BikeCardMost extends StatelessWidget {
  const BikeCardMost(
      {super.key,
      required this.image,
      required this.brand,
      required this.price,
      required this.rating});

  final String image;
  final String brand;
  final String price;
  final double rating;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
        //  color: Color.fromARGB(255, 255, 250, 250),
        //height: height / 3.5,
        // width: width * 0.6,
        child: Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 180,
          height: 120,
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HexColor('#1E1E1E'),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: GoogleFonts.kalam(
                      color: HexColor('FFFFFF'),
                      fontSize: 19,
                    ),
                  ),
                  // CustomText(
                  //   overflow: TextOverflow.clip,
                  //   text: brand,
                  //   fontSize: 19,
                  //   maxLines: 2,
                  //   fontWeight: FontWeight.bold,
                  //   color: HexColor('FFFFFF'),
                  // ),
                  SizedBox(height: 1),
                  Row(
                    children: [
                        Text(
                          '${price}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: GoogleFonts.kalam(
                            color: Color(0xFF8A8886),
                             fontSize: 18, fontWeight: FontWeight.bold,
                      
                          ),
                        ),
                      // CustomText(
                      //   overflow: TextOverflow.clip,
                      //   text: '${price}',
                      //   fontSize: 18,
                      //   maxLines: 2,
                      //   fontWeight: FontWeight.bold,
                      //   color: Color(0xFF8A8886),
                      // ),
                      Text(
                          " EGP",
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: GoogleFonts.kalam(
                            color: Color(0xFF8A8886),
                            fontSize: 15,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 2),
                  //ratingBarIndicator(rating: rating)
                ]),
          ),
        ),
      ),
      Positioned(
        top: 9,
        child: Container(
          width: 170,
          height: 95,
          // color: Colors.black,
          child: WidgetCachedNetworkImage(imageUrl: image, fit: BoxFit.cover),
        ),
      ),
    ]));
  }
}
