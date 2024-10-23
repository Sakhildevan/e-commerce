class Product {
  final int productId;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String image;
  final int discount;
  final bool availability;
  final String brand;
  final String category;
  final double rating;
  final List<Review> reviews;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var reviewList = json['reviews'] as List<dynamic>?;
    List<Review> reviews = reviewList != null
        ? reviewList.map((review) => Review.fromJson(review)).toList()
        : [];

    return Product(
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      unit: json['unit'],
      image: json['image'] ?? 'https://via.placeholder.com/150', // Placeholder
      discount: json['discount'],
      availability: json['availability'],
      brand: json['brand'],
      category: json['category'],
      rating: json['rating'],
      reviews: reviews,
    );
  }
}

class Review {
  final int userId;
  final int rating;
  final String comment;

  Review({required this.userId, required this.rating, required this.comment});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['user_id'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }
}
