import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/utils/constants/string_constant.dart';
import '../../getX/product_controller.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringConst.appName)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.hasError.value) {
          return const Center(child: Text(StringConst.failedToLoadProducts));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------new arrival----------
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  StringConst.newarrival,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //---------product grid----------
              SizedBox(
                height: 300,
                child: buildProductGrid(context),
              ),
              //---------trending----------
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  StringConst.trending,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //---------product grid----------
              SizedBox(
                  height: 300,
                  child: buildProductGrid(context)), // Your existing grid view
            ],
          ),
        );
      }),
    );
  }

//-----------------product grid-----------
  SizedBox buildProductGrid(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context)
          .size
          .width, // Ensure grid takes up full screen width
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        // physics:
        //     const NeverScrollableScrollPhysics(), // Disable vertical scrolling
        shrinkWrap: true, // Allow GridView to wrap its content
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // 2 items per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 1.5, // Adjust to change the height/width ratio
        ),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return ProductCard(
            product: product,
          );
          //buildProductCard(product);
        },
      ),
    );
  }
}
