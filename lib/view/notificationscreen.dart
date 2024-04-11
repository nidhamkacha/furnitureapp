import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var items = [
    {
      'productname': 'Black Simple Lamp',
      'title': 'Your order #123456789 has been shipped successfully',
      'imagepath': 'assets/images/lamp.png'
    },
    {
      'productname': 'Minimal Stand',
      'title': 'Your order #123456789 has been shipped successfully',
      'imagepath': 'assets/images/minimalstand.png'
    },
    {
      'productname': 'Coffee Chair',
      'title': 'Your order #123456789 has been shipped successfully',
      'imagepath': 'assets/images/coffechair.png'
    },
    {
      'productname': 'Simple Desk',
      'title': 'Discover hot sale furnitures this week.',
      'imagepath': 'assets/images/simpledesk.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notificaton',
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
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      //                   <--- left side
                      color: Colors.black26,
                      width: 0.7,
                    ),
                  )),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        child: Image.asset(
                          items[index]['imagepath']!,
                          scale: 2,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  // Text(
                                  //   //AppText.notificatioinscreen[index],
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.w600,
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff909090),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 35,
                                      ),

                                      // Text(AppText.notificationtext[index],),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.highlight_remove_outlined),
                                  // Text(
                                  //   AppText.notificationtext[index],
                                  // ),
                                ],
                              ),
                            ],
                          ),
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
