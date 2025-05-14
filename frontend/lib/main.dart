import 'package:flutter/material.dart';

import 'config/routes/router_config.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/constants.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
