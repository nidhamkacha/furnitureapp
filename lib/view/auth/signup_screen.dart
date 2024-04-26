import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/common/global_textfield.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/auth/login_screen.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController namecontroller = new TextEditingController();
TextEditingController emailcontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();
TextEditingController confirmpasswordcontroller = new TextEditingController();

class _SignupScreenState extends State<SignupScreen> {
  Future<void> signupScreen(String email, String password, String name) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://typescript-al0m.onrender.com/api/user/signUp"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            'name': name,
            'email': email,
            'password': password,
            'confirmPassword': password,
          }));
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Sign Up!");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false);
      } else {
        log('Failde to Signin');
      }
    } catch (e) {
      log(e.toString());
    }
  }
  // Future<void> login(String email, String password, String name) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('https://typescript-al0m.onrender.com/api/user/signUp'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode({
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //         'confirmPassword': password,
  //       }),
  //     );

  //     log(response.statusCode.toString());

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // var data = jsonDecode(response.body);
  //       log('Sign up!');
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (_) => const SignInScreen()),
  //           (route) => false);
  //     } else {
  //       log('fail!');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

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
                  text: "WELCOME",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Center(
                  child: Container(
                    height: 520.h,
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
                          text: "Name",
                          Tcontroller: namecontroller,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Email",
                          Tcontroller: emailcontroller,
                          icon: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Password",
                          Tcontroller: passwordcontroller,
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Confirm Password",
                          Tcontroller: confirmpasswordcontroller,
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GlobalButton(
                            text: "Sign Up",
                            onPressed: () {
                              if (passwordcontroller.text ==
                                  confirmpasswordcontroller.text) {
                                signupScreen(
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                    namecontroller.text);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlobalText(
                              text: "Already have account?",
                              color: AppColor.lightblackcolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: GlobalText(
                                text: "Sign in",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
