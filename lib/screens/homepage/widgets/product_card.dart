import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test/screens/detailpage/product_detail.dart';

import '../../../data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price * (1 - (product.discount / 100));

    // Map product names or IDs to asset image paths
    String imagePath = getAssetImageForProduct(product);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsPage(product: product));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //----image----------
            Image.asset(
              width: 120,
              height: 160,
              imagePath,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----name----------
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  //----price----------
                  const SizedBox(height: 4),
                  Text('\$${discountedPrice.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green)),
                  //---brand---
                  Text('Brand: ${product.brand}',
                      style: const TextStyle(
                        fontSize: 15,
                      )),
                  //----------review------------
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(product.rating.toString(),
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getAssetImageForProduct(Product product) {
    switch (product.productId) {
      case 1:
        return 'assets/images/phone.png';
      case 2:
        return 'assets/images/lap.png';
      case 3:
        return 'assets/images/headphone.png';
      case 4:
        return 'assets/images/watch.png';
      case 5:
        return 'assets/images/dslr.png';
      case 6:
        return 'assets/images/tv.png';
      case 7:
        return 'assets/images/tab.png';
      case 8:
        return 'assets/images/game.png';
      case 9:
        return 'assets/images/fridge.png';
      default:
        return 'assets/images/placeholder.png';
    }
  }
}
