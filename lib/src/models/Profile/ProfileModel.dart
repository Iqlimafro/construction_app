import 'dart:convert';

Profile profileModelFromJson(String str) => 
  Profile.fromJson(json.decode(str));

String profileModelToJson(Profile data) => json.encode(data.toJson());

class Profile {
  int? id;
  String? username;
  String? address;
  String? phone;
  String? role;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.username,
      this.address,
      this.phone,
      this.role,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
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
