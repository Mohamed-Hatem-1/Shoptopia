import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoptopia/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/widgets/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  static String id = 'favorites_page';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesCubit, List<ProductModel>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text('No favorite products yet!'),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => CustomCard(
                productModel: favorites[index],
              ),
              itemCount: favorites.length,
            ),
          );
        },
      ),
    );
  }
}
