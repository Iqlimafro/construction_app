import 'dart:convert';

Login loginFromJson(String str) =>
    Login.fromJson(json.decode(str));

class Login {
  String? message;
  String? accessToken;

  Login({this.message, this.accessToken});

  Login.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    return data;
  }
}
