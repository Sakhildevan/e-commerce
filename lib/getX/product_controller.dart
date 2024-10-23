import 'package:get/get.dart';

import '../data/model/product_model.dart';
import '../data/service/product_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  final ProductService productService = ProductService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final fetchedProducts = await productService.fetchProducts();
      products.assignAll(fetchedProducts);
      hasError(false);
    } catch (e) {
      hasError(true);
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
