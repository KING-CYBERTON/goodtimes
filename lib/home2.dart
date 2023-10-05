import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/CartController.dart';
import 'Controller/productController.dart';
import 'Widgets/Categorycards.dart';
// Import your ProductCard2 widget here
class Homepage2 extends StatefulWidget {
  final bool gridview;
  final double wsize;
  final String name;
  const Homepage2({super.key, required this.gridview, required this.wsize, required this.name});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: CustomScrollView(
        slivers: [
          // First horizontally scrollable list
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 200, // Adjust the height as needed
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 10, // Replace with your item count
          //       itemBuilder: (context, index) {
          //         // Create your ProductCard2 widget here
          //         return ProductCard2(productList: productController.tshirts[index]);
          //       },
          //     ),
          //   ),
          // ),

          // Second vertically scrollable list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Create your ProductList widget here
                return ProductList(
                  productList: productController.shoes, // Replace with your product list
                  isGridView: false, // Adjust as needed
                  screenWidth: 1, // Adjust as needed
                  name: '', // Adjust as needed
                );
              },
              childCount: 1, // You may have multiple items in your vertical list
            ),
          ),
        ],
      ),
    );
  }

}
