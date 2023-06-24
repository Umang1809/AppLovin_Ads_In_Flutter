import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  Map? sdkConfiguration = await AppLovinMAX.initialize("sh5eXxteJLhknssTa3LRTBClQFeJxGdqcfttK0aavQZRRnCPOeQAIRJJTZPw0o3aATB4tmmlkGeyU5mRbpaoRK");
  runApp(
      MaterialApp(
        home: HomePage(),
        theme: ThemeData.dark(),
      ),
  );
}



