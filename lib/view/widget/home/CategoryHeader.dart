import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motorcycle_app/view/screen/viewall_screen.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

// ignore: must_be_immutable
class CategoryHeader extends StatelessWidget {
  CategoryHeader({super.key, required this.text,required this.onPressed});
  String text;
  Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.abel(color: Colors.black, fontSize: 25),
        ),
        // CustomText(
        //   text: text,
        //   fontSize: 25,
        //   fontWeight: FontWeight.bold,
        //   color: Colors.black,
        // ),
        Spacer(),
        TextButton(
          onPressed: onPressed,

          child: Text(
         ' viewall',
          style: GoogleFonts.abel(color: Colors.black, fontSize: 18),
        )
        )
      ],
    );
  }
}
