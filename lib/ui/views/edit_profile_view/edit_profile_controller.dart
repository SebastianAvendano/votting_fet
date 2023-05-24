// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/core/repositories/user_repository/user_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/enums/snack_bar_type_enum.dart';
import 'package:votting/data/models/user/user_model.dart';
import 'package:votting/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class EditProfileController {
  final UserInterfaceImpl _userImpl;

  EditProfileController(this._userImpl);

  late TextEditingController displayName;
  late TextEditingController cellPhoneController;
  late TextEditingController emailController;

  XFile? photo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> loadingGetData = ValueNotifier(true);

  void init(BuildContext context, [UserModel? user]) {
    displayName = TextEditingController(text: user?.displayName);
    cellPhoneController = TextEditingController(text: user?.cellPhone);
    emailController = TextEditingController(text: user?.email);
  }

  void updateUser(BuildContext context) async {
    final UserModel user = context.read<UserProvider>().user;
    String urlPhoto = '';

    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final UserModel data = UserModel(
        photo: urlPhoto.isNotEmpty ? urlPhoto : user.photo,
        cellPhone: cellPhoneController.text,
        displayName: displayName.text,
      );

      final bool response =
          await _userImpl.updateUser(user.reference!.id, data.toJson());

      isLoading.value = false;

      if (response) {
        useNavigatePop(context: context);
        return;
      }
      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.error,
        message: "Ocurrió un error, intenta nuevamente!",
      );
    }
  }

  void onSelectedPhoto(XFile selectedPhoto) {
    photo = selectedPhoto;
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }

  void dispose() {
    photo = null;
    isLoading.value = false;
    loadingGetData.value = true;
    displayName.dispose();
    cellPhoneController.dispose();
  }
}
