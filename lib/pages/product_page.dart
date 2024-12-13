import 'package:flutter/material.dart';
import 'package:shoptopia/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  static String id = 'product_page';
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              productModel.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.network(
              productModel.image,
              height: 200,
            ),
            Text(
              productModel.description,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '${productModel.price}\$',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocBuilder<FavoritesCubit, List<ProductModel>>(
              builder: (context, favorites) {
                final isFavorite = favorites.contains(productModel);
                return CustomButton(
                  color: isFavorite ? Colors.red : Colors.blue,
                  text:
                      isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
                  onTap: () {
                    context.read<FavoritesCubit>().toggleFavorite(productModel);

                    final message = isFavorite
                        ? 'Removed from Favorites'
                        : 'Added to Favorites';

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: isFavorite ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
