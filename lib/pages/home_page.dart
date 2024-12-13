import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoptopia/cubits/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  late List<ProductModel> products;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          'Shoptopia',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
        listener: (context, state) {
          if (state is GetAllProductsLoaded) {
            products = state.products;
          }
        },
        builder: (context, state) {
          if (state is GetAllProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllProductsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is GetAllProductsLoaded) {
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
                  productModel: products[index],
                ),
                itemCount: products.length,
              ),
            );
          } else {
            return const Center(
              child: Text('No products available'),
            );
          }
        },
      ),
    );
  }
}
