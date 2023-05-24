import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:votting/core/theme/colors_theme.dart';
import 'package:votting/core/utils/validations_input.dart';
import 'package:votting/ui/views/login_view/login_controller.dart';
import 'package:votting/ui/widgets/activity_indicator.dart';
import 'package:votting/ui/widgets/card.dart';
import 'package:votting/ui/widgets/generic_button_widget.dart';
import 'package:votting/ui/widgets/text_form_input.dart';

final injector = GetIt.instance;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final LoginController controller = injector.get<LoginController>();

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
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormInput(
              controller: controller.emailController,
              hintText: 'Ingrese usuario',
              icon: Icons.person_outline,
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
            const SizedBox(height: 30),
            TextFormInput(
              controller: controller.passwordController,
              hintText: 'Contraseña',
              obscureText: true,
              icon: Icons.lock_outline,
              textInputAction: TextInputAction.done,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'La contraseña es obligatoria';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => controller.forgotPassword(context: context),
                  child: const Text(
                    "Olvidé mi contraseña",
                    style: TextStyle(
                      color: ColorsAppTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ValueListenableBuilder<bool>(
              valueListenable: controller.isLoading,
              builder: (BuildContext _, bool isLoading, Widget? child) {
                return isLoading ? const ActivityIndicator() : child!;
              },
              child: GenericButton(
                height: 55,
                onPressed: () => controller.login(context),
                colorButton: ColorsAppTheme.primaryColor,
                text: 'Ingresar',
              ),
            ),
            const SizedBox(height: 20),
            GenericButton(
              height: 55,
              textStyle: const TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              colorButton: Colors.white,
              text: 'Continuar con Google',
              // imageRoute: Image.network(
              //   "http://pngimg.com/uploads/google/google_PNG19635.png",
              //   width: 20,
              // ),
              borderColor: Colors.black,
              onPressed: () => controller.sigInGoogle(context),
            ),
          ],
        ),
      ),
    );
  }
}
