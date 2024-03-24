import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return   Container(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                 child: SizedBox(
                   width: width,
                   child: DefaultTextStyle(
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                         fontSize: 22.0,
                         fontWeight: FontWeight.w600,
                         color: Colors.black
                    
                         // fontFamily: 'Bobbers',
                         ),
                     child: AnimatedTextKit(
                       pause: Duration(milliseconds: 1500),
                       animatedTexts: [
                         TyperAnimatedText(
                             ' ${Get.arguments['data'].brand},${Get.arguments['data'].model}'),
                       ],
                     ),
                   ),
                 ),
               ),
             );
  }
}