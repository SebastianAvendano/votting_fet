class ListOptionsModel {
  const ListOptionsModel({
    required this.label,
    required this.value,
  });

  final String label;
  final dynamic value;

  ListOptionsModel copyWith({
    String? label,
    dynamic value,
  }) =>
      ListOptionsModel(
        label: label ?? this.label,
        value: value ?? this.value,
      );
}
