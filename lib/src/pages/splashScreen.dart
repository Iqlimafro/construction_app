import 'package:construction_app/src/pages/Home/index.dart';
import 'package:construction_app/src/pages/Login/index.dart';
import 'package:construction_app/src/pages/Mitra/Dashboard/index.dart';
import 'package:construction_app/src/pages/Mitra/DetailOrder/index.dart';
import 'package:construction_app/src/pages/User/Dashboard/index.dart';
import 'package:construction_app/src/pages/User/DetailKontraktor/index.dart';
import 'package:construction_app/src/pages/User/MyOrder/index.dart';
import 'package:construction_app/src/pages/User/Order/index.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return DetailOrderMitra();
  }
}
