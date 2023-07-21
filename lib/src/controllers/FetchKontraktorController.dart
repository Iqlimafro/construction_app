import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/models/Kontraktor/FetchKontraktor.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:get/get.dart';

class FetchKontraktorController extends GetxController {
  var isLoading = true.obs;
  var fetch = FetchKontraktor().obs;
  @override
  void onInit() {
    super.onInit();
    isLoading;
  }

  Future fetchKontraktor() async {
    try {
      isLoading(true);
      var res = await ApiService().fetchKontraktor();
      if (res != null) {
        fetch.value = res;
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
