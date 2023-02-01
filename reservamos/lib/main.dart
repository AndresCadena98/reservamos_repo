import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservamos/application/pages/home_page/home_page.dart';

import 'application/core/services/theme_service.dart';
import 'application/injection.dart' as di; //dependency injection
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePageWrapperProvider(),
        /*   '/place': (context) => const PlaceLocation(), */
        },
      );
    });
  }
}
