import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoe_hub/core/strings.dart';
import 'package:shoe_hub/features/account/register_user/view/user_registration.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kHiveUsers);
  await Hive.openBox(kHiveAccount);
  await Hive.openBox(kHiveCurrentUser);
  await Hive.openBox(kHiveProducts);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shoe Hub',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: UserRegistration(),
    );
  }
}
