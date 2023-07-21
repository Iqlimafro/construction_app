import 'package:construction_app/src/services/api.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/User/Order/RiwayatModel.dart';

class RiwayatController extends GetxController {
  var isLoading = true.obs;
  var user = <Riwayat>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future getRiwayat(String id) async {
    try {
      isLoading(true);
      var res = await ApiService().getOrder(id);
      if (res != null) {
        user.value = res;
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
