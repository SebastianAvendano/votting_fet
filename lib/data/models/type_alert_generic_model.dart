import 'package:flutter/material.dart';

class TypeAlertGenericModel {
  const TypeAlertGenericModel({
    this.label = '',
    required this.icon,
    required this.color,
  });

  final Color color;
  final String label;
  final IconData icon;

  TypeAlertGenericModel copyWith({
    Color? color,
    String? label,
    IconData? icon,
  }) {
    return TypeAlertGenericModel(
      icon: icon ?? this.icon,
      color: color ?? this.color,
      label: label ?? this.label,
    );
  }
}
