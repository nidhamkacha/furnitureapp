import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/model.dart';
import 'package:furnitureapp/model/notificationmodel.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // var items = [
  //   {
  //     'productname': 'Black Simple Lamp',
  //     'title': 'Your order #123456789 has been shipped successfully',
  //     'imagepath': 'assets/images/lamp.png'
  //   },
  //   {
  //     'productname': 'Minimal Stand',
  //     'title': 'Your order #123456789 has been shipped successfully',
  //     'imagepath': 'assets/images/minimalstand.png'
  //   },
  //   {
  //     'productname': 'Coffee Chair',
  //     'title': 'Your order #123456789 has been shipped successfully',
  //     'imagepath': 'assets/images/coffechair.png'
  //   },
  //   {
  //     'productname': 'Simple Desk',
  //     'title': 'Discover hot sale furnitures this week.',
  //     'imagepath': 'assets/images/simpledesk.png'
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: notificationdata.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black26,
                        width: 0.7,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.h,
                        child: Image.asset(
                          notificationdata[index].imgpath!,
                          scale: 3,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: notificationdata[index].title!,
                              color: AppColor.blackcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 5.h),
                            GlobalText(
                              text: notificationdata[index].desc!,
                              color: AppColor.lightblackcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 5.h),
                            GlobalText(
                              text: notificationdata[index].status!,
                              color: notificationdata[index].status == 'New'
                                  ? AppColor.greencolor
                                  : AppColor.redcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
