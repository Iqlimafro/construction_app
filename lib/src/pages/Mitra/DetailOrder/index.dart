import 'package:construction_app/src/config/constant_config.dart';
import 'package:construction_app/src/controllers/UpdateStatusController.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderMitra extends StatefulWidget {
  const DetailOrderMitra({super.key});

  @override
  State<DetailOrderMitra> createState() => _DetailOrderMitraState();
}

class _DetailOrderMitraState extends State<DetailOrderMitra> {
  String? selectedStatus;

  var id = Get.arguments[0];
  var nama = Get.arguments[1];
  var telp = Get.arguments[2];
  var alamat = Get.arguments[3];
  var layanan = Get.arguments[4];
  var image = Get.arguments[5];
  var status = Get.arguments[6];
  var harga = Get.arguments[7];
  var uploadBukti = Get.arguments[8];
  late TextEditingController hargaCon;
  UpdateStatusController update = Get.put(UpdateStatusController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hargaCon = TextEditingController(text: harga);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(
                      left: 20, top: 150, right: 20, bottom: 12),
                  child: Container(
                    height: 670,
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
                            nama,
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
                                InkWell(
                                  onTap: () => Get.toNamed(gambar,
                                      arguments: [uploadBukti]),
                                  child: Container(
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
                                    child: Image.network(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  alamat,
                                  style: poppinsTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                telp,
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
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
                                layanan,
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
                                status,
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
                              Row(
                                children: [
                                  Container(
                                    height: 37,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 2,
                                              offset: Offset(0, 1))
                                        ]),
                                    child: TextField(
                                        controller: hargaCon,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Input Harga',
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          filled: true,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Rp.${harga}',
                                    style: poppinsTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Update Status',
                                style: poppinsTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              DropdownButtonFormField<String>(
                                value: selectedStatus,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: "Di Tinjau",
                                    child: Text("Di Tinjau"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Dikerjakan",
                                    child: Text("Dikerjakan"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Menunggu Pembayaran",
                                    child: Text("Menunggu Pembayaran"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Selesai",
                                    child: Text("Selesai"),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  hintText: "Update Status",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () => Get.toNamed(bukti,
                                      arguments: [uploadBukti]),
                                  child: Container(
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black87,
                                              blurRadius: 2,
                                              offset: Offset(0, 1))
                                        ]),
                                    child: Image.network(
                                      uploadBukti,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              InkWell(
                                onTap: () {
                                  update.updateStatus(id.toString(),
                                      selectedStatus!, hargaCon.text);
                                },
                                child: Container(
                                  width: 320,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2, offset: Offset(0, 1))
                                      ],
                                      color: yellowMain,
                                      border: Border.all(color: Colors.black)),
                                  child: Center(
                                      child: Text(
                                    'Update',
                                    style: poppinsTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              )
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
