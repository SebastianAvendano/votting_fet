import 'package:flutter/material.dart';
import 'package:votting/ui/widgets/app_bar.dart';

import 'widgets/form.dart';

class ForgortPasswordView extends StatelessWidget {
  const ForgortPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text("Recuperar contraseña"),
      ),
      body: FormResetPassword(),
    );
  }
}
