import 'dart:convert';

TrackingModel trackingFromJson(String str) => 
    TrackingModel.fromJson(json.decode(str));

String trackingModelToJson(TrackingModel data) =>
    json.encode(data.toJson());

class TrackingModel {
  int? code;
  String? message;
  List<TrackingData>? data;

  TrackingModel({this.code, this.message, this.data});

  TrackingModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TrackingData>[];
      json['data'].forEach((v) {
        data!.add(new TrackingData.fromJson(v));
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

class TrackingData {
  int? id;
  String? status;
  String? formId;
  String? createdAt;
  String? updatedAt;
  Form? form;

  TrackingData(
      {this.id,
      this.status,
      this.formId,
      this.createdAt,
      this.updatedAt,
      this.form});

  TrackingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    formId = json['form_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    form = json['form'] != null ? new Form.fromJson(json['form']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['form_id'] = this.formId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.form != null) {
      data['form'] = this.form!.toJson();
    }
    return data;
  }
}

class Form {
  int? id;
  String? nama;
  String? telp;
  String? alamat;
  String? layanan;
  String? image;
  String? kontraktorId;
  String? createdAt;
  String? updatedAt;

  Form(
      {this.id,
      this.nama,
      this.telp,
      this.alamat,
      this.layanan,
      this.image,
      this.kontraktorId,
      this.createdAt,
      this.updatedAt});

  Form.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    layanan = json['layanan'];
    image = json['image'];
    kontraktorId = json['kontraktor_id'];
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
    data['kontraktor_id'] = this.kontraktorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
