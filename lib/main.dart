import 'package:flutter/material.dart';
import 'package:shoptopia/pages/account_page.dart';
import 'package:shoptopia/pages/cart_page.dart';
import 'package:shoptopia/pages/favorites_page.dart';
import 'package:shoptopia/pages/home_page.dart';
import 'package:shoptopia/pages/main_page.dart';
import 'package:shoptopia/pages/product_page.dart';
import 'package:shoptopia/pages/search_page.dart';
import 'package:shoptopia/pages/update_product_for_admin_page.dart';

void main() {
  runApp(const Shoptopia());
}

class Shoptopia extends StatelessWidget {
  const Shoptopia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MainPage.id: (context) => MainPage(),
        HomePage.id: (context) => HomePage(),
        UpdateProductForAdminPage.id: (context) => UpdateProductForAdminPage(),
        ProductPage.id: (context) => ProductPage(),
        SearchPage.id: (context) => SearchPage(),
        CartPage.id: (context) => CartPage(),
        FavoritesPage.id: (context) => FavoritesPage(),
        AccountPage.id: (context) => AccountPage(),
      },
      initialRoute: MainPage.id,
    );
  }
}
