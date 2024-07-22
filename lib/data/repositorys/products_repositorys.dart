import 'package:dio_product/data/models/product_model.dart';
import 'package:dio_product/data/services/dio_product_services.dart';

class ProductsRepositorys {
  final DioProductServices _dioProductsService;

  ProductsRepositorys({required DioProductServices dioProductsService})
      : _dioProductsService = dioProductsService;

  Future<List<Product>> getProducts() async {
    print("getProducts REpository");
    return await _dioProductsService.getProducts();
  }
}
