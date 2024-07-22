import 'package:bloc/bloc.dart';
import 'package:dio_product/blocs/products_bloc/product_events.dart';
import 'package:dio_product/blocs/products_bloc/product_state.dart';
import 'package:dio_product/data/repositorys/products_repositorys.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final ProductsRepositorys _productsRepositorys;

  ProductBloc({required ProductsRepositorys productsRepositorys})
      : _productsRepositorys = productsRepositorys,
        super(InitialProductState()) {
    on<GetProductsEvent>(_getProducts);
  }

  void _getProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingProductState());
    try {
      final response = await _productsRepositorys.getProducts();
      emit(LoadedProductState(response));
    } catch (e) {
      emit(ErrorProductsState(e.toString()));
    }
  }
}
