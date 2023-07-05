import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Mitra extends StatefulWidget {
  const Mitra({super.key});

  @override
  State<Mitra> createState() => _MitraState();
}

class _MitraState extends State<Mitra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                'Mitra'
              ),
            )
          ],
        )
        ),
    );
  }
}