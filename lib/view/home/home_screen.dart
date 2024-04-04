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
  List<String> imagepath = [
    'assets/images/lamp.png',
    'assets/images/minimalstand.png',
    'assets/images/coffechair.png',
    'assets/images/simpledesk.png'
  ];
  List<String> productname = [
    'Black Simple Lamp',
    'Minimal Stand',
    'Coffee Chair',
    'Simple Desk'
  ];
  List<String> price = [
    '\$12.00',
    '\$25.00',
    '\$12.00',
    '\$12.00',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Image
                        Image.asset(
                          '',
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
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
