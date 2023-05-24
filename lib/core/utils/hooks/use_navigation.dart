import 'package:flutter/material.dart';

useNavigatePushName({
  required String route,
  required BuildContext context,
  Object? arguments,
}) {
  Navigator.of(context).pushNamed(route, arguments: arguments);
}

void useNavigatePop({required BuildContext context}) async {
  Navigator.of(context).pop();
}

useNavigateReplaceName({
  required String route,
  required BuildContext context,
  Object? arguments,
}) {
  Navigator.of(context).pushReplacementNamed(
    route,
    arguments: arguments,
  );
}

useNavigateReplacePage({required BuildContext context, required String route}) {
  Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
}
