import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class payment {
  String title;
  String image;

  payment({
    required this.title,
    required this.image,
  });
}

List<payment> Payment = [
  payment(
    title: 'Use as default payment method',
    image: 'assets/images/Payment card.png',
  ),
  payment(
    title: 'Use as default payment method',
    image: 'assets/images/Payment card.png',
  ),
];

class _PaymentScreenState extends State<PaymentScreen> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GlobalText(
            text: 'Payment method',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: Payment.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image(
                      image: AssetImage(Payment[index].image),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isselected,
                          onChanged: (index) {
                            setState(
                              () {
                                isselected = index!;
                              },
                            );
                          },
                        ),
                        GlobalText(
                          text: Payment[index].title,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Get.to(
          //   Addpayment(),
          // );
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
