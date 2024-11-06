import 'package:flutter/material.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/pages/product_page.dart';
import 'package:shoptopia/pages/update_product_for_admin_page.dart';

class CustomCard extends StatelessWidget {
  ProductModel productModel;

  CustomCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id, arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.white,
                // color: Colors.grey.withOpacity(.1),
                spreadRadius: 20,
                offset: Offset(10, 10),
              ),
            ]),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0, 8),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productModel.price.toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 5,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
