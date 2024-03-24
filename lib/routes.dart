import 'package:get/get.dart';
import 'package:motorcycle_app/view/screen/Firstlaunchpage.dart';
import 'package:motorcycle_app/view/screen/SuccessVerification.dart';
import 'package:motorcycle_app/view/screen/homescreen.dart';
import 'package:motorcycle_app/view/screen/otpfrom.dart';
import 'package:motorcycle_app/view/widget/authentication/LoginCardWidget.dart';
import 'package:motorcycle_app/view/widget/authentication/SignInCardWidget.dart';

List<GetPage<dynamic>>? routes = [
//  GetPage(
//       name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
//   // GetPage(name: "/", page: () => TestView()),

  GetPage(name: "/", page: () => Firstlaunchpage()),
  GetPage(name: AppRoute.SignInCardWidget, page: () => SignInCardWidget(),),
  GetPage(name: AppRoute.LoginCardWidget, page: () => LoginCardWidget()),
  GetPage(name: AppRoute.OtpFrom, page: () => OtpFrom()),
  GetPage(
      name: AppRoute.SuccessVerification, page: () => SuccessVerification()),
       GetPage(
      name: AppRoute.homescreen, page: () => HomeScareen(),),
      
];

class AppRoute {
  static const String homescreen = "/homescreen";
  static const String SignInCardWidget = "/SignInCardWidget";
  static const String LoginCardWidget = "/LoginCardWidget";
  static const String OtpFrom = "/OtpFrom";
  static const String SuccessVerification = "/SuccessVerification";
}
