import 'package:get/get.dart';
import 'package:construction_app/src/models/MitraOrderModel.dart';

import '../services/api.dart';

class MitraORderController extends GetxController{
  var isLoading = true.obs;
  var order = MitraOrderModel().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future ordermitra(String id) async {
    try {
      isLoading(true);
      var res = await ApiService().mitraorder(id);
      if (res != null) {
        order.value = res;
      } else {}
    } finally {
      isLoading(false);
    }
  }
}