import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_freak/src/app.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  print('FireBase C Work');

  runApp(App());
}
