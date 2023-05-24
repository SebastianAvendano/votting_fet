import 'package:flutter/material.dart';
import 'package:votting/ui/views/edit_profile_view/edit_profile_view.dart';
import 'package:votting/ui/views/forgot_password_view/forgot_password_view.dart';
import 'package:votting/ui/views/list_candidates_view/list_candidates_view.dart';
import 'package:votting/ui/views/login_view/login_view.dart';
import 'package:votting/ui/views/main_view/main_view.dart';
import 'package:votting/ui/views/splash_view/splash_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const SplashView(),
      ),
      '/login': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      '/forgotPassword': MaterialPageRoute(
        builder: (_) => const ForgortPasswordView(),
      ),
      '/main': MaterialPageRoute(
        builder: (_) => const MainView(),
      ),
      '/editProfile': MaterialPageRoute(
        builder: (_) => const EditProfileView(),
      ),
      '/candidates': MaterialPageRoute(
        builder: (_) => const ListCandidates(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
