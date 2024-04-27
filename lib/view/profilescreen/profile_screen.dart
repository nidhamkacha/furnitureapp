// ignore_for_file: dead_code

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

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String profileImage;
  final bool isAdmin;
  final bool isDelete;
  final int v;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.profileImage,
    required this.isAdmin,
    required this.isDelete,
    required this.v,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      profileImage: json['profileImage'],
      isAdmin: json['isAdmin'],
      isDelete: json['isDelete'],
      v: json['__v'],
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Future<getprofile>? users;
  // String? Token;
  // String? name;
  // @override
  // void initState() {
  //   users = fetchusers();
  //   super.initState();
  // }

  // Future<getprofile> fetchusers() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Token = prefs.getString('token');
  //   log(Token.toString());
  //   final response = await http.get(
  //     Uri.parse('https://typescript-al0m.onrender.com/api/user/get-profile'),
  //     headers: {'Authorization': 'Bearer $Token'},
  //   );
  //   if (response.statusCode == 200) {
  //     List data = json.decode(response.body);
  //     return data.map((json) => getprofile.fromJson(json));
  //   } else {
  //     throw Exception('Failed to load employees');
  //   }
  // }
  // Future<getprofile>? futureProfile;
  // String? Token;
  // String? name;
  // final box = getprofile();
  // @override
  // void initState() {
  //   futureProfile = fetchProfile();
  //   super.initState();
  // }

  // _getRequests() async {
  //   setState(() {});
  // }

  Future<UserProfile> fetchUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/get-profile'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (token == null) {
      throw Exception('Token is null');
    }
    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      return UserProfile.fromJson(userData);
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  void getUserProfile() async {
    try {
      UserProfile userProfile = await fetchUserProfile();
      print('User ID: ${userProfile.id}');
      print('Name: ${userProfile.name}');
      print('Email: ${userProfile.email}');
      // Print other fields as needed
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              ElevatedButton(onPressed: getUserProfile, child: Text("data"))),
    );
  }
}
