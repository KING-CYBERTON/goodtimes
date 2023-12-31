import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../View/usersignin/Login.dart';


class GetAuth extends GetxController {
  static GetAuth instance = Get.find();

  //late Rx<User?> _user;
  Rxn<User> fbUser = Rxn<User>();
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void onReady() {
    super.onReady();

    fbUser = Rxn<User>(auth.currentUser);

    fbUser.bindStream(auth.userChanges());

    ever(fbUser, _initialScreen);

  }



  _initialScreen(User? user) {
    if (user == null) {
      print('loged in');
      Get.offAll(const LoginInPage());
    } else {
      print(user.uid);
      Get.offAllNamed('/Welcome');
    }
  }

  void createUser(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      // we will display the message uing the getx snack bar
      print(e.toString());

      Get.snackbar(
        "user info",
        "user message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "account creation failed",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logInUser(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // we will display the message uing the getx snack bar
      print(e.toString());

      Get.snackbar(
        "user info",
        "user message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "account Login failed",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }


  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully
      Get.snackbar(
        "Reset Password",
        "Password reset email sent",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Success",
          style: TextStyle(color: Colors.white),
        ),
      );
    } catch (e) {
      print(e.toString());
      // Handle password reset error
      Get.snackbar(
        "Reset Password",
        "Failed to send reset email",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Error",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logOut() {
    auth.signOut();
  }
}
