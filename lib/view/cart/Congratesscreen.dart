import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/bottom_navbar.dart';
import 'package:get/get.dart';

class Congratesscreen extends StatefulWidget {
  const Congratesscreen({super.key});

  @override
  State<Congratesscreen> createState() => _CongratesscreenState();
}

class _CongratesscreenState extends State<Congratesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            SizedBox(
              height: 124.h,
            ),
            Center(
              child: GlobalText(
                text: 'SUCCESS!',
                fontSize: 32.h,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 255.h,
              width: 268.w,
              child: Image.asset(
                'assets/images/Animation - 1712746090351.gif',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalText(
              text:
                  'Your order will be delivered soon.\nThank you for choosing our app!',
              fontSize: 16.h,
              fontWeight: FontWeight.w400,
              color: AppColor.lightblackcolor,
            ),
            SizedBox(
              height: 100.h,
            ),
            GlobalButton(
              onPressed: () {},
              text: 'Track your orders',
            ),
            SizedBox(height: 20.h),
            GlobalButton(
              // onPressed: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => BottomNavbar(),
              //     )),
              onPressed: () {
                Get.to(BottomNavbar());
              },
              text: 'Back to home',
            ),
          ],
        ),
      ),
    );
  }
}
