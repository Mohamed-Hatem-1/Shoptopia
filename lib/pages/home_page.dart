import 'package:flutter/material.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/services/get_all_products_service.dart';
import 'package:shoptopia/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  const HomePage({super.key});

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
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'Shoptopia',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 65,
        ),
        child: FutureBuilder<List<ProductModel>>(
            future: GetAllProductsService().getAllProducts(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) => CustomCard(
                    productModel: products[index],
                  ),
                  itemCount: products.length,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
