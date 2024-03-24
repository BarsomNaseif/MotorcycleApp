import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/bindings/initialBindings.dart';
import 'package:motorcycle_app/core/services/services.dart';
import 'package:motorcycle_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Motorcycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      defaultTransition: Transition.downToUp,
      initialBinding: initialBindings(),
       getPages: routes,
     // home: MyAnimatedText(),
    );
  }
}
