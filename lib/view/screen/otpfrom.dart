import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:motorcycle_app/controller/auth/signup_controller.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class OtpFrom extends StatelessWidget {
  const OtpFrom({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> digits = List.filled(5, '');
   SignUpController controller= Get.put(SignUpController());
    controller.startTimer();
    return Scaffold(
     
      resizeToAvoidBottomInset: false,
      body: GetBuilder<SignUpController>(
        builder: (controller) => Form(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CustomText(
                  text: 'Verification code',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'We have sent the code verification to  ',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black,
                ),
                CustomText(
                  text: '${controller.email.text}',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: TextFormField(
                            onChanged: (val) {
                              if (val.length == 1) {
                                digits[index] = val;
                                FocusScope.of(context).nextFocus();
                              }
                              // Check if all digits are entered
                              if (digits
                                  .every((element) => element.isNotEmpty)) {
                                String fullNumber =
                                    digits.join(); // Join all digits
                                print('Full Number: $fullNumber');
                                controller.otp = fullNumber;
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: "*",
                            ),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      alignment: Alignment.center,
                      text: 'Resend code after  ',
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    Obx(() => 
                      CustomText(
                    alignment: Alignment.center,
                    text: '${(controller.secondsRemaining.value ~/ 60)}:${(controller.secondsRemaining.value % 60).toString().padLeft(2, '0')}',
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                    ),
                    Obx(() => Visibility(
                          visible: controller.showResendButton.value,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 4.0,
                              textStyle: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              controller.resendCode();
                            },
                            child: Text('Resend'),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 7.0,
                          textStyle: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        controller.VerificationOtp();
                      },
                      child: Text('Confirm')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
