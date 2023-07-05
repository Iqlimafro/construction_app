import 'package:construction_app/src/pages/Login/index.dart';
import 'package:construction_app/src/pages/Mitra/Dashboard/index.dart';
import 'package:construction_app/src/pages/User/Dashboard/index.dart';
import 'package:construction_app/src/pages/User/DetailKontraktor/index.dart';
import 'package:construction_app/src/pages/User/Order/index.dart';
import 'package:construction_app/src/pages/splashScreen.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>>? routes = [
  GetPage(name: initialRoute, page: () => SplashScreen()),
  GetPage(name: loginRoute, page: () => LoginPage()),
  GetPage(name: userRoute, page: () => Dashboard()),
  GetPage(name: mitraRoute, page: () => Mitra()),
  GetPage(name: detailKontraktorRoute, page: () => DetailKontraktor()),
  GetPage(name: order, page: () => Order()),
];
