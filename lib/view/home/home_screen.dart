import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furnitureapp/res/common/global_text.dart';
import 'package:furnitureapp/res/static/app_color.dart';
import 'package:furnitureapp/view/product/productdescription.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class showproduct {
  String? sId;
  String? admin;
  List<String>? productImage;
  String? productName;
  String? role;
  int? productPrice;
  bool? isDelete;
  int? iV;

  showproduct(
      {this.sId,
      this.admin,
      this.productImage,
      this.productName,
      this.role,
      this.productPrice,
      this.isDelete,
      this.iV});

  factory showproduct.fromJson(Map<String, dynamic> json) {
    return showproduct(
        sId: json['_id'],
        admin: json['admin'],
        productImage: json['productImage'].cast<String>(),
        productName: json['productName'],
        role: json['role'],
        productPrice: json['productPrice'],
        isDelete: json['isDelete'],
        iV: json['__v']);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<showproduct>>? futureEmployees;
  String? Token;

  @override
  void initState() {
    futureEmployees = fetchEmployees();
    super.initState();
  }

  Future<List<showproduct>> fetchEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('token');

    log(Token.toString());
    final response = await http.get(
      Uri.parse(
          'https://typescript-al0m.onrender.com/api/user/product/showall-product'),
      headers: {'Authorization': 'Bearer $Token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => showproduct.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<showproduct>>(
              future: futureEmployees,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 256.h,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      showproduct employee = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDescription(
                                productname: employee.productName,
                                productprice: employee.productPrice.toString(),
                                // productimg: employee.productImage.toString(),
                              ),
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/coffechair.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 8),
                                          child: IconButton(
                                            icon: Icon(Icons.local_mall),
                                            onPressed: () {
                                              // Add your onPressed logic here
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GlobalText(
                                  text: employee.productName.toString(),
                                  color: AppColor.lightblackcolor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                                GlobalText(
                                  text: employee.productPrice.toString(),
                                  color: AppColor.blackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                 else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
