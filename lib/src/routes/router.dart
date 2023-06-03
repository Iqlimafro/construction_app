import 'package:construction_app/src/pages/Login/index.dart';
import 'package:construction_app/src/pages/splashScreen.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>>? routes = [
  GetPage(name: initialRoute, page: () => SplashScreen()),
  GetPage(name: loginRoute, page: () => LoginPage())
];
