import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/common/global_textfield.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/cart/checkoutscreen.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 110.w),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          items[index]['imagepath']!),
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
                                SizedBox(
                                  height: 15.h,
                                ),
                                InputQty(
                                  minVal: 01,
                                  maxVal: 100,
                                  initVal: 01,
                                  qtyFormProps:
                                      QtyFormProps(enableTyping: false),
                                  decoration: QtyDecorationProps(
                                      minusBtn: Icon(
                                        Icons.remove,
                                        color: AppColor.blackcolor,
                                      ),
                                      plusBtn: Icon(
                                        Icons.add,
                                        color: AppColor.blackcolor,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ],
                            ),
                            IconButton(
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: AppColor.blackcolor,
                              ),
                              onPressed: () {},
                            ),
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
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalTextfield(
                    text: "Enter Your Promo Code",
                  ),
                  Container(
                    height: 55.h,
                    width: 44.w,
                    child: GlobalButton(
                      text: ">",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: "Total:",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightblackcolor,
                  ),
                  GlobalText(
                    text: "\$12.00",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackcolor,
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GlobalButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => CheckoutScren(),
                    //     ));
                    Get.to(CheckoutScren());
                  },
                  text: "Check Out",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
