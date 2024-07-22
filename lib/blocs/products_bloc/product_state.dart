import 'package:dio_product/data/models/product_model.dart';

sealed class ProductState {}

final class InitialProductState extends ProductState {}

final class LoadingProductState extends ProductState {}

final class LoadedProductState extends ProductState {
  final List<Product> products;

  LoadedProductState(this.products);
}

final class ErrorProductsState extends ProductState {
  final String message;

  ErrorProductsState(this.message);
}
