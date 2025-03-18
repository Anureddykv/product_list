import 'package:equatable/equatable.dart';
import 'package:product_list/models/product.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {}

class SelectProduct extends ProductEvent {
  final Product product;
  const SelectProduct(this.product);

  @override
  List<Object> get props => [product];
}
