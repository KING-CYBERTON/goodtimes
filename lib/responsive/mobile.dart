import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodtimes/Widgets/home_page.dart';
import 'package:goodtimes/Widgets/item_view.dart';
import 'package:goodtimes/responsive/silverhomepage.dart';
import '../Controller/CartController.dart';
import '../View/Menu/profile.dart';
import '../View/home_page.dart';
import 'package:flutter/material.dart';
import '../Styles/color.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../Widgets/favourite_screen.dart';
import '../home2.dart';
import '../responsive/response.dart';
import '../responsive/webview.dart';
import '../Controller/productController.dart';
import '../Styles/font_styles.dart';
import '../Styles/color.dart';
import '../Widgets/Categorycards.dart';
import '../View/Menu/card_screen.dart';

// ignore: camel_case_types
class mobilescreenlayout extends StatefulWidget {
  const mobilescreenlayout({super.key});

  @override
  State<mobilescreenlayout> createState() => _mobilescreenlayoutState();
}

// ignore: camel_case_types
class _mobilescreenlayoutState extends State<mobilescreenlayout> {
  late String name = '';
  final cartController = Get.put(CartController());

  bool gridview = true;
  int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[200],
          titleSpacing: 0.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          title: IconButton(
            color: Colors.white,
            icon:
                gridview ? const Icon(Icons.list) : const Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                gridview = !gridview;
              });
            },
          ),
          leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Bounce(
                  onPressed: () => MaterialPageRoute(
                    builder: (context) => const ResponsiveLayout(
                        mobileScreenLayout: mobilescreenlayout(),
                        webScreenLayout: weblcreenlayout()),
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    "assets/images/goodtimes.png",
                    width: 44,
                    height: 44,
                  ),
                ),
              ]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  cursorColor: customBlue,
                  cursorWidth: 2.5,
                  style: textStyle1,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: "Search Product,Cartegory",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/icons/search_ic.png"),
                    ),
                    hintStyle: textStyle1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ]),
      body: Center(
        child: Container(
            color: bgWhite,
            height: double.infinity,
            width: double.infinity,
            child:   homepage(
            gridview: gridview,
            wsize: MediaQuery.of(context).size.width * 0.8,
            name: name,
          ),
          
            
            // CustomScrollViewExample(name: name)
            //  homepage(
            //     gridview: gridview,
            //     wsize: MediaQuery.of(context).size.width * 0.8,
            //     name: name)
            // Homepage2(gridview: gridview, wsize: 900, name: name)
            ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bottomnav_bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveLayout(
                            mobileScreenLayout: mobilescreenlayout(),
                            webScreenLayout: weblcreenlayout()),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/home_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 0 ? customBlue : customGrey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/favourite_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 1 ? customBlue : customGrey,
                  ),
                ),
                const SizedBox(
                  width: 60.0,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AboutUsDialog();
                      },
                    );
                  },
                  child: Image.asset(
                    "assets/icons/location_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 2 ? customBlue : customGrey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/user_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 3 ? customBlue : customGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

class homepage extends StatefulWidget {
  final bool gridview;
  final double wsize;
  final String name;
  const homepage(
      {super.key,
      required this.gridview,
      required this.wsize,
      required this.name});
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  final productController = Get.put(ProductController());
  int _crossAxisCount = 2; // Initial number of grids

// Current view mode
  int _currentNumber = 0;
  final List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F'];

  late AnimationController _animationController;
  double _startPositionX = 0.0;
  double _endPositionX = 0.0;

  @override
  void initState() {
    super.initState();
     _currentNumber = 2;
    
  }



  @override
  Widget build(BuildContext context) {
    bool isGridView = widget.gridview;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grids based on screen width
    if (screenWidth >= 600) {
      _crossAxisCount = 4;
    } else if (screenWidth >= 1200) {
      _crossAxisCount = 6;
    } else {
      _crossAxisCount = 2;
    }

   
   
      return Column(
        children: [
          SizedBox(height: 16),
         
 
       
          Expanded(
            child: Column(
              children: [
               
                if (_currentNumber == 2) ...shoesList(),
                

                // Add similar conditions for other categories/lists if needed
              ],
            ),
          ),
        ],
      );
    }
  


  List<Widget> shoesList() {
    return [
      ProductList(
        productList: productController.shoes,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> tshirtList() {
    return [
      ProductList(
        productList: productController.tshirts,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> JacketList() {
    return [
      ProductList(
        productList: productController.jackets,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount,name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> accesorieList() {
    return [
      ProductList(
        productList: productController.accesories,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> NewArrivals() {
    return [
      ProductList(
        productList: productController.products,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> combolist() {
    return [
      ProductList(
        productList: productController.combo,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }

  List<Widget> trouserlist() {
    return [
      ProductList(
        productList: productController.trousers,
        isGridView:
            widget.gridview, // Set to true for grid view, false for list view
        screenWidth: _crossAxisCount, name: widget.name, // You can adjust this as needed
      ),
    ];
  }
}

