import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/favorite_controller.dart';

class ProductActionsRow extends StatelessWidget {
  const ProductActionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());

    return GetBuilder<FavoriteController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: IconButton(
              color: Color.fromARGB(255, 15, 15, 15),
              iconSize: 30,
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
              iconSize: 30,
              color: Colors.white,
              icon: controller.checkFavorite(Get.arguments['data'].id)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border_rounded,
                    ),
              onPressed: () {
                controller.AddtoFavourite();
              }),
        ],
      ),
    );
  }
}
