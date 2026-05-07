import 'package:flutter/material.dart';
import 'core/app_router.dart';
import 'core/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SomWebPortfolio());
}

class SomWebPortfolio extends StatelessWidget {
  const SomWebPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Physiotherapist & Author Portfolio',
      theme: AppTheme.theme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
