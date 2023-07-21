import 'package:construction_app/src/routes/constant.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
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
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Profile',
                          style: poppinsTextStyle.copyWith(
                              fontSize: 21, color: whiteColor),
                        ),
                      )
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 100,
                            width: 330,
                            decoration: BoxDecoration(
                                color: yellowMain,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1))
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
