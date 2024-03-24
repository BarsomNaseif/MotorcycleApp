import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motorcycle_app/controller/auth/signup_controller.dart';
import 'package:motorcycle_app/core/themes/images_app.dart';

class LoginSignupWidget extends StatelessWidget {
  LoginSignupWidget({super.key, required this.onTaplogin});

  void Function()? onTaplogin;

  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            ImageApp.back,
          ),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 20,
                      child: SvgPicture.asset(
                        ImageApp.instagram,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {
                        controller.signInWithFacebook();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 20,
                        child: SvgPicture.asset(
                          ImageApp.facebook,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {
                        controller.signInWithGoogle();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 20,
                        child: SvgPicture.asset(
                          ImageApp.google,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: onTaplogin,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please login to your account...',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'LogIn',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
