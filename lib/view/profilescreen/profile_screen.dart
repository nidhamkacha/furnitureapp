import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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
  // String? pass;
  // final box = GetStorage();
  @override
  void initState() {
    futureProfile = fetchProfile();
    super.initState();
  }

  _getRequests() async {
    setState(() {});
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
      // Get.snackbar('Message', 'Load data.....!',
      //     backgroundColor: Colors.yellow,
      //     icon: Icon(Icons.abc),
      //     snackPosition: SnackPosition.BOTTOM);
      // Get.defaultDialog(
      //   actions: [],
      //   title: 'text',
      // );
      return GetProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            name == null ? CircularProgressIndicator() : Text(name.toString()),
            email == null
                ? CircularProgressIndicator()
                : Text(email.toString()),
            // Text(pass.toString()),
          ],
        ),
      ),
    );
  }
}
