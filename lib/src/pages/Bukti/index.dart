import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bukti extends StatefulWidget {
  const Bukti({super.key});

  @override
  State<Bukti> createState() => _BuktiState();
}

class _BuktiState extends State<Bukti> {
  var uploadBukti = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            uploadBukti,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
