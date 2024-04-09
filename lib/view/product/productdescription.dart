import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductDescription extends StatefulWidget {
  final String? productname;
  final String? productprice;
  final String? productimg;
  const ProductDescription(
      {super.key, this.productname, this.productprice, this.productimg});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                    height: 455.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.productimg.toString()),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.whitecolor),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    text: widget.productname,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalText(
                        text: widget.productprice,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      InputQty(
                        minVal: 1,
                        maxVal: 100,
                        initVal: 1,
                        qtyFormProps: QtyFormProps(enableTyping: false),
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
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColor.yellowcolor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GlobalText(
                        text: '4.5',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      GlobalText(
                        text: '(50 Reviews)',
                        fontSize: 14.sp,
                        color: AppColor.lightblackcolor,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GlobalText(
                    text:
                        'Minimal Stand is made of by natural wood. The \ndesign that is very simple and minimal. This is \ntruly one of the best furnitures in any family for \nnow. With 3 different colors, you can easily \nselect the best match for your home. ',
                    fontSize: 13.sp,
                    color: AppColor.lightblackcolor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 56.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.extralightblack,
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Favorite Page Link
                          },
                          icon: Icon(
                            color: AppColor.blackcolor,
                            Icons.bookmark_border_outlined,
                          ),
                          color: AppColor.lightblackcolor,
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Container(
                        width: 250.w,
                        child: GlobalButton(
                          onPressed: () {},
                          text: 'Add To Cart',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
