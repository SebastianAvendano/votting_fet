// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/core/repositories/auth_repository/auth_impl.dart';
import 'package:votting/core/repositories/user_repository/user_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/models/user/user_model.dart';

@singleton
class SplashController {
  final AuthInterfaceImpl _authImpl;
  final UserInterfaceImpl _userImpl;

  SplashController(this._authImpl, this._userImpl);

  void validateSession(BuildContext context) async {
    final User? currentUser = _authImpl.getCurrentUser();

    if (currentUser != null) {
      final DocumentSnapshot<UserModel>? docUser =
          await _userImpl.getUser(currentUser.uid);

      if (docUser != null && docUser.exists) {
        final DocumentSnapshot docRol = await docUser.data()!.rol!.get();
        final String rolName = docRol.get('name') ?? '';
        final UserModel user = docUser.data()!.copyWith(rolName: rolName);

        setUser(context: context, user: user);
        useNavigateReplacePage(context: context, route: '/main');
      }
    } else {
      useNavigateReplacePage(context: context, route: "/login");
    }
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }
}
