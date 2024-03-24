import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/core/constant/checkInternet.dart';
import 'package:motorcycle_app/core/themes/images_app.dart';
import 'package:motorcycle_app/data/model/ads_model.dart';
import 'package:motorcycle_app/data/model/mostpopular_model.dart';
import 'package:motorcycle_app/data/model/newmodel_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  //MyServices myServices = Get.find();
  RxBool isLoading = false.obs;
  void onInit() {
    super.onInit();
 
    getNewModel();
    getMostPopular();
    getAds();
  }

  List specifications = [
    {
      "name": "Engine",
      "image": ImageApp.engine,
    },
    {
      "name": "Horse Power",
      "image": ImageApp.horse,
    },
    {"name": "MaxSpeed", "image": ImageApp.speedometer},
    {
      "name": "model",
      "image": ImageApp.calendar,
    },
    {
      "name": "Tank",
      "image": ImageApp.fuel,
    },
  ];
  List<mostpopular_model> mostPopular = [];
  List<newmodel_model> newmodel = [];
  List<ads_model> Ads = [];
  getMostPopular() async {
    bool hasInternet = await checkInternet();
    if (hasInternet) {
      try {
        isLoading.value = true;
        mostPopular.clear();
        final snapshot = await fb.collection('mostpopular').get();
        mostPopular = snapshot.docs.map((doc) {
          final data = doc.data();

          return mostpopular_model.fromJson(data);
        }).toList();
      } catch (e) {
        print('mostPopular: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      return print('noooooo enternet');
    }
  }

  getNewModel() async {
    bool hasInternet = await checkInternet();
    if (hasInternet) {
      try {
        isLoading.value = true;
        newmodel.clear();
        final snapshot = await fb.collection('newmodel').get();
        newmodel = snapshot.docs.map((doc) {
          final data = doc.data();

          return newmodel_model.fromJson(data);
        }).toList();
      } catch (e) {
        print('newmodel: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      return print('noooooo enternet');
    }
  }

  getAds() async {
    bool hasInternet = await checkInternet();
    if (hasInternet) {
      try {
        isLoading.value = true;
        Ads.clear();
        final snapshot = await fb.collection('ads').get();
        Ads = snapshot.docs.map((doc) {
          final data = doc.data();

          return ads_model.fromJson(data);
        }).toList();
      } catch (e) {
        print('ads: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      return print('noooooo enternet');
    }
  }
}
