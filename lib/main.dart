import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/bloc/product_bloc.dart';
import 'package:product_list/bloc/product_event.dart';
import 'package:product_list/repository/product_repository.dart';
import 'package:product_list/screens/product_list_screen.dart';


void main() {
  final dio = Dio();
  final repository = ProductRepository(dio);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductRepository repository;
  const MyApp({super.key, required this.repository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc(repository)..add(FetchProducts()),
        child: const ProductListScreen(),
      ),
    );
  }
}
