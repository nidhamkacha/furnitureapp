import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const GlobalButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.blackcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            text ?? "",
            style: GoogleFonts.poppins(
                color: AppColor.whitecolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
