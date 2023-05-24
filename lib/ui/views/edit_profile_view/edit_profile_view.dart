import 'package:flutter/material.dart';
import 'package:votting/ui/widgets/app_bar.dart';

import 'widgets/form_edit_profile.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: Text("Editar perfil"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: FormEditProfile(),
      ),
    );
  }
}
