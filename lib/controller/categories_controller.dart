import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/core/constant/checkInternet.dart';
import 'package:motorcycle_app/data/model/brand_model.dart';
import 'package:motorcycle_app/data/model/categorie.dart';

class CategoriesController extends GetxController {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  //MyServices myServices = Get.find();
  RxBool isLoading = false.obs;
  void onInit() {
    Categories();
    getBrand();
    super.onInit();
  }

  List<Categorie> productList = [];
  List<Brand_model> brandList = [];

  Future Categories() async {
    bool hasInternet = await checkInternet();
    if (hasInternet) {
      try {
        isLoading.value = true;
        productList.clear();
        final snapshot = await fb.collection('catogrs').get();
        productList = snapshot.docs.map((doc) {
          final data = doc.data();

          return Categorie.fromJson(data);
        }).toList();
      } catch (e) {
        print('Categories: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      return print('noooooo enternet');
    }
  }

  getBrand() async {
    bool hasInternet = await checkInternet();
    if (hasInternet) {
      try {
        isLoading.value = true;
        brandList.clear();
        final snapshot = await fb.collection('brand').get();
        brandList = snapshot.docs.map((doc) {
          final data = doc.data();

          return Brand_model.fromJson(data);
        }).toList();
      } catch (e) {
        print('brandList: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      return print('noooooo enternet');
    }
  }
}
