// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = [
    {
      'productname': 'Black Simple Lamp',
      'price': '\$12.00',
      'imagepath': 'assets/images/lamp.png'
    },
    {
      'productname': 'Minimal Stand',
      'price': '\$12.00',
      'imagepath': 'assets/images/minimalstand.png'
    },
    {
      'productname': 'Coffee Chair',
      'price': '\$25.00',
      'imagepath': 'assets/images/coffechair.png'
    },
    {
      'productname': 'Simple Desk',
      'price': '\$12.00',
      'imagepath': 'assets/images/simpledesk.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                mainAxisExtent: 256),
            children: [
              ...items.map(
                (e) => Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200.h,
                        width: 157.w,
                        child: Stack(
                          children: [
                            // Image
                            Image.asset(
                              e['imagepath'].toString(),
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            // Cart Icon
                            Positioned(
                              top: 10, // Adjust position as needed
                              right: 10, // Adjust position as needed
                              child: IconButton(
                                icon: Icon(Icons.shopping_cart),
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      GlobalText(
                        text: e['productname'],
                        color: AppColor.lightblackcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      GlobalText(
                        text: e['price'],
                        color: AppColor.blackcolor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
