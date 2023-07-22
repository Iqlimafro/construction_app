import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/controllers/FetchKontraktorController.dart';
import 'package:construction_app/src/controllers/MitraOrderController.dart';
import 'package:construction_app/src/controllers/usercontroller.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Mitra extends StatefulWidget {
  const Mitra({super.key});

  @override
  State<Mitra> createState() => _MitraState();
}

class _MitraState extends State<Mitra> {
  UserController user = Get.put(UserController());
  MitraORderController order = Get.put(MitraORderController());
  FetchKontraktorController fetch = Get.put(FetchKontraktorController());

  @override
  void initState() {
    super.initState();
    fetch.fetchKontraktor().then((value) {
      order.ordermitra(fetch.fetch.value.data!.id.toString());
    });
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
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: yellowMain),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Center(
                      child: Image.asset('assets/logo.png'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 10, top: 15),
                      child: InkWell(
                        onTap: () => Get.toNamed(profile),
                        child: Icon(
                          Icons.person_2_sharp,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Text(
                            'Profile',
                            style: poppinsTextStyle.copyWith(
                                fontSize: 14, color: whiteColor),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Obx(() {
                            if (fetch.isLoading.value) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Text(
                              'Hello ${fetch.fetch.value.data!.nama}',
                              style: poppinsTextStyle.copyWith(
                                  fontSize: 13, color: whiteColor),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 200, right: 20),
                child: SingleChildScrollView(
                  child: Container(
                    height: 480,
                    width: 380,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              blurRadius: 2,
                              offset: const Offset(0, 1))
                        ]),
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      Obx(() {
                        if (order.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: order.order.value.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: InkWell(
                                  onTap: () =>
                                      Get.toNamed(detailOrderMitra, arguments: [
                                    order.order.value.data![index].id,
                                    order.order.value.data![index].nama,
                                    order.order.value.data![index].telp,
                                    order.order.value.data![index].alamat,
                                    order.order.value.data![index].layanan,
                                    order.order.value.data![index].image,
                                    order.order.value.data![index].status,
                                    order.order.value.data![index].harga,
                                    order.order.value.data![index].uploadBukti,
                                  ]),
                                  child: Container(
                                    height: 100,
                                    width: 270,
                                    decoration: BoxDecoration(
                                        color: yellowMain,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 2,
                                              offset: const Offset(0, 1))
                                        ]),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Image.network(
                                            order.order.value.data![index]
                                                .image!,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 18),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Nama :',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    order.order.value
                                                        .data![index].nama!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Alamat :',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    order.order.value
                                                        .data![index].alamat!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Status :',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    order.order.value
                                                        .data![index].status!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                    ]),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
