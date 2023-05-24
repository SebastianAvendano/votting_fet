import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/config/initial_config.dart';
import 'package:votting/core/theme/theme.dart';

// Providers
import 'core/providers/providers.dart';

// Routes
import 'core/paths/app_paths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.storeProviders,
      child: MaterialApp(
        initialRoute: '/',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
