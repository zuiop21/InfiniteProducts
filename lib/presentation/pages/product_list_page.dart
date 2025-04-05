import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/business_logic/bloc/product_bloc.dart';
import 'package:infinite_products/business_logic/cubit/scroll_controller_cubit.dart';
import 'package:infinite_products/presentation/widgets/product_card.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController
            .jumpTo(context.read<ScrollControllerCubit>().state.scrollOffset);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }

  /// This method is used to load more products when the user scrolls to the end of the list
  void loadMoreProducts(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductEvent());
  }

  void _onScroll() {
    // Update the scroll offset in the ProductBloc
    context
        .read<ScrollControllerCubit>()
        .updateScrollOffset(_scrollController.offset);

    // Check if the user has scrolled to the end of the list and
    // if the current state is not loading already
    // This is to prevent multiple loading events, because
    // the scroll listener can be called multiple times
    if (_scrollAtEnd &&
        context.read<ProductBloc>().state.status != ProductStatus.loading) {
      loadMoreProducts(context);
    }
  }

  bool get _scrollAtEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Products",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) =>
            previous.products.length != current.products.length,
        builder: (context, state) {
          switch (state.status) {
            case ProductStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case ProductStatus.failure:
              return Center(child: Text(state.error ?? ''));
            case ProductStatus.loading:
            case ProductStatus.success:
              return Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: GridView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: MediaQuery.of(context).size.width * 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
