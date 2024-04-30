import 'package:flutter/material.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class MyorderScreen extends StatefulWidget {
  const MyorderScreen({super.key});

  @override
  State<MyorderScreen> createState() => _MyorderScreenState();
}

class _MyorderScreenState extends State<MyorderScreen> {
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
      body: DefaultTabController(
          length: 3,
          child: TabBar(
              dividerColor: AppColor.blackcolor,
              indicatorColor: AppColor.blackcolor,
              labelColor: AppColor.blackcolor,
              unselectedLabelColor: AppColor.lightblackcolor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Delivered'),
                Tab(text: 'Canceled'),
              ])),
    );
  }
}
