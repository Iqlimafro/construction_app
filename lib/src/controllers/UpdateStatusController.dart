import 'package:construction_app/src/config/constant_config.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  var isLoading = false.obs;

  Future<void> updateStatus(String id, String status, String harga) async {
    isLoading.value = true;
    final response = await ApiService().updateStatus(id, status, harga);
    if (response != null) {
      isLoading.value = false;
      getToast(response.message!);
      Get.offAllNamed(mitraRoute);
    } else {
      isLoading.value = false;
    }
  }
}
