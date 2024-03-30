import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoTextField extends StatefulWidget {
  const DemoTextField({super.key});

  @override
  State<DemoTextField> createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.h,
      width: 287.w,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
