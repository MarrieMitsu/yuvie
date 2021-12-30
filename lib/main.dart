import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/routes/application.dart';
import 'config/routes/routes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Yuvie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Application.router.generator,
    );

    return app;
  }
}