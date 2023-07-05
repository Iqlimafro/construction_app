import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/controllers/OrderController.dart';
import 'package:construction_app/src/controllers/TrackingController.dart';
import 'package:construction_app/src/controllers/UploadController.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // var id = Get.arguments[0];
  TextEditingController nama = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController layanan = TextEditingController();
  OrderController order = Get.put(OrderController());
  TrackingController track = Get.put(TrackingController());
  final upload = Get.put(UploadController());

  String? kontraktorId;

  String uploadImageUrl = '';
  String diproses = 'Di Proses';

  bool validate = false;

  getAtribute() async {
    kontraktorId = await getKontraktor();

    String? kontraktor;

    setState(() {
      kontraktor = kontraktorId;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAtribute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 65, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 90,
              ),
              Container(
                width: 70,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'User Order',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Silahkan lengkapi form dibawah',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              'Nama',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffFFFFFF),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: nama,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Input Nama',
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    filled: true,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              'No. Telp',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffFFFFFF),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: telp,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Input No. Telp',
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    filled: true,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              'Alamat',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffFFFFFF),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: alamat,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Input Alamat',
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    filled: true,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              'Layanan',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffFFFFFF),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: layanan,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Input Layanan',
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    filled: true,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Upload Gambar',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () async {
              upload.imageUrl.value =
                  await upload.uploadImage(ImageSource.gallery);
            },
            child: Obx(() {
              final imageUrl = upload.imageUrl.value;

              if (imageUrl == '') {
                return Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      Icons.upload_file,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                );
              }
            }),
          ),
          SizedBox(
            height: 30,
          ),
          Text(kontraktorId.toString()),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: InkWell(
                onTap: () async {
                  // kontraktorId;
                  // getKontraktor();
                  if (nama.text.isEmpty ||
                      telp.text.isEmpty ||
                      alamat.text.isEmpty ||
                      layanan.text.isEmpty) {
                    // kontraktorId;
                    setState(() {
                      validate = true;
                    });
                  } else {
                    await order.addOrder(
                        kontraktorId.toString(),
                        nama.text,
                        telp.text,
                        alamat.text,
                        layanan.text,
                        upload.imageUrl.toString());
                    // track.addTracking(diproses, getOrder().toString());
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: yellowMain),
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(() {
                      return order.isLoading.value == true
                          ? CircularProgressIndicator(
                              color: whiteColor,
                            )
                          : Text(
                              'Buat Pesanan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            );
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
