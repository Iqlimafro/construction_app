import 'package:construction_app/src/services/api.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/models/Profile/ProfileModel.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var user = Profile().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading;
  }

  Future getuser() async {
    try {
      isLoading(true);
      var res = await ApiService().fetchUserProfile();
      if (res != null) {
        user.value = res;
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
