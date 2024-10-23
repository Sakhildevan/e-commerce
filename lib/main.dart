import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/splash/splash_screen.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: SplashScreen(), // Your initial screen
    ),
  );
}
