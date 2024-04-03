import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        body: Column(
          children: [
            SizedBox(
              height: 52.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Container(
                height: 48.h,
                width: 327.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 35,
                          color: AppColor.lightblackcolor,
                        )),
                    Column(
                      children: [
                        GlobalText(
                          text: "MAKE HOME",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColor.lightblackcolor,
                        ),
                        GlobalText(
                          text: "BEAUTIFUL",
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: AppColor.lightblackcolor,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 35,
                        color: AppColor.lightblackcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 69.h,
              child: TabBar(controller: _controller, tabs: [
                Container(
                  width: 53,
                  child: Column(
                    children: [
                      Container(
                        height: 42.h,
                        width: 42.w,
                        child: Image.asset(
                          'assets/images/popular.png',
                          scale: 3,
                          color: _controller.index == 0
                              ? AppColor.blackcolor
                              : AppColor.lightblackcolor,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
