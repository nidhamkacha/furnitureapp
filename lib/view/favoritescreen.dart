import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/cart/mycart.dart';

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
          SizedBox(height: 20.h),
          Align(
              alignment: Alignment.center,
              child: GlobalText(
                text: "Favorites",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              )),
          ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 100.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: Text(
                                items[index]['productname']!,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColor.lightblackcolor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: Text(
                                items[index]['price']!,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: AppColor.blackcolor,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              highlightColor: Colors.transparent,
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
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  thickness: 1,
                  color: AppColor.lightblackcolor,
                );
              },
              itemCount: items.length),
          SizedBox(
            height: 160.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GlobalButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MycartScreen(),
                    ));
              },
              text: "Add all to my cart",
            ),
          )
        ],
      ),
    );
  }
}
