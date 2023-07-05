import 'package:construction_app/src/models/User/TrackingModel/TrackingModel.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/User/Order/OrderModel.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:construction_app/src/config/preference.dart';
import 'package:http/http.dart' as http;

class TrackingController extends GetxController {
  var isLoading = false.obs;
  var log = TrackingData().obs;

  Future<void> addTracking(String status, String form_id) async {
    isLoading = false.obs;
    final response = await ApiService().addTracking(status, form_id);
    print(response);
    if (response != null) {
      Get.rawSnackbar(message: "Berhasil Menambahkan");
    } else {
      Get.defaultDialog(
          middleText: "Failed",
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
