import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:motorcycle_app/controller/auth/signup_controller.dart';
import 'package:motorcycle_app/controller/categories_controller.dart';
import 'package:motorcycle_app/controller/home_controller.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CategoriesController());
    Get.put(HomeController());
    Get.put(SignUpController());
  }
}