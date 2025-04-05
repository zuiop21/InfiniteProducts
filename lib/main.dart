import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/business_logic/bloc/product_bloc.dart';
import 'package:infinite_products/business_logic/cubit/bottom_navbar_cubit.dart';
import 'package:infinite_products/business_logic/cubit/scroll_controller_cubit.dart';
import 'package:infinite_products/data/repositories/product_repository.dart';
import 'package:infinite_products/presentation/views/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //The repository that handles communication with the API
  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavbarCubit(),
          ),
          BlocProvider(
            create: (context) => ProductBloc(_productRepository),
          ),
          BlocProvider(
            create: (context) => ScrollControllerCubit(),
          ),
        ],
        child: const MainView(),
      ),
    );
  }
}
