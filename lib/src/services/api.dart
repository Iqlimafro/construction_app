import 'dart:convert';
import 'dart:developer';
import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/models/Kontraktor/FetchKontraktor.dart';
import 'package:construction_app/src/models/Kontraktor/UpdateModel.dart';
import 'package:construction_app/src/models/MitraOrderModel.dart';
import 'package:construction_app/src/models/User/Order/OrderModel.dart';
import 'package:construction_app/src/models/User/Order/RiwayatModel.dart';
import 'package:construction_app/src/models/User/TrackingModel/TrackingModel.dart';
import 'package:construction_app/src/services/app_exception.dart';
import 'package:construction_app/src/services/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construction_app/src/config/env.dart';
import 'package:construction_app/src/models/Login/LoginModel.dart';
import 'package:construction_app/src/models/Kontraktor/KontraktorModel.dart';
import 'package:construction_app/src/models/Profile/ProfileModel.dart';
import 'package:construction_app/src/services/base_controller.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect with BaseController {
  Future<Login?> loginApp(String username, String password) async {
    dynamic body = ({"username": username, "password": password});
    final response = await BaseClient()
        .post(BASE_URL, '/login', body, "")
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var log = loginFromJson(response);
      return log;
    } else {
      return null;
    }
  }

  Future fetchUserProfile() async {
    final token = await getToken();
    final response =
        await BaseClient().get(BASE_URL, '/user', token).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });

    print(response);
    if (response != null) {
      var profile = profileModelFromJson(response);
      return profile;
    } else {
      return null;
    }
  }

  Future fetchKontraktor() async {
    final token = await getToken();
    final response = await BaseClient()
        .get(BASE_URL, '/fetch-kontraktor', token)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });

    print(response);
    if (response != null) {
      var profile = fetchKontraktorModelFromJson(response);
      return profile;
    } else {
      return null;
    }
  }

  Future getKontraktor() async {
    final response =
        await BaseClient().get(BASE_URL, '/get-mitra', '').catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var kontraktor = kontraktorModelFromJson(response);
      return kontraktor.data;
    } else {
      return null;
    }
  }

  Future getOrder(String id) async {
    final response =
        await BaseClient().get(BASE_URL, '/get-form', '').catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var order = riwayatFromJson(response);
      return order.data;
    } else {
      return null;
    }
  }

  Future<KontraktorModel?> addKontraktor(String name, String alamat,
      String logo, String gambar, String deskripsi) async {
    final token = await getToken();
    dynamic body = ({
      "name": name,
      "alamat": alamat,
      "logo": logo,
      "gambar": gambar,
      "deskripsi": deskripsi
    });
    final response = await BaseClient()
        .post(BASE_URL, '/add-kontraktor', body, token)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var log = kontraktorModelFromJson(response);
      return log;
    } else {
      return null;
    }
  }

  Future<OrderModel?> addOrder(
      String kontraktor_id,
      String user_id,
      String nama,
      String telp,
      String alamat,
      String layanan,
      String image) async {
    dynamic body = ({
      "kontraktor_id": kontraktor_id,
      "user_id": user_id,
      "nama": nama,
      "telp": telp,
      "alamat": alamat,
      "layanan": layanan,
      "image": image,
      "status": 'Menunggu',
      "harga": '0',
      "upload_bukti": 'Menunggu',
    });
    final response = await BaseClient()
        .post(BASE_URL, '/add-form', body, "")
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var log = orderFromJson(response);
      return log;
    } else {
      return null;
    }
  }

  Future mitraorder(String id) async {
    final token = await getToken();
    final response = await BaseClient()
        .get(BASE_URL, '/get-order/kontraktor/$id', "")
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        // print(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var note = mitraorderFromJson(response);
      return note;
    } else {
      return null;
    }
  }

  Future<http.StreamedResponse> uploadGambar(filepath) async {
    var url = Uri.parse('$BASE_URL/add-image');

    http.MultipartRequest request = new http.MultipartRequest("POST", url);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', filepath);

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Image uploaded successfully',
          margin: EdgeInsets.only(top: 5, left: 10, right: 10));
    }

    return response;
  }

  Future<UpdateModel?> updateStatus(
      String id, String status, String harga) async {
    dynamic body = ({"status": status, "status": status, "harga": harga});
    final response = await BaseClient()
        .post(BASE_URL, '/update-form/$id', body, "")
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        Get.rawSnackbar(message: apiError["message"]);
      } else {
        handleError(error);
      }
    });
    print(response);
    if (response != null) {
      var log = updatestatusFromJson(response);
      return log;
    } else {
      return null;
    }
  }
}
