import 'package:flutter/material.dart';
import 'package:votting/core/theme/colors_theme.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/models/options_section_model.dart';
import 'package:votting/ui/views/profile_view/profile_store.dart';
import 'package:votting/ui/widgets/button.dart';

import 'profile_controller.dart';

import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          children: [
            const ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.person,
                color: ColorsAppTheme.primaryColor,
              ),
              title: Text(
                "Ajustes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(height: 10),
            ..._buildOptions(context),
            const SizedBox(height: 40),
            const ButtonogOut()
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildOptions(BuildContext context) {
  return List.generate(
    ProfileStore.getOptionsByRol().length,
    (index) {
      final OptionSectionModel option = ProfileStore.getOptionsByRol()[index];
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        onTap: () => useNavigatePushName(route: option.route, context: context),
        title: Text(
          option.label,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      );
    },
  );
}

class ButtonogOut extends StatelessWidget {
  const ButtonogOut({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = injector.get<ProfileController>();

    return Button(
      onPressed: () => controller.signOut(context),
      label: "Cerrar Sesion",
    );
  }
}
