// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:votting/core/repositories/auth_repository/auth_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/enums/snack_bar_type_enum.dart';
import 'package:votting/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class ForgotPasswordController {
  final AuthInterfaceImpl _authImpl;

  ForgotPasswordController(
    this._authImpl,
  );

  late TextEditingController emailController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  void init(BuildContext context) {
    emailController = TextEditingController();
  }

  Future<void> resertPasword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      String email = emailController.text.trim().toLowerCase();

      await _authImpl.resertPassword(email);
      isLoading.value = false;

      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.success,
        message: "Se envio el correo de recuperación",
      );
      
      useNavigateReplaceName(context: context, route: '/');
    }
  }

  void forgotPassword({required BuildContext context}) {
    useNavigatePushName(context: context, route: '/forgotPassword');
  }

  void dispose() {
    isLoading.value = false;
    emailController.dispose();
  }
}
