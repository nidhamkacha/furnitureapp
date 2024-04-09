import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
          Align(
              alignment: Alignment.center,
              child: GlobalText(
                text: "Favorites",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              )),
          ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 100.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(items[index]['imagepath']!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              items[index]['productname']!,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              items[index]['price']!,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: AppColor.blackcolor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.local_mall_outlined,
                              color: AppColor.blackcolor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  thickness: 10,
                  color: AppColor.blackcolor,
                );
              },
              itemCount: items.length)
        ],
      ),
    );
  }
}
