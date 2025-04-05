import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/data/models/product/processed/product.dart';
import 'package:infinite_products/data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

// product_bloc.dart
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  static const int itemPerPage =
      16; // The amount of items to load per loading event

  ProductBloc(this._productRepository) : super(const ProductState()) {
    on<FetchProductEvent>(_getProducts);
    on<ShowProductDetailsEvent>(_showProductDetails);
  }

  /// This method is called when the user taps on a product, to show the product details
  void _showProductDetails(
      ShowProductDetailsEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(
      selectedProduct: () => event.product,
    ));
  }

  /// This method is called when the user scrolls to the end of the list, to load more products
  Future<void> _getProducts(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    // If there is no more products to fetch, return
    if (state.hasReachedMax) return;

    try {
      // Change loading state to true
      emit(state.copyWith(status: ProductStatus.loading));

      final currentList = state.products;
      final newProducts =
          await _productRepository.getProducts(itemPerPage, currentList.length);

      //Create the new list
      final newList = [...currentList, ...newProducts];

      if (newProducts.length < itemPerPage) {
        // If there are no more products to fetch, set the hasReachedMax to true, and
        // add the remaining products to the list
        emit(state.copyWith(
          hasReachedMax: true,
          products: newList,
          status: ProductStatus.success,
        ));
        return;
      }

      // If call is successful, emit a success state
      emit(state.copyWith(
        status: ProductStatus.success,
        products: newList,
      ));
    } catch (e) {
      // If call fails, emit a failure state
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: () => e.toString(),
      ));
    }
  }
}
