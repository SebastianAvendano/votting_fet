import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:votting/core/providers/providers.dart';
import 'package:votting/core/repositories/auth_repository/auth_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';

@singleton
class ProfileController {
  final AuthInterfaceImpl _authImpl;
  final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);

  ProfileController(this._authImpl);

  void signOut(context) async {
    await AppProviders.disposeAllDisposableProviders(context);
    await _authImpl.signOut();
    useNavigateReplacePage(route: '/', context: context);
  }
}
