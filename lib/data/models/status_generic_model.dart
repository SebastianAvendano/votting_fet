import 'package:flutter/material.dart';

class StatusGenericModel {
  const StatusGenericModel({
    required this.label,
    this.color = Colors.grey,
  });

  final String label;
  final Color color;
}
