import 'dart:convert';

import 'package:construction_app/src/models/User/TrackingModel/TrackingModel.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/User/Order/OrderModel.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:construction_app/src/config/preference.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  var isLoading = false.obs;

  Future<void> addOrder(String kontraktor_id, String user_id, String nama,
      String telp, String alamat, String layanan, String image) async {
    isLoading.value = true;
    final response = await ApiService()
        .addOrder(kontraktor_id, user_id, nama, telp, alamat, layanan, image);
    print(response);
    if (response != null) {
      isLoading.value = false;
      Get.defaultDialog(
          middleText: "Sukses",
          textConfirm: "OK",
          confirmTextColor: whiteColor,
          buttonColor: yellowMain,
          onConfirm: () {
            Get.offAllNamed(userRoute);
          });
    } else {
      Get.defaultDialog(
          middleText: "Gagal",
          textConfirm: "OK",
          confirmTextColor: whiteColor,
          buttonColor: yellowMain,
          onConfirm: () {
            Get.back();
          });
      isLoading.value = false;
    }
  }
}
