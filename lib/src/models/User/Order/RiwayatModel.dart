import 'dart:convert';

RiwayatModel riwayatFromJson(String str) =>
    RiwayatModel.fromJson(json.decode(str));

String riwayatModelToJson(RiwayatModel data) => json.encode(data.toJson());

class RiwayatModel {
  int? code;
  String? message;
  List<Riwayat>? data;

  RiwayatModel({this.code, this.message, this.data});

  RiwayatModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Riwayat>[];
      json['data'].forEach((v) {
        data!.add(new Riwayat.fromJson(v));
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

class Riwayat {
  int? id;
  String? nama;
  String? telp;
  String? alamat;
  String? layanan;
  String? image;
  String? status;
  String? harga;
  String? uploadBukti;
  String? kontraktorId;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Riwayat(
      {this.id,
      this.nama,
      this.telp,
      this.alamat,
      this.layanan,
      this.image,
      this.status,
      this.harga,
      this.uploadBukti,
      this.kontraktorId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    layanan = json['layanan'];
    image = json['image'];
    status = json['status'];
    harga = json['harga'];
    uploadBukti = json['upload_bukti'];
    kontraktorId = json['kontraktor_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['telp'] = this.telp;
    data['alamat'] = this.alamat;
    data['layanan'] = this.layanan;
    data['image'] = this.image;
    data['status'] = this.status;
    data['harga'] = this.harga;
    data['upload_bukti'] = this.uploadBukti;
    data['kontraktor_id'] = this.kontraktorId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
