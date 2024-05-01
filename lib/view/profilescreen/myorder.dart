import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/profilescreen/delivered_order.dart';
import 'package:google_fonts/google_fonts.dart';

class MyorderScreen extends StatefulWidget {
  const MyorderScreen({super.key});

  @override
  State<MyorderScreen> createState() => _MyorderScreenState();
}

class _MyorderScreenState extends State<MyorderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerColor: AppColor.blackcolor,
            indicatorColor: AppColor.blackcolor,
            labelColor: AppColor.blackcolor,
            dividerHeight: 0,
            unselectedLabelColor: AppColor.lightblackcolor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Text(
                  'Delivered',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(),
                      fontSize: 18.sp),
                ),
              ),
              Tab(
                icon: Text(
                  'Processing',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(),
                      fontSize: 18.sp),
                ),
              ),
              Tab(
                icon: Text(
                  'Canceled',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(),
                      fontSize: 18.sp),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Delivered(),
                Center(
                  child: Text("It's rainy here"),
                ),
                Center(
                  child: Text("It's sunny here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
