import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/Kontraktor/KontraktorModel.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:construction_app/src/config/preference.dart';

class AddKontraktorController extends GetxController {
  var isLoading = false.obs;
  var log = Data().obs;

  Future<void> addKontraktor(String name, String alamat, String logo,
      String gambar, String deskripsi) async {
    isLoading = false.obs;
    final response =
        await ApiService().addKontraktor(name, alamat, logo, gambar, deskripsi);
    print(response);
    if (response != null) {
      Get.rawSnackbar(message: "Berhasil Menambahkan");
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
