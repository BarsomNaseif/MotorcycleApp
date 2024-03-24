import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/auth/LoginController.dart';
import 'package:motorcycle_app/core/constant/validinput.dart';
import 'package:motorcycle_app/core/themes/images_app.dart';
import 'package:motorcycle_app/routes.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';
import 'package:motorcycle_app/view/widget/DefaultTextFormField.dart';
import 'package:motorcycle_app/view/widget/authentication/LoadingCard%20.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImageApp.back,
                ),
              ),
            ),
            child: GetBuilder<LoginController>(
              builder: (controller) => Form(
                key: controller.formstate,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Card(
                      color: Color.fromARGB(85, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Login',
                                fontSize: 25,
                                alignment: Alignment.center),
                            SizedBox(
                              height: 15,
                            ),
                            defaultTextFoemField(
                                controller: controller.email,
                                onValidate: (val) {
                                  return validInput(val!, 3, 40, "email");
                                },
                                keyboardType: TextInputType.emailAddress,
                                labelText: "Email",
                                prefix: Icons.email_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            defaultTextFoemField(
                              controller: controller.password,
                              onValidate: (val) {
                                return validInput(val!, 6, 30, "password");
                              },
                              suffix: controller.isshowpassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: "Passward",
                              prefix: Icons.lock_outlined,
                              isPassword: controller.isshowpassword,
                              suffixPress: () {
                                print(controller.isshowpassword);
                                controller.showPassword();
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Obx(() {
                              return controller.isLoading.value
                                  ? LoadingCard()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 7.0,
                                          textStyle: const TextStyle(
                                              color: Colors.white)),
                                      onPressed: () {
                                        //  Get.toNamed(AppRoute.OtpFrom);
                                        controller.Login();
                                      },
                                      child: Text('LOG IN'));
                            }),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoute.SignInCardWidget);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create a new account...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'SignUp',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            )));
  }
}
