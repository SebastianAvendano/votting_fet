import 'package:flutter/material.dart';
import 'package:votting/data/models/type_alert_generic_model.dart';

enum SnackBarType {
  success(TypeAlertGenericModel(
    label: 'Success',
    color: Colors.green,
    icon: Icons.check_circle,
  )),
  error(TypeAlertGenericModel(
    label: 'Error',
    icon: Icons.error,
    color: Colors.red,
  ));

  const SnackBarType(this.type);
  final TypeAlertGenericModel type;
}
