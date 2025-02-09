import 'dart:convert';

OrderModel orderFromJson(String str) => 
  OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int? code;
  String? message;
  Data? data;

  OrderModel({this.code, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? kontraktorId;
  String? nama;
  String? telp;
  String? alamat;
  String? layanan;
  String? image;
  String? status;
  String? harga;
  String? uploadBukti;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.kontraktorId,
      this.nama,
      this.telp,
      this.alamat,
      this.layanan,
      this.image,
      this.status,
      this.harga,
      this.uploadBukti,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    kontraktorId = json['kontraktor_id'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    layanan = json['layanan'];
    image = json['image'];
    status = json['status'];
    harga = json['harga'];
    uploadBukti = json['upload_bukti'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['kontraktor_id'] = this.kontraktorId;
    data['nama'] = this.nama;
    data['telp'] = this.telp;
    data['alamat'] = this.alamat;
    data['layanan'] = this.layanan;
    data['image'] = this.image;
    data['status'] = this.status;
    data['harga'] = this.harga;
    data['upload_bukti'] = this.uploadBukti;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
