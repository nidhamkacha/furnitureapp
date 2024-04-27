import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/model.dart';
import 'package:furnitureapp/view/onbording/onbording_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  Future<String?> fetchToken(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/login'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the response JSON and extract the token
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String? token = responseData['token'];
      return token;
    } else {
      // If the request was not successful, throw an error or return null
      throw Exception('Failed to fetch token');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const ModelScreen(),
            home: const OnbordingScreen(),
          );
        });
  }
}
