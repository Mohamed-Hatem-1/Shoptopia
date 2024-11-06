import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoptopia/helper/show_snack_bar.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/services/update_product_service.dart';
import 'package:shoptopia/widgets/custom_button.dart';
import 'package:shoptopia/widgets/custom_text_field.dart';

class UpdateProductForAdminPage extends StatefulWidget {
  static String id = 'update_product_page';

  UpdateProductForAdminPage({super.key});

  @override
  State<UpdateProductForAdminPage> createState() =>
      _UpdateProductForAdminPageState();
}

class _UpdateProductForAdminPageState extends State<UpdateProductForAdminPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(productModel.title),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Image.network(
                productModel.image,
                height: 200,
              ),
              Text(
                productModel.description,
              ),
              TextField(
                controller:
                    TextEditingController(text: productModel.id.toString()),
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Product id',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              CustomTextField(
                onChanged: (p0) {
                  productName = p0;
                },
                hint: 'Product Name',
              ),
              CustomTextField(
                onChanged: (p0) {
                  desc = p0;
                },
                hint: 'Description',
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                onChanged: (p0) {
                  price = p0;
                },
                hint: 'Price',
              ),
              // CustomTextField(
              //   onChanged: (p0) {
              //     image = p0;
              //   },
              //   hint: 'image',
              // ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(productModel);
                    showSnackBar(
                      context,
                      'Update Request Sent Succefully',
                      c: Colors.green,
                    );
                  } catch (e) {
                    showSnackBar(
                      context,
                      e.toString(),
                    );
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
      id: productModel.id,
      title: productName == null ? productModel.title : productName!,
      price: price == null ? productModel.price.toString() : price!,
      description: desc == null ? productModel.description : desc!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
