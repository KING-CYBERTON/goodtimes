import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../Controller/productController.dart';
import '../Styles/font_styles.dart';
import '../View/Menu/card_screen.dart';
import '../View/Menu/profile.dart';
//import '../Widgets/ProductCard.dart';
import '../DataModel/Product.dart';
import '../Styles/color.dart';
import '../View/home_page.dart';
import '../Widgets/brands.dart';
import '../Widgets/item_view.dart';
import '../responsive/mobile.dart';
import '../responsive/response.dart';
import '../responsive/webview.dart';
import 'Categorycards.dart';
import 'favourite_screen.dart';
import 'notifications_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = Get.put(ProductController());
  int navigationIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late int index = 0;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Shoes",
                            style: textStyle4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: textStyle5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          itemCount: productController.shoes.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ProductCard2(
                                productList: productController.shoes[index]);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Arrivals",
                            style: textStyle4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: textStyle5,
                            ),
                          )
                        ],
                         
                      ),  ProductList(
                              productList: productController.shoes,
                              isGridView: true,
                              screenWidth: 800,
                              name: '', // You can adjust this as needed
                            ),
                      Column(
                        children: [
                          for (int index = 0;
                              index < productController.shoes.length;
                              index++)
                            ProductList(
                              productList: productController.shoes,
                              isGridView: true,
                              screenWidth: 800,
                              name: '', // You can adjust this as needed
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
