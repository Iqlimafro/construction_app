import 'package:flutter/material.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 105,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/logo.png'
                            ),fit: BoxFit.fill)),
                  ),
                ),
              ),
          Container(
            height: 300,
            width: 470,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/city1.png'
                ),fit: BoxFit.fill 
                ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Good Construction',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffD4A373)
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Good Investment',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '"Quality construction is an investment for the future"',
                    textAlign: TextAlign.center,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed(loginRoute),
            child: Container(
              height: 60,
              width: 235,
              decoration: BoxDecoration(
                color: Color(0xffFFD4A373),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          )
            ],
            
          ),
          
        ],
      )),
    );
  }
}
