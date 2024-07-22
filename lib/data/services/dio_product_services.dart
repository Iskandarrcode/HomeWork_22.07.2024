import 'package:dio/dio.dart';
import 'package:dio_product/core/networks/dio_client.dart';
import 'package:dio_product/data/models/product_model.dart';

class DioProductServices {
  final _dioClient = DioClient();

  Future<List<Product>> getProducts() async {
    try {
      final responses = await _dioClient.get(url: "/products");

      List<Product> products = [];


      for (var productData in responses.data) {
        products.add(Product.fromMap(productData));
      }

      

      return products;
    } on DioException catch (e) {
      print(e.response?.data);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
