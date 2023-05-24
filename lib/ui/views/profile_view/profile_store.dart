import 'package:votting/data/models/options_section_model.dart';

class ProfileStore {
  static const List<OptionSectionModel> options = [
    OptionSectionModel(label: "Perfil", route: "/editProfile"),
    OptionSectionModel(label: "Cambiar contraseña", route: "/forgotPassword"),
  ];

  static List<OptionSectionModel> getOptionsByRol() {
    return options;
  }
}
