import 'dart:convert';

KontraktorModel kontraktorModelFromJson(String str) =>
    KontraktorModel.fromJson(json.decode(str));

String kontraktorModelToJson(KontraktorModel data) =>
    json.encode(data.toJson());

class KontraktorModel {
  int? code;
  String? message;
  List<Data>? data;

  KontraktorModel({this.code, this.message, this.data});

  KontraktorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? nama;
  String? alamat;
  String? logo;
  String? gambar;
  String? deskripsi;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.nama,
      this.alamat,
      this.logo,
      this.gambar,
      this.deskripsi,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
