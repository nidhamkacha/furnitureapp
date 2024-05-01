import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class Shipping {
  String title;
  String title2;
  String text;

  Shipping({
    required this.title,
    required this.title2,
    required this.text,
  });
}

List<Shipping> shipping = [
  Shipping(
    title: 'Use as the shipping address',
    title2: 'Bruno Fernandes',
    text: '25 rue Robert Latouche, Nice, 06200, Côte \n D’azur, France',
  ),
  Shipping(
    title: 'Use as the shipping address',
    title2: 'Bruno Fernandes',
    text: '25 rue Robert Latouche, Nice, 06200, Côte \n D’azur, France',
  ),
  Shipping(
    title: 'Use as the shipping address',
    title2: 'Bruno Fernandes',
    text: '25 rue Robert Latouche, Nice, 06200, Côte \n D’azur, France',
  ),
];

class _ShippingScreenState extends State<ShippingScreen> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Shipping address',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.blackcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: shipping.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 25.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: isselected,
                                onChanged: (index) {
                                  setState(() {
                                    isselected = index!;
                                  });
                                }),
                            GlobalText(
                              text: shipping[index].title,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 160.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                color: Colors.grey.shade300,
                                blurRadius: 20,
                              ),
                              BoxShadow(
                                  offset: Offset(-1, -1),
                                  color: Colors.grey.shade300,
                                  blurRadius: 20),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalText(
                                      text: shipping[index].title2.toString(),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalText(
                                      text: shipping[index].text.toString(),
                                      fontSize: 16.sp,
                                      color: AppColor.greycolor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Get.to(MySpipiingScreen());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          color: AppColor.blackcolor,
        ),
      ),
    );
  }
}
