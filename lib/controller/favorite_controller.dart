import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/data/datalocal/favorit_database.dart';
import 'package:motorcycle_app/data/model/favorite_model.dart';

class FavoriteController extends GetxController {
  ValueNotifier<bool> get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  //Favorite_model? _favoritemodel;

  final Favorite = <Favorite_model>[].obs;

  bool showFavouriteOnly = false;

  void onInit() {
    _getCartProducts();
    super.onInit();
  }

  AddtoFavourite() async {
    checkFavorite(Get.arguments['data'].id);
    if (showFavouriteOnly == true) {
      showFavouriteOnly = false;

      removeProduct(Get.arguments['data'].id);
    } else {
      print(Get.arguments['data'].brand);
      _addProduct(Get.arguments['data'].image[0], Get.arguments['data'].brand,
          Get.arguments['data'].price, Get.arguments['data'].id);
    }
    //  return AddtoFavourite();
  }

  bool checkFavorite(String id) {
    Favorite.forEach((element) {
      if (element.id == id) {
        showFavouriteOnly = true;
      } else {
        showFavouriteOnly = false;
      }
    });

    return showFavouriteOnly;
  }

  _addProduct(String image, String name, String price, String id) async {
    bool isExist = false;
    Favorite.forEach((element) {
      if (element.id == id) {
        isExist = true;
      }
    });
    if (!isExist) {
      await FavoriteDatabaseHelper.db.insert(Favorite_model(
          image: image, name: name, price: price, id: id, rating: 3.5));
      snackbarMassage(
          name: name,
          title: "Bike Added",
          message: "was added to your favorit");
      _getCartProducts();
    }
  }

  SnackbarController snackbarMassage({
    String? name,
    required String title,
    required String message,
  }) {
    return Get.snackbar(
      title,
      "${name} $message",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  _getCartProducts() async {
    var dbHelper = FavoriteDatabaseHelper.db;
    Favorite.value = await dbHelper.getAllProducts();

    update();
  }

  removeAllProducts() async {
    await FavoriteDatabaseHelper.db.deleteAllProducts();
    _getCartProducts();
  }

  Future removeProduct(
    String productId,
  ) async {
    await FavoriteDatabaseHelper.db.deleteProduct(productId);
    snackbarMassage(
        title: "Bike delete", message: "was delete to your favorit");

    _getCartProducts();
  }
}
