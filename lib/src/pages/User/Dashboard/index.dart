import 'package:construction_app/src/config/preference.dart';
import 'package:construction_app/src/controllers/KontraktorController.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final KontraktorController kontraktor = Get.put(KontraktorController());
  late PageController _pageController;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    kontraktor.getKontraktor();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(color: yellosSecond),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_outward_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(
                    Icons.display_settings,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Good Morning, \n User',
                    textAlign: TextAlign.center,
                    style: poppinsTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Icon(
                      Icons.people_sharp,
                      color: Colors.white,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    bool active = pagePosition == activePage;
                    return slider(images, pagePosition, active);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length, activePage),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 350,
              child: Obx(() {
                if (kontraktor.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: kontraktor.kontraktor.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: InkWell(
                            onTap: () {
                              int productId =
                                  kontraktor.kontraktor[index].id ?? 0;
                              setKontraktor(productId.toString());
                              Get.toNamed(detailKontraktorRoute, arguments: [
                                kontraktor.kontraktor[index].id,
                                kontraktor.kontraktor[index].nama,
                                kontraktor.kontraktor[index].alamat,
                                kontraktor.kontraktor[index].logo,
                                kontraktor.kontraktor[index].gambar,
                                kontraktor.kontraktor[index].deskripsi,
                                kontraktor.kontraktor[index].userId ?? ""
                              ]);
                            },
                            child: Container(
                              height: 150,
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
                                          kontraktor.kontraktor[index].logo!,
                                          fit: BoxFit.cover,
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          kontraktor.kontraktor[index].nama!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          kontraktor.kontraktor[index].alamat!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      });
                }
              }),
            )
          ],
        ),
      )),
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }

  imageAnimation(PageController animation, images, pagePosition) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);

        return SizedBox(
          width: 200,
          height: 200,
          child: widget,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.network(images[pagePosition]),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
