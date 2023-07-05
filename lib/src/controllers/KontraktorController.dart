import 'package:construction_app/src/config/preference.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:construction_app/src/services/api.dart';
import 'package:construction_app/src/models/Kontraktor/KontraktorModel.dart';

class KontraktorController extends GetxController {
  var isLoading = true.obs;
  var isLoadingPage = false.obs;
  var kontraktor = <Data>[].obs;

  void getKontraktor() async {
    try {
      isLoading(true);
      var res = await ApiService().getKontraktor();
      if (res != null) {
        kontraktor.value = res;
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
