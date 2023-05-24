import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votting/core/utils/capitalize_string_component.dart';

class BuildNameReference extends StatelessWidget {
  const BuildNameReference({
    super.key,
    required this.reference,
    this.textStyle,
    this.maxLines,
    this.keySnapshot = 'name',
  });

  final int? maxLines;
  final String? keySnapshot;
  final TextStyle? textStyle;
  final DocumentReference reference;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: reference.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Text(
            data[keySnapshot].toString().capitalize(),
            maxLines: maxLines,
            style: textStyle,
          );
        }
        return const SizedBox();
      },
    );
  }
}
