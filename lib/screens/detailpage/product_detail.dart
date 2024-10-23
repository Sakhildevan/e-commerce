import 'package:flutter/material.dart';
import 'package:test/utils/constants/dimension.dart';
import 'package:test/utils/constants/string_constant.dart';

import '../../data/model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: product != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display product image from assets
                    Center(
                      child: Image.asset(
                        getAssetImageForProduct(product),
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    KDimension().kHeight15,
                    // Product name
                    Center(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    KDimension().kHeight10,
                    // Price and Discounted Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            decoration: product.discount > 0
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        if (product.discount > 0) KDimension().kWidth10,
                        if (product.discount > 0)
                          Text(
                            '\$${(product.price * (1 - product.discount / 100)).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    KDimension().kHeight15,
                    // Product description
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    KDimension().kHeight15,
                    // Product brand and category
                    Text(
                      'Brand: ${product.brand}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Category: ${product.category}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    KDimension().kHeight15,
                    // Product availability
                    Text(
                      product.availability ? 'In Stock' : 'Out of Stock',
                      style: TextStyle(
                        fontSize: 16,
                        color: product.availability ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    KDimension().kHeight15,
                    // Product rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        KDimension().kWidth05,
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    KDimension().kHeight15,
                    // Product reviews
                    const Text(
                      StringConst.review,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    KDimension().kHeight10,
                    if (product.reviews.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true, // Needed to avoid overflow issues
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: product.reviews.length,
                        itemBuilder: (context, index) {
                          final review = product.reviews[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    KDimension().kWidth10,
                                    Text('User ${review.userId}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                //---heght---
                                KDimension().kHeight05,
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const SizedBox(width: 4),
                                    Text(review.rating.toString(),
                                        style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                                KDimension().kHeight05,
                                Text(review.comment),
                              ],
                            ),
                          );
                        },
                      ),
                    if (product.reviews.isEmpty)
                      const Text(StringConst.noReviewsAvailable,
                          style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text(
                StringConst.noProductData,
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
    );
  }

  // Helper function to get the asset image path based on the product
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
        return 'assets/images/placeholder.png'; // Fallback image if none found
    }
  }
}
