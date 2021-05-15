import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_hub/features/account/register_user/controller/register_user.dart';

class LogInUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                Center(
                    child: Text(
                  'Login User',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(
                  height: 20,
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
                  obscureText: true,
                  controller: passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      UserController().logInUser(
                          emailController.text, passwordController.text);
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
