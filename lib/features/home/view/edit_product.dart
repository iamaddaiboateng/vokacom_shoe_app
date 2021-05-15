import 'package:flutter/material.dart';
import 'package:shoe_hub/features/product/controller/products_controller.dart';
import 'package:shoe_hub/features/product/model/product_model.dart';

class EditProduct extends StatefulWidget {
  final ProductModel model;
  final int position;

  EditProduct(this.model, this.position);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.model.name);
    detailsController = TextEditingController(text: widget.model.details);
    priceController = TextEditingController(text: widget.model.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
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

                  ProductsController().updateProduct(model, widget.position);
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
