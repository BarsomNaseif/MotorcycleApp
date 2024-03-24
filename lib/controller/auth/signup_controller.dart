import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motorcycle_app/controller/auth/services/SetDataUser.dart';
import 'package:motorcycle_app/data/model/users_model.dart';
import 'package:motorcycle_app/routes.dart';
import 'package:email_otp/email_otp.dart';
import 'package:motorcycle_app/view/widget/authentication/LoadingCard%20.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late String otp;
  RxBool showResendButton = false.obs;
  RxInt secondsRemaining = 96.obs;
  RxBool isTimerRunning = false.obs;
  EmailOTP myauth = EmailOTP();

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  List<users_model> newmodel = [];
  signUp() async {
    print(password.text.trim());
    print(email.text);

    if (formstate.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        )
            .then((value) {
          // Send Otp to email

          _SendVerificationOtp();
        });

        //  Get.toNamed(AppRoute.OtpFrom);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "The account already exists for that email.");
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  _SendVerificationOtp() async {
    myauth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "Email OTP",
        userEmail: email.text,
        otpLength: 5,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      snackbarMassage(title: "OTP", message: "OTP has been sent");
      Get.toNamed(AppRoute.OtpFrom);
    } else {
      snackbarMassage(title: "OTP", message: "Oops, OTP send failed");
    }
  }

  VerificationOtp() async {
     Get.toNamed(AppRoute.SuccessVerification);
    print(otp);
    if (await myauth.verifyOTP(otp: otp) == true) {
      FireStoreUser().saveUser();
      Get.toNamed(AppRoute.SuccessVerification);
    } else {
      snackbarMassage(title: "Oops", message: "Invalid OTP");
    }
  }

  void startTimer() {
    isTimerRunning.value = true;
    showResendButton.value = false; // إخفاء الزر "Resend" بدايةً
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        isTimerRunning.value = false;
        showResendButton.value = true; // عرض الزر "Resend" بعد انتهاء الوقت
      }
    });
  }

  void resendCode() {
    showResendButton.value = false;
    secondsRemaining.value = 30;
    startTimer();
    _SendVerificationOtp();
  }

  Future signInWithGoogle() async {
    try {
      // Show loading dialog
      Get.dialog(
          Center(
              child: LoadingCard(
            color: Color.fromARGB(85, 255, 255, 255),
          )),
          barrierDismissible: false);

      // Sign out from current Google account (if any)
      await GoogleSignIn().signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        FireStoreUser().saveUser();
      });
      Get.toNamed(AppRoute.homescreen);
      // Close loading dialog
      // Get.back();
    } catch (e) {
      // Close loading dialog
      Get.back();

      // Handle any errors
      print("Error signing in with Google: $e");
      rethrow; // Rethrow the error to be caught by the caller
    }
  }

  Future<void> signInWithFacebook() async {
    isLoading.value = true;
    try {
      // Trigger the sign-in flow

      final LoginResult result = await FacebookAuth.instance.login();

      // Obtain the access token from the result
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Sign in to Firebase with the obtained credential
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((user) {
        FacebookAuth.instance.getUserData().then((facebookUserData) async {
          User? users = FirebaseAuth.instance.currentUser;
          if (facebookAuthCredential.accessToken != null) {
            users_model user = users_model(
                email: facebookUserData['email'],
                username: facebookUserData['name'],
                passward: facebookUserData['password'],
                pic: facebookUserData['picture']['data']['url'],
                id: users?.uid);
            await FireStoreUser().addUserToFireStore(user);
             Get.toNamed(AppRoute.homescreen);
          }
        });
      });
    } on FirebaseException catch (e) {
      // Handle Facebook sign-in errors
      print('Facebook Sign-In Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    startTimer();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  SnackbarController snackbarMassage({
    //String? name,
    required String title,
    required String message,
  }) {
    return Get.snackbar(
      title,
      " $message",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
