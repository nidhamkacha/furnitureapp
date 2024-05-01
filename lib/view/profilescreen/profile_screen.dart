import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/model/profilemodel.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/auth/login_screen.dart';
import 'package:furnitureapp/view/profilescreen/myorder.dart';
import 'package:furnitureapp/view/profilescreen/myreviewscreen.dart';
import 'package:furnitureapp/view/profilescreen/paymentscreen.dart';
import 'package:furnitureapp/view/profilescreen/settingscreen.dart';
import 'package:furnitureapp/view/profilescreen/shippingscreen.dart';
import 'package:furnitureapp/view/profilescreen/update_profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class GetProfile {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? profileImage;
  bool? isAdmin;
  bool? isDelete;
  int? v;

  GetProfile({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.profileImage,
    this.isAdmin,
    this.isDelete,
    this.v,
  });

  factory GetProfile.fromJson(Map<String, dynamic> json) {
    return GetProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      profileImage: json['profileImage'],
      isAdmin: json['isAdmin'],
      isDelete: json['isDelete'],
      v: json['v'],
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<GetProfile>? futureProfile;
  String? Token;
  String? name;
  String? email;

  // final box = GetStorage();
  @override
  void initState() {
    futureProfile = fetchProfile();
    super.initState();
  }

  _getRequests() async {
    setState(() {});
  }

  Future<void> delateProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('token');

    log(Token.toString());
    final response = await http.delete(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/delete-profile'),
      headers: {'Authorization': 'Bearer $Token'},
    );

    log(response.body);
    if (response.statusCode == 200) {
      log(response.body);

      prefs.remove('token');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<GetProfile> fetchProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('token');

    log(Token.toString());
    final response = await http.get(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/get-profile'),
      headers: {'Authorization': 'Bearer $Token'},
    );
    final data = jsonDecode(response.body);
    setState(() {
      name = data['name'];
      email = data['email'];
    });
    // pass = data['confirmPassword'];
    // box.write('name', data['name']);
    log(name.toString());
    if (response.statusCode == 200) {
      log(response.body);
      Get.snackbar('Message', 'Load data.....!',
          backgroundColor: Colors.yellow,
          icon: Icon(Icons.abc),
          snackPosition: SnackPosition.BOTTOM);
      Get.defaultDialog(
        actions: [],
        title: 'text',
      );
      return GetProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            Container(
              height: 82.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    radius: 50.w,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      name == null
                          ? CircularProgressIndicator()
                          : Text(
                              name!,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                      name == null
                          ? CircularProgressIndicator()
                          : Text(
                              email!,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => UpdateProfile(
                        //         name: name,
                        //       ),
                        //     ));
                        Get.to(() => UpdateProfile(name: name));
                      },
                      icon: Icon(Icons.edit)),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      onPressed: () {
                        delateProfile();
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: profiledata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    index == 0
                        ? Get.to(MyorderScreen())
                        : index == 1
                            ? Get.to(ShippingScreen())
                            : index == 2
                                ? Get.to(PaymentScreen())
                                : index == 3
                                    ? Get.to(Myreview())
                                    : index == 4
                                        ? Get.to((Settingscreen()))
                                        : null;
                  },
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    child: ListTile(
                      title: GlobalText(
                        text: profiledata[index].title!,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: GlobalText(
                        text: profiledata[index].subtitle!,
                        fontSize: 12.sp,
                        color: AppColor.lightblackcolor,
                        fontWeight: FontWeight.w400,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
