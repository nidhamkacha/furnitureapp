import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
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
            SizedBox(
              height: 36.h,
            ),
            Container(
              height: 82.h,
              child: TabBar(
                indicatorColor: Colors.transparent,
                controller: _controller,
                unselectedLabelColor: Colors.red,
                // indicator: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10), // Adjust as needed
                //   // color: Colors.green, // Indicator color
                // ),
                tabs: [
                  Container(
                    height: 69.h,
                    child: Container(
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
                                  ? AppColor.whitecolor
                                  : AppColor.blackcolor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _controller.index == 0
                                  ? AppColor.blackcolor
                                  : AppColor.lightblackcolor,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Popular',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _controller.index == 0
                                      ? AppColor.blackcolor
                                      : AppColor.lightblackcolor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 69.h,
                    child: Container(
                      width: 53,
                      child: Column(
                        children: [
                          Container(
                            height: 42.h,
                            width: 42.w,
                            child: Image.asset(
                              'assets/images/chair.png',
                              scale: 3,
                              color: _controller.index == 1
                                  ? AppColor.whitecolor
                                  : AppColor.blackcolor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _controller.index == 1
                                  ? AppColor.blackcolor
                                  : AppColor.extralightblack,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Chair',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _controller.index == 1
                                      ? AppColor.blackcolor
                                      : AppColor.extralightblack,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 69.h,
                    child: Container(
                      width: 53,
                      child: Column(
                        children: [
                          Container(
                            height: 42.h,
                            width: 42.w,
                            child: Image.asset(
                              'assets/images/table.png',
                              scale: 3,
                              color: _controller.index == 2
                                  ? AppColor.whitecolor
                                  : AppColor.blackcolor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _controller.index == 2
                                  ? AppColor.blackcolor
                                  : AppColor.extralightblack,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Table',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _controller.index == 2
                                      ? AppColor.blackcolor
                                      : AppColor.extralightblack,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 69.h,
                    child: Container(
                      width: 53,
                      child: Column(
                        children: [
                          Container(
                            height: 42.h,
                            width: 42.w,
                            child: Image.asset(
                              'assets/images/armchair.png',
                              scale: 3,
                              color: _controller.index == 3
                                  ? AppColor.whitecolor
                                  : AppColor.blackcolor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _controller.index == 3
                                  ? AppColor.blackcolor
                                  : AppColor.extralightblack,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Sofa',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _controller.index == 3
                                      ? AppColor.blackcolor
                                      : AppColor.extralightblack,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 69.h,
                    child: Container(
                      width: 53,
                      child: Column(
                        children: [
                          Container(
                            height: 42.h,
                            width: 42.w,
                            child: Image.asset(
                              'assets/images/bed.png',
                              scale: 3,
                              color: _controller.index == 4
                                  ? AppColor.whitecolor
                                  : AppColor.blackcolor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _controller.index == 4
                                  ? AppColor.blackcolor
                                  : AppColor.extralightblack,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Bed',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: _controller.index == 4
                                      ? AppColor.blackcolor
                                      : AppColor.extralightblack,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _controller,
              children: [
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
