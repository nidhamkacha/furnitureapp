import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class Delivered extends StatefulWidget {
  const Delivered({super.key});

  @override
  State<Delivered> createState() => _DeliveredState();
}

class Order {
  String orderno, quantity, amt, date, status;

  Order(
      {required this.orderno,
      required this.quantity,
      required this.amt,
      required this.date,
      required this.status});
}

List<Order> orderDetail = [
  Order(
      orderno: "Order No238562312",
      quantity: "03",
      amt: "\$150",
      date: "20/03/2020",
      status: 'Canceled'),
  Order(
      orderno: "Order No238562312",
      quantity: "03",
      amt: "\$150",
      date: "20/03/2020",
      status: 'Processing'),
  Order(
      orderno: "Order No238562312",
      quantity: "03",
      amt: "\$150",
      date: "20/03/2020",
      status: 'Delevered'),
];

class _DeliveredState extends State<Delivered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            SizedBox(
              height: 560.h,
              child: ListView.builder(
                itemCount: orderDetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 25.sp),
                    child: Container(
                      height: 173.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                color: Colors.grey.shade300)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                GlobalText(
                                  text: orderDetail[index].orderno,
                                  fontSize: 16,
                                ),
                                Spacer(),
                                GlobalText(
                                  text: orderDetail[index].date,
                                  color: AppColor.primarycolor,
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffE0E0E0),
                              height: 0,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Quantity: ',
                                    style: TextStyle(
                                        color: AppColor.primarycolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    children: [
                                      TextSpan(
                                        text: orderDetail[index].quantity,
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                RichText(
                                  text: TextSpan(
                                    text: 'Total Amount: ',
                                    style: TextStyle(
                                        color: AppColor.primarycolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    children: [
                                      TextSpan(
                                        text: orderDetail[index].amt,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.blackcolor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 36.h,
                                    width: 78.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.blackcolor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: GlobalText(
                                        text: 'Detail',
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    )),
                                GlobalText(
                                  text: orderDetail[index].status,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: orderDetail[index].status == "Canceled"
                                      ? Color(0xffEB5757)
                                      : orderDetail[index].status == "Delevered"
                                          ? Color(0xff27AE60)
                                          : Color(0xffF2C94C),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
