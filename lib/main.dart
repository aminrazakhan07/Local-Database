import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:local_database/HiveDatabase/HomeHive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Directory document = await getApplicationDocumentsDirectory();
  // Hive.init(document.path);
  // await Hive.openBox('Sudent');
//

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeHive(),
    );
  }
}
