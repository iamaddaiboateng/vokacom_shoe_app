import 'package:flutter/material.dart';
import 'package:shoe_hub/features/product/controller/products_controller.dart';
import 'package:shoe_hub/features/product/model/product_model.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextFormField(
                controller: detailsController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Details'),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: priceController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: 'Price'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ProductModel model = ProductModel(
                      name: nameController.text,
                      details: detailsController.text,
                      price: priceController.text);

                  ProductsController().addProduct(model);
                },
                child: Text('Add Product'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
