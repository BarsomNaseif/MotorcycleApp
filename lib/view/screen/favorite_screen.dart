import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/favorite_controller.dart';
import 'package:motorcycle_app/view/widget/home/CardNewModel.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    return Scaffold(
        body: Obx(
      () => controller.loding.value
          ? CircularProgressIndicator()
          : controller.Favorite.length == null ||
                  controller.Favorite.length == 0
              ? Text('data')
              : ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.Favorite.length,
                  //shrinkWrap: true,
                  itemBuilder: ((context, index) => Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(controller.Favorite[index].id),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            controller
                                .removeProduct(controller.Favorite[index].id);
                                //controller.removeAllProducts();
                          }
                        },
                        background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 25),
                            child: Icon(
                              Icons.delete_outline_outlined,
                              size: 40,
                            )),
                        child: Container(
                          child: BikeCardNewModel(
                            rating:
                                controller.Favorite[index].rating!.toDouble(),
                            brand: controller.Favorite[index].name.toString(),
                            price: controller.Favorite[index].price.toString(),
                            image: controller.Favorite[index].image.toString(),
                          ),
                        ),
                      )),
                  // Dismissible(
                  //   direction: DismissDirection.endToStart,
                  //   key: Key(controller.Favorite[index].id),
                  //   background: Container(
                  //     color: Colors.red,
                  //     alignment: Alignment.centerRight,
                  //     padding: EdgeInsets.only(right: 33),
                  //     child: Icon(
                  //       Icons.delete_forever,
                  //       color: Colors.white,
                  //       size: 40,
                  //     ),
                  //   ),
                  //   onDismissed: (direction) {
                  //     if (direction == DismissDirection.endToStart) {
                  //       controller.removeProduct(controller
                  //           .Favorite[index].id
                  //           .toString());
                  //     }
                  //     print('delate' +
                  //         controller.Favorite[index].id);
                  //   },
                  //   child:
                  // )),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(),
                ),
    ));
  }
}
