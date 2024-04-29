import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/view/auth/login_screen.dart';
import 'package:furnitureapp/view/bottom_navbar.dart';
import 'package:furnitureapp/view/onbording/onbording_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Token = prefs.getString('token');
  // log(Token!);
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
            home: Token == null ? OnbordingScreen() : BottomNavbar(),
          );
        });
  }
}
