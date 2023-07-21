import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailKontraktor extends StatefulWidget {
  const DetailKontraktor({super.key});

  @override
  State<DetailKontraktor> createState() => _DetailKontraktor();
}

class _DetailKontraktor extends State<DetailKontraktor> {
  var id = Get.arguments[0];
  var nama = Get.arguments[1];
  var alamat = Get.arguments[2];
  var logo = Get.arguments[3];
  var gambar = Get.arguments[4];
  var deskripsi = Get.arguments[5];
  var userId = Get.arguments[6];

  getAtribute() async {
    setKontraktor(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.network(
                  logo,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 200, right: 20),
                child: Container(
                  height: 370,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          deskripsi,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Alamat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          alamat,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Lakukan Pemesanan',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () =>
                                    Get.toNamed(order, arguments: [id]),
                                child: Container(
                                  width: 40,
                                  child: Icon(
                                    Icons.cloud_upload_sharp,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
