import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/ui/views/edit_profile_view/edit_profile_controller.dart';
import 'package:votting/ui/widgets/activity_indicator.dart';
import 'package:votting/ui/widgets/button.dart';
import 'package:votting/ui/widgets/card_select_image.dart';
import 'package:votting/ui/widgets/text_form_input.dart';

final injector = GetIt.instance;

class FormEditProfile extends StatefulWidget {
  const FormEditProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<FormEditProfile> createState() => _FormEditProfileState();
}

class _FormEditProfileState extends State<FormEditProfile> {
  final controller = injector.get<EditProfileController>();

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProvider>().user;
    controller.init(context, user);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _cardImage(context, controller),
          const SizedBox(height: 15),
          TextFormInput(
            controller: controller.displayName,
            labelText: 'Nombres',
            hintText: 'Nombre',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Debe ingresar el nombre';
              }
              return null;
            },
            onFieldSubmitted: (_) => onFieldSubmitted(context),
          ),
          const SizedBox(height: 10),
          TextFormInput(
            controller: controller.emailController,
            hintText: 'Correo',
            labelText: 'Correo electrónico',
            enabled: false,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Debe ingresar el email';
              }
              return null;
            },
            onFieldSubmitted: (_) => onFieldSubmitted(context),
          ),
          const SizedBox(height: 10),
          TextFormInput(
            controller: controller.cellPhoneController,
            labelText: 'Número de teléfono',
            hintText: 'Número de teléfono',
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Este campo es requerido";
              }
              return null;
            },
            onFieldSubmitted: (_) => onFieldSubmitted(context),
          ),
          const SizedBox(height: 20),
          _buildButton(controller)
        ],
      ),
    );
  }

  void onFieldSubmitted(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  Widget _cardImage(BuildContext context, EditProfileController controller) {
    return Consumer<UserProvider>(
      builder: (BuildContext _, UserProvider userProvider, Widget? __) {
        final user = userProvider.user;
        return CardSelectImage(
          onClick: (file) => controller.onSelectedPhoto(file),
          file: user.photo!.isNotEmpty ? user.photo : null,
          label: 'Subir foto',
        );
      },
    );
  }

  Widget _buildButton(EditProfileController controller) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isLoading,
      builder: (BuildContext _, bool isLoading, Widget? child) {
        return isLoading ? const ActivityIndicator() : child!;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Button(
          onPressed: () => controller.updateUser(context),
          label: 'Guardar',
        ),
      ),
    );
  }
}
