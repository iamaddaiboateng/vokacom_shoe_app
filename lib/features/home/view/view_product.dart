import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoe_hub/features/product/model/product_model.dart';

class ViewProduct extends StatefulWidget {
  final ProductModel productModel;

  ViewProduct(this.productModel);

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            widget.productModel.name,
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          Text('GHS ${widget.productModel.price}'),
          SizedBox(
            height: 10,
          ),
          Text(widget.productModel.details)
        ],
      ),
    );
  }
}
