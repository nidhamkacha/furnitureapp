import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/auth/login_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onbording.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90.h,
              ),
              GlobalText(
                text: "MAKE YOUR\nHOME BEAUTIFUL",
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 24.h,
              ),
              GlobalText(
                text:
                    "The best simple place where you \ndiscover most wonderful furniture and \nmake your home beautiful",
                fontSize: 16.sp,
                color: AppColor.lightblackcolor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 432.h,
              ),
              GlobalButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
