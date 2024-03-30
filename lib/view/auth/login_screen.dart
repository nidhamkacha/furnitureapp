import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/demo_textfield.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/common/global_textfield.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/onbording/onbording_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        // GlobalTextField(
                        //   hinttext: "Email",
                        //   iconsecond: Icon(Icons.expand_more),
                        // ),
                        DemoTextField(),
                        GlobalTextField(
                          hinttext: "password",
                          iconsecond: Icon(Icons.remove_red_eye_outlined),
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
                            onPressed: () => OnbordingScreen(),
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
                                  builder: (context) => OnbordingScreen(),
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
