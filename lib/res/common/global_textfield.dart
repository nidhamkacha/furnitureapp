import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:google_fonts/google_fonts.dart';


class GlobalTextField extends StatelessWidget {
  final Icon? iconfirst;
  final Icon? iconsecond;
  final String? hinttext;
  const GlobalTextField(
      {super.key, this.iconfirst, this.iconsecond, this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(15)),
        child: TextField(
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: AppColor.blackcolor,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            prefixIcon: iconfirst,
            suffixIcon: iconsecond,
            // focusedBorder:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hinttext,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
                color: Colors.black38,
                
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}