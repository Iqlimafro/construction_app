import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderMitra extends StatefulWidget {
  const DetailOrderMitra({super.key});

  @override
  State<DetailOrderMitra> createState() => _DetailOrderMitraState();
}

class _DetailOrderMitraState extends State<DetailOrderMitra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: yellowMain),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Get.offAllNamed(mitraRoute),
                          child: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Detail Order',
                          style: poppinsTextStyle.copyWith(
                              fontSize: 26,
                              color: whiteColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 150, right: 20),
                  child: Container(
                    height: 520,
                    width: 380,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(221, 143, 125, 125),
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Nama Pemesan',
                            style: poppinsTextStyle.copyWith(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset('assets/logo.png'),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Alamat Lengkap',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Layanan : ',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Get disini',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Status : ',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Get disini',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Input Harga',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 37,
                                width: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2,
                                          offset: Offset(0, 1))
                                    ]),
                                child: TextField(
                                    decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input Harga',
                                  hintStyle: TextStyle(color: Colors.black),
                                  filled: true,
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
