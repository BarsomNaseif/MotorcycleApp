import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:motorcycle_app/view/screen/brand_screen.dart';
import 'package:motorcycle_app/view/screen/homepage.dart';
import 'package:motorcycle_app/view/screen/favorite_screen.dart';
import 'package:motorcycle_app/view/screen/settings_screen.dart';

class HomeScreenController extends GetxController {
  int currentpage = 0;
 
  List<Widget> listPage =const [
    HomePage(),
    brsndScreen(),
    FavoriteScreen(),
    SettingsScreen(),
    // const HomePage(),
    
  ];

  List titlebottomappbar = ["Home", "brand", "Favorite", "Settings"];
  List<IconData> iconbottomappbar = const [
    CupertinoIcons.home,
    CupertinoIcons.circle_grid_3x3,
    CupertinoIcons.heart_fill,
    CupertinoIcons.settings
  ];
  changePage(int i) {
    currentpage = i;
    update();
  }

var isSignIn = false.obs;
  var isLogin = false.obs;

  void setIsSignIn(bool value) {
    isSignIn.value = value;
  }

  void setIsLogin(bool value) {
    isLogin.value = value;
  }
  
}
