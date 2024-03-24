import 'package:flutter/material.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class LoadingCard extends StatelessWidget {
  LoadingCard({this.color,});
  @override
  Color? color=Colors.black;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(8),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeAlign: 0.1,
                strokeWidth: 5,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              fontSize: 17,
              text: 'Loading...',
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
