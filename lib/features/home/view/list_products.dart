import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoe_hub/core/strings.dart';
import 'package:shoe_hub/features/home/view/add_product.dart';
import 'package:shoe_hub/features/home/view/edit_product.dart';
import 'package:shoe_hub/features/home/view/view_product.dart';
import 'package:shoe_hub/features/product/controller/products_controller.dart';
import 'package:shoe_hub/features/product/model/product_model.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddProduct());
        },
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(kHiveProducts).listenable(),
        builder: (_, Box box, __) => ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var product = box.getAt(index);
              ProductModel model = ProductModel.fromMap(product);

              return ListTile(
                onTap: () {
                  Get.to(() => ViewProduct(model));
                },
                title: Text(product['name']),
                leading: IconButton(
                  onPressed: () {
                    Get.to(() => EditProduct(model, index));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    ProductsController().deleteProduct(index);
                  },
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
                  ),
                ),
                subtitle: Text('GH ${product['prices']}'),
              );
            }),
      ),
    );
  }
}
