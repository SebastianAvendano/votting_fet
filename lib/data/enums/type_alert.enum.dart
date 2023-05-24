import 'package:flutter/material.dart';
import 'package:votting/core/theme/colors_theme.dart';
import 'package:votting/data/models/type_alert_generic_model.dart';

enum TypeAlertDialog {
  success(TypeAlertGenericModel(
    icon: Icons.check_circle,
    color: Colors.green,
  )),
  warning(TypeAlertGenericModel(
    icon: Icons.warning,
    color: ColorsAppTheme.primaryColor,
  )),
  error(TypeAlertGenericModel(
    icon: Icons.cancel,
    color: Colors.red,
  ));

  const TypeAlertDialog(this.value);
  final TypeAlertGenericModel value;
}
