import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoptopia/helper/show_snack_bar.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/services/update_product_service.dart';
import 'package:shoptopia/widgets/custom_button.dart';
import 'package:shoptopia/widgets/custom_text_field.dart';

class ProductPage extends StatefulWidget {
  static String id = 'product_page';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isLoading = false;

  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                productModel.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.network(
                productModel.image,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                productModel.description,
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                text: 'Add To Cart      ${productModel.price.toString()}\$',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  showSnackBar(
                    context,
                    'Added Succefully',
                    c: Colors.green,
                  );
                  isLoading = false;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                color: Colors.red,
                text: 'Add To Favorits',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  showSnackBar(
                    context,
                    'Added Succefully',
                    c: Colors.green,
                  );
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
