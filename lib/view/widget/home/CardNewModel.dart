import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motorcycle_app/view/widget/CachedNetworkImage.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class BikeCardNewModel extends StatelessWidget {
  BikeCardNewModel({
    super.key,
    width,
    required this.image,
    required this.brand,
    required this.price,
    required this.rating,
  });

  final String image;
  final String brand;
  final String price;
  final double rating;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(4),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: HexColor('#1E1E1E'),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.5 + 6,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#1E1E1E'),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WidgetCachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.contain,

                    //height: 100
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: width * 0.4,
                      child: Text(
                        brand,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: GoogleFonts.kalam(
                          color: HexColor('FFFFFF'),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${price}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: GoogleFonts.kalam(
                            color: Color(0xFF8A8886),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    SizedBox(height: 10),
                    //   ratingBarIndicator(rating: rating)
                  ]),
            ),
          ],
        ));
  }
}
