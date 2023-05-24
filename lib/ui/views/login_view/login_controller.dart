// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votting/core/config/constants.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/core/repositories/auth_repository/auth_impl.dart';
import 'package:votting/core/repositories/user_repository/user_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/enums/snack_bar_type_enum.dart';
import 'package:votting/data/models/user/user_model.dart';
import 'package:votting/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class LoginController {
  final AuthInterfaceImpl _authImpl;
  final UserInterfaceImpl _userImpl;

  LoginController(this._authImpl, this._userImpl);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void init(BuildContext context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      String email = emailController.text.trim().toLowerCase();
      String pass = passwordController.text.trim();

      final UserCredential? userCredential = await _authImpl.login(email, pass);

      if (userCredential != null) {
        final DocumentSnapshot<UserModel>? docUser =
            await _userImpl.getUser(userCredential.user?.uid ?? '');

        if (docUser != null &&
            docUser.exists &&
            docUser.data()?.isActive == true) {
          final DocumentSnapshot docRol = await docUser.data()!.rol!.get();

          final String rolName = docRol.get('name') ?? '';
          final UserModel user = docUser.data()!.copyWith(rolName: rolName);

          isLoading.value = false;
          setUser(context: context, user: user);
          SnackBarFloating.show(
            context: context,
            snackBarType: SnackBarType.success,
            message: "Ingreso exitoso.",
          );
          useNavigateReplacePage(context: context, route: '/main');

          return;
        }
      }

      isLoading.value = false;

      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.error,
        message: "Usuario o contraseña incorrectos.",
      );
    }
  }

  Future<void> sigInGoogle(BuildContext context) async {
    final UserCredential? userCredential = await _authImpl.sigInGoogle();
    if (userCredential != null) {
      final queryRol = (await _userImpl.getRol(keyUserRol))!.docs[0];
      final rol = (queryRol.data())["name"];

      final UserModel data = UserModel(
        cellPhone: "",
        createdAt: DateTime.now(),
        displayName: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        isActive: true,
        fcmToken: userCredential.credential!.accessToken,
        photo: userCredential.user!.photoURL,
        rol: queryRol.reference,
        rolName: rol,
      );
      await _userImpl.createUser(userCredential.user!.uid, data.toJson());
    }
    useNavigateReplacePage(context: context, route: '/main');
  }

  void forgotPassword({required BuildContext context}) {
    useNavigatePushName(context: context, route: '/forgotPassword');
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }

  void dispose() {
    isLoading.value = false;
    emailController.dispose();
    passwordController.dispose();
  }
}
