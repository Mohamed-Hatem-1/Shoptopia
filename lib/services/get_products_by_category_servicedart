import 'package:shoptopia/helper/api.dart';
import 'package:shoptopia/models/product_model.dart';

class GetProductsByCategoryService {
  Future<List<ProductModel>> getProductsByCategory(String categoryName) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> products = [];

    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
