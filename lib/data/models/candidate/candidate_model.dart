import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'candidate_model.g.dart';

@JsonSerializable()
class CandidateModel {
  const CandidateModel({
    this.name = '',
    this.image = '',
    this.votes = 0,
  });

  final String? name;
  final String? image;
  final int? votes;

  CandidateModel copyWith({
    String? name,
    String? image,
    int? votes,
  }) =>
      CandidateModel(
        name: name ?? this.name,
        image: image ?? this.image,
        votes: votes ?? this.votes,
      );

  factory CandidateModel.fromRawJson(String str) =>
      CandidateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidateModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
}
