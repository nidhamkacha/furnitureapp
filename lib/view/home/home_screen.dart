// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/product/productdescription.dart';

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
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              mainAxisExtent: 256.h,
            ),
            itemCount: items.length, // Provide the number of items
            itemBuilder: (context, index) {
              var e = items[index]; // Get the item at the current index
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDescription(
                        productname: e['productname'],
                        productprice: e['price'],
                        productimg: e['imagepath'],
                      ),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e['imagepath'].toString()),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 8),
                                  child: IconButton(
                                    icon: Icon(Icons.local_mall),
                                    onPressed: () {
                                      // Add your onPressed logic here
                                    },
                                  ),
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
