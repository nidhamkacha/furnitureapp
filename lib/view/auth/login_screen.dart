import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/view/bottom_navbar.dart';
import 'package:furnitureapp/res/common/Global_Textfield.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/auth/signup_screen.dart';
import 'package:furnitureapp/view/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailcontrolller = new TextEditingController();
TextEditingController passwordcontrolller = new TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  Future<void> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://typescript-al0m.onrender.com/api/user/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      log(response.statusCode.toString());
      var data = jsonDecode(response.body);
      log(data['message']);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(data['token']);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        final Token = prefs.getString('token');
        log('login!!');
        if (Token != "") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const BottomNavbar()),
              (route) => false);
        }
      } else {
        log('Fail!');
      }
    } catch (e) {
      log("iji");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64.h,
                ),
                Image.asset(
                  "assets/images/pattern.png",
                  scale: 3,
                ),
                SizedBox(
                  height: 24.h,
                ),
                GlobalText(
                  text: "Hello!",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
                GlobalText(
                  text: "WELCOME BACK",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Center(
                  child: Container(
                    height: 327.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        GlobalTextfield(
                          text: "Email",
                          Tcontroller: emailcontroller,
                          icon: Icon(Icons.expand_more),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Password",
                          Tcontroller: passwordcontroller,
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        GlobalText(
                          text: "Forgot Password",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GlobalButton(
                            text: "Log in",
                            onPressed: () {
                              login(emailcontroller.text,
                                  passwordcontroller.text);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: GlobalText(
                            text: "Sign up",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
