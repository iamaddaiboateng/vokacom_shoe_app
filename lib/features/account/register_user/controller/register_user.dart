import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shoe_hub/core/strings.dart';
import 'package:shoe_hub/features/account/register_user/model/user_model.dart';
import 'package:shoe_hub/features/home/view/list_products.dart';

class UserController {
  // open database boxes
  Box box = Hive.box(kHiveUsers);
  Box currentUser = Hive.box(kHiveCurrentUser);
  Box account = Hive.box(kHiveAccount);

  // register users
  addUser(UserModel model) {
    box.add(model.toMap()).whenComplete(() {
      Get.offAll(() => ProductsList());
      currentUser.put('user', model.toMap());
      Get.snackbar('Successful', 'You have successfully signed in');
    });
  }

  // login user
  logInUser(email, password) {
    List user = box.values
        .where((element) =>
            element['email'] == email && element['password'] == password)
        .toList();

    if (user.isEmpty) {
      Get.snackbar("Error", "No User Found");
    } else {
      UserModel model = UserModel.fromMap(user.first);
      currentUser.put('user', model.toMap());
      Get.offAll(() => ProductsList());
      Get.snackbar('Successful', 'You have successfully signed in');
    }
  }
}
