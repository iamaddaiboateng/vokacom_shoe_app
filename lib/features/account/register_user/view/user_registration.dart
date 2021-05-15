import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_hub/features/account/register_user/controller/register_user.dart';
import 'package:shoe_hub/features/account/register_user/model/user_model.dart';
import 'package:shoe_hub/features/account/register_user/view/login_user.dart';

class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool? manager = false;
  String role = '';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                    'Register User',
                    style: TextStyle(fontSize: 20),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Confirm Password'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                      title: Text('Manager'),
                      value: manager,
                      onChanged: (value) {
                        manager = value;
                        if (value == false) {
                          role = 'Cashier';
                        } else {
                          role = 'Manager';
                        }
                        setState(() {});
                      }),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        if (formKey.currentState!.validate()) {
                          UserModel model = UserModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              role: role);
                          UserController().addUser(model);
                        }
                      } else {
                        Get.defaultDialog(
                            content: Text('Passwords are not the same. '
                                'Please check Password fields and try again'));
                      }
                    },
                    child: Text('Register'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(
                          (() => LogInUser()),
                        );
                      },
                      child: Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
