import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/controllers/OrderController.dart';
import 'package:construction_app/src/controllers/RiwayatController.dart';
import 'package:construction_app/src/controllers/usercontroller.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  // OrderController order = Get.put(OrderController());
  UserController username = Get.put(UserController());
  RiwayatController riwayat = Get.put(RiwayatController());

  @override
  void initState() {
    riwayat.getRiwayat(getUser().toString());
    super.initState();
    username.getuser().then((value) {
      riwayat.getRiwayat(username.user.value.id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: yellosSecond,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Order Saya',
                    style: poppinsTextStyle.copyWith(
                        fontSize: 20,
                        color: whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                height: 130,
                child: Obx(() {
                  if (riwayat.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: riwayat.user!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: InkWell(
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0, 7))
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        riwayat.user[index].image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          riwayat.user[index].nama!,
                                          style: poppinsTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              riwayat.user[index].alamat!,
                                              style: poppinsTextStyle.copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          riwayat.user[index].status!,
                                          style: poppinsTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  ;
                })),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
