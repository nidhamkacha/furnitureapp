import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/common/global_textfield.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Email",
                          icon: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Password",
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalTextfield(
                          text: "Confirm Password",
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GlobalButton(
                            text: "Sign Up",
                            onPressed: () => Navigator.pop(context),
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
