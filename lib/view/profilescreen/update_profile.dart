import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_button.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/common/global_textfield.dart';
import 'package:furnitureapp/view/profilescreen/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile extends StatefulWidget {
  final name;
  UpdateProfile({super.key, this.name});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController namecontroller = new TextEditingController();

  String? Token;
  @override
  void initState() {
    namecontroller.text = widget.name;
    super.initState();
  }

  Future<void> updatepro(String Name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }
    try {
      http.Response response = await http.put(
        Uri.parse(
            'https://typescript-al0m.onrender.com/api/user/update-profile'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'name': Name,
        }),
      );

      log(response.statusCode.toString());
      log("bodyyyy ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('profile Updateee!!');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('profile Updateee!!'),
          ),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
            (route) => false);
        // Navigator.pop(context);
      } else {
        log('Fail!');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Center(
            child: Container(
              height: 327.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.5,
                  ),
                ],
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  GlobalTextfield(
                    text: "Name",
                    Tcontroller: namecontroller,
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GlobalButton(
                      text: "Update",
                      onPressed: () {
                        updatepro(namecontroller.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
