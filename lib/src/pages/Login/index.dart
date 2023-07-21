import 'package:construction_app/src/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:construction_app/src/routes/constant.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginController loginCon = Get.put(LoginController());

  bool validate = false;
  bool inHiddenPass = true;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    color: Color(0xffFFF9DF),
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Selamat Datang di layanan aplikasi konstruksi kami! Senang dapat menjadi bagian dari proyek konstruksi anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffFFD8AC7E),
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xffFFD8AC7E),
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 25,
              width: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: Color(0xffFFD8AC7E),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffFFD9D9D9)),
                child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input Username',
                      hintStyle: TextStyle(color: Color(0xffFFD8AC7E)),
                      filled: true,
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffFFD9D9D9)),
                  child: TextField(
                    obscureText: _isHidden,
                    controller: password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Password',
                        hintStyle: TextStyle(color: Color(0xffFFD8AC7E)),
                        filled: true),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xff7C7EA9),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (username.text.isEmpty || password.text.isEmpty) {
                  setState(() {
                    validate = true;
                  });
                } else {
                  await loginCon.loginUser(username.text, password.text);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 17, right: 17),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffD8AC7E),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 125,
                  height: 1.5,
                  decoration: BoxDecoration(color: yellowMain),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'OR',
                  style: TextStyle(color: yellowMain),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 125,
                  height: 1.5,
                  decoration: BoxDecoration(color: yellowMain),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffFFD9D9D9),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0xffD8AC7E),
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
