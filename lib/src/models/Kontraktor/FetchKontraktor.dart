import 'dart:convert';

FetchKontraktor fetchKontraktorModelFromJson(String str) =>
    FetchKontraktor.fromJson(json.decode(str));

String fetchKontraktorModelToJson(FetchKontraktor data) =>
    json.encode(data.toJson());

class FetchKontraktor {
  int? code;
  String? message;
  KontraktorData? data;

  FetchKontraktor({this.code, this.message, this.data});

  FetchKontraktor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new KontraktorData.fromJson(json['data']) : null;
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

class KontraktorData {
  int? id;
  String? nama;
  String? alamat;
  String? logo;
  String? gambar;
  String? deskripsi;
  String? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  KontraktorData(
      {this.id,
      this.nama,
      this.alamat,
      this.logo,
      this.gambar,
      this.deskripsi,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  KontraktorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    alamat = json['alamat'];
    logo = json['logo'];
    gambar = json['gambar'];
    deskripsi = json['deskripsi'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? address;
  String? phone;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.address,
      this.phone,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    address = json['address'];
    phone = json['phone'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
