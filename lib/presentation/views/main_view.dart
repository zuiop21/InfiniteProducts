import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_products/business_logic/bloc/product_bloc.dart';
import 'package:infinite_products/business_logic/cubit/bottom_navbar_cubit.dart';
import 'package:infinite_products/presentation/pages/home_page.dart';
import 'package:infinite_products/presentation/pages/product_detailed_page.dart';
import 'package:infinite_products/presentation/pages/product_list_page.dart';
import 'package:infinite_products/presentation/pages/profile_page.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: state.currentPage,
            children: [
              // Home
              const HomePage(),

              // Products with AnimatedSwitcher
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, productState) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: productState.selectedProduct != null
                        ? const ProductDetailedPage(key: ValueKey('detail'))
                        : const ProductListPage(),
                  );
                },
              ),

              // Profile
              const ProfilePage(),
            ],
          ),

          //NavbarItems
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: state.currentPage,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (pageIndex) {
              //Initialize the product list when the user taps on the products tab, for
              //the first time
              if (pageIndex == 1 &&
                  context.read<ProductBloc>().state.products.isEmpty) {
                context.read<ProductBloc>().add(FetchProductEvent());
              }

              //Change the page index in the BottomNavbarCubit
              context.read<BottomNavbarCubit>().changePage(pageIndex);
            },
          ),
        );
      },
    );
  }
}
