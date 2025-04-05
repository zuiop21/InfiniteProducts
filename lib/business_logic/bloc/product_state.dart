part of 'product_bloc.dart';

enum ProductStatus { initial, success, failure, loading }

final class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.hasReachedMax = false,
    this.error,
    this.newDataLoading = false,
    this.selectedProduct,
  });

  final ProductStatus status;
  final List<Product> products;
  final bool hasReachedMax;
  final bool newDataLoading;
  final String? error;
  final Product? selectedProduct;

  @override
  List<Object?> get props => [
        status,
        products,
        hasReachedMax,
        error,
        newDataLoading,
        selectedProduct,
      ];
  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
    bool? newDataLoading,
    ValueGetter<String?>? error,
    ValueGetter<Product?>? selectedProduct,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      newDataLoading: newDataLoading ?? this.newDataLoading,
      error: error != null ? error() : this.error,
      selectedProduct:
          selectedProduct != null ? selectedProduct() : this.selectedProduct,
    );
  }
}
