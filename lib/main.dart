import 'package:dio_product/blocs/products_bloc/product_bloc.dart';
import 'package:dio_product/blocs/products_bloc/product_state.dart';
import 'package:dio_product/data/repositorys/products_repositorys.dart';
import 'package:dio_product/data/services/dio_product_services.dart';
import 'package:dio_product/ui/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dioProductServices = DioProductServices();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            return ProductsRepositorys(dioProductsService: dioProductServices);
          },
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ProductBloc(
                productsRepositorys: context.read<ProductsRepositorys>(),
              );
            },
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),
    );
  }
}
