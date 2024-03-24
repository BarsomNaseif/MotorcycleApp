import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motorcycle_app/controller/auth/signup_controller.dart';
import 'package:motorcycle_app/core/constant/validinput.dart';
import 'package:motorcycle_app/core/themes/images_app.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';
import 'package:motorcycle_app/view/widget/DefaultTextFormField.dart';
import 'package:motorcycle_app/view/widget/authentication/LoadingCard%20.dart';

class SignInCardWidget extends StatelessWidget {
  const SignInCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            ImageApp.back,
          ),
        ),
      ),
      child: GetBuilder<SignUpController>(
        builder: (controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Card(
                color: Color.fromARGB(85, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formstate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'sign in',
                            fontSize: 25,
                            alignment: Alignment.center),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFoemField(
                            controller: controller.username,
                            onValidate: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            keyboardType: TextInputType.emailAddress,
                            labelText: "user Name",
                            prefix: Icons.account_circle_outlined),
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
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFoemField(
                          controller: controller.password,
                          onValidate: (val) {
                            return validInput(val!, 6, 30, "password");
                          },
                          suffix: controller.isShowPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          keyboardType: TextInputType.visiblePassword,
                          labelText: "Passward",
                          prefix: Icons.lock_outlined,
                          isPassword: controller.isShowPassword,
                          suffixPress: () {
                            print(controller.isShowPassword);
                            controller.showPassword();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          //  height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: InternationalPhoneNumberInput(
                            textFieldController: controller.phone,
                            scrollPadding: EdgeInsets.all(4),
                            autoValidateMode: AutovalidateMode.disabled,
                            inputBorder: InputBorder.none,
                            inputDecoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              hintText: 'Phone Number',

                              border: InputBorder.none,
                              isDense: true,

                              ///added
                            ),
                            selectorConfig: const SelectorConfig(
                                leadingPadding: 10,
                                selectorType: PhoneInputSelectorType.DIALOG),
                            onInputChanged: (PhoneNumber number) {},
                            onSaved: (value) {
                              print(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Obx(() {
                          return controller.isLoading.value
                              ? LoadingCard(color: Colors.black,)
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 7.0,
                                      textStyle:
                                          const TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    //  Get.toNamed(AppRoute.OtpFrom);
                                    controller.signUp();
                                  },
                                  child: Text('SIGN IN'));
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
