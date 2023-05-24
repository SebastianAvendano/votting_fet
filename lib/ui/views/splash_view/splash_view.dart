import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:votting/core/paths/local_paths.dart';

import 'splash_controller.dart';

final injector = GetIt.instance;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController controller = injector.get<SplashController>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => controller.validateSession(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(LocalAppPaths.logo)),
    );
  }
}
