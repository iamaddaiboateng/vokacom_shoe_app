import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shoe_hub/core/strings.dart';
import 'package:shoe_hub/features/product/model/product_model.dart';

class ProductsController {
  Box products = Hive.box(kHiveProducts);
  Box currentUser = Hive.box(kHiveCurrentUser);

  addProduct(ProductModel model) {
    products.add(model.toMap()).whenComplete(() {
      Get.back();
      Get.snackbar('Successful', 'Product was added successfully');
    });
  }

  deleteProduct(int position) {
    var user = currentUser.get('user');
    if (user['role'] == 'Manager') {
      products.deleteAt(position).whenComplete(() {
        Get.back();
        Get.snackbar('Successful', 'Product was deleted successfully');
      });
    } else {
      Get.defaultDialog(content: Text('Only Managers can delete products'));
    }
  }

  updateProduct(ProductModel model, int position) {
    products.putAt(position, model.toMap()).whenComplete(() {
      Get.back();
      Get.snackbar('Successful', 'Product was updated successfully');
    });
  }
}
