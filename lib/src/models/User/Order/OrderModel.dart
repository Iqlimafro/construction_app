import 'dart:convert';

OrderModel orderFromJson(String str) => 
  OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int? code;
  String? message;
  List<OrderData>? data;

  OrderModel({this.code, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  int? id;
  String? nama;
  String? telp;
  String? alamat;
  String? layanan;
  String? image;
  String? kontraktorId;
  String? createdAt;
  String? updatedAt;
  Kontraktor? kontraktor;

  OrderData(
      {this.id,
      this.nama,
      this.telp,
      this.alamat,
      this.layanan,
      this.image,
      this.kontraktorId,
      this.createdAt,
      this.updatedAt,
      this.kontraktor});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    layanan = json['layanan'];
    image = json['image'];
    kontraktorId = json['kontraktor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kontraktor = json['kontraktor'] != null
        ? new Kontraktor.fromJson(json['kontraktor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['telp'] = this.telp;
    data['alamat'] = this.alamat;
    data['layanan'] = this.layanan;
    data['image'] = this.image;
    data['kontraktor_id'] = this.kontraktorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kontraktor != null) {
      data['kontraktor'] = this.kontraktor!.toJson();
    }
    return data;
  }
}

class Kontraktor {
  int? id;
  String? nama;
  String? alamat;
  String? logo;
  String? gambar;
  String? deskripsi;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Kontraktor(
      {this.id,
      this.nama,
      this.alamat,
      this.logo,
      this.gambar,
      this.deskripsi,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Kontraktor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    alamat = json['alamat'];
    logo = json['logo'];
    gambar = json['gambar'];
    deskripsi = json['deskripsi'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['logo'] = this.logo;
    data['gambar'] = this.gambar;
    data['deskripsi'] = this.deskripsi;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
