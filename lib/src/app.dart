import 'package:construction_app/src/routes/constant.dart';
import 'package:construction_app/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lacons',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xffD4A373)
        )
      ),
      initialRoute: initialRoute,
      getPages: routes,
    );
  }
}