part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProductEvent extends ProductEvent {}

final class ShowProductDetailsEvent extends ProductEvent {
  const ShowProductDetailsEvent(this.product);

  final Product? product;

  @override
  List<Object?> get props => [product];
}
