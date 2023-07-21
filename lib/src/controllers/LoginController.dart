import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/Login/LoginModel.dart';
import 'package:construction_app/src/config/env.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:construction_app/src/config/preference.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var log = Login().obs;

  Future<void> loginUser(String username, String password) async {
    isLoading = false.obs;
    final response = await ApiService().loginApp(username, password);
    // print(response);
    if (response != null) {
      setToken(response.accessToken.toString());
      final profile = await ApiService().fetchUserProfile();
      setUser(profile!.id.toString());
      setName(profile!.username.toString());

      if (profile != null) {
        if (profile.role == "user") {
          Get.offAllNamed(userRoute);
        } else if (profile.role == "mitra") {
          Get.offAllNamed(mitraRoute);
        } else {
          Get.snackbar("Error", "Invalid Role");
        }
      } else {
        Get.snackbar("Error", "Failed to fetch user profile");
      }
    }
    isLoading.value = false;
  }

  void getRole() async {
    final token = await getToken();
  }
}
