import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoptopia/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:shoptopia/cubits/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:shoptopia/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:shoptopia/helper/my_bloc_observer.dart';
import 'package:shoptopia/pages/account_page.dart';
import 'package:shoptopia/pages/favorites_page.dart';
import 'package:shoptopia/pages/home_page.dart';
import 'package:shoptopia/pages/main_page.dart';
import 'package:shoptopia/pages/product_page.dart';
import 'package:shoptopia/pages/search_page.dart';
import 'package:shoptopia/pages/update_product_for_admin_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const Shoptopia());
}

class Shoptopia extends StatelessWidget {
  const Shoptopia({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetAllProductsCubit()),
        BlocProvider(create: (context) => ProductDetailsCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MainPage.id: (context) => MainPage(),
          HomePage.id: (context) => HomePage(),
          UpdateProductForAdminPage.id: (context) =>
              UpdateProductForAdminPage(),
          ProductPage.id: (context) => const ProductPage(),
          SearchPage.id: (context) => const SearchPage(),
          FavoritesPage.id: (context) => const FavoritesPage(),
          AccountPage.id: (context) => const AccountPage(),
        },
        initialRoute: MainPage.id,
      ),
    );
  }
}
