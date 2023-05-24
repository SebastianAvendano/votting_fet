import 'package:flutter/material.dart';

class OptionSectionModel {
  const OptionSectionModel({
    this.icon,
    required this.route,
    required this.label,
  });

  final String label;
  final String route;
  final IconData? icon;
}
