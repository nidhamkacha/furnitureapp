import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextfield extends StatefulWidget {
  final String? text;
  final Icon? icon;
  final TextEditingController? Tcontroller;
  const GlobalTextfield({super.key, this.text, this.icon, this.Tcontroller});

  @override
  State<GlobalTextfield> createState() => _GlobalTextfieldState();
}

class _GlobalTextfieldState extends State<GlobalTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.h,
      width: 287.w,
      child: TextField(
        controller: widget.Tcontroller,
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: widget.icon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
