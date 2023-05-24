import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:votting/core/utils/validations_input.dart';
import 'package:votting/ui/widgets/activity_indicator.dart';
import 'package:votting/ui/widgets/button.dart';
import 'package:votting/ui/widgets/card.dart';
import 'package:votting/ui/widgets/text_form_input.dart';

import '../forgot_password_controller.dart';

final injector = GetIt.instance;

class FormResetPassword extends StatefulWidget {
  const FormResetPassword({super.key});

  @override
  State<FormResetPassword> createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<FormResetPassword> {
  final ForgotPasswordController controller = injector.get<ForgotPasswordController>();

  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      margin: const EdgeInsets.all(0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Ingresa el correo electrónico con el que realizaste tu registro para actualizar la contraseña",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 30),
                TextFormInput(
                  controller: controller.emailController,
                  hintText: 'Correo electrónico',
                  textInputAction: TextInputAction.done,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'El email es obligatorio';
                    } else if (!ValidationInput.validateEmail(value)) {
                      return 'Formato inválido';
                    }
                    return null;
                  },
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: controller.isLoading,
              builder: (BuildContext _, bool isLoading, Widget? child) {
                return isLoading ? const ActivityIndicator() : child!;
              },
              child: Button(
                onPressed: () => controller.resertPasword(context),
                label: 'Recuperar contraseña',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
