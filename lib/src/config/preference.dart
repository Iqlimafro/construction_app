import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Token", value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("Token");
}

Future removeToken() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("Token");
}

Future setUser(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("id", value);
}

Future getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("id");
}

Future removeUser() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("id");
}

Future setName(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("name", value);
}

Future getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("name");
}

Future removeName() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("name");
}

Future setMitra(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("mitra", value);
}

Future getMitra() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("mitra");
}

Future removeMitra() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("mitra");
}

Future setOrder(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("id", value);
}

Future getOrder() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("id");
}

Future removeOrder() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("id");
}

Future setKontraktor(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("kontraktor_id", value);
}

Future getKontraktor() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("kontraktor_id");
}

Future removeKontraktor() async {
  final SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.remove("kontraktor_id");
}
