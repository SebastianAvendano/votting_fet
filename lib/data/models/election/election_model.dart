import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:votting/data/models/candidate/candidate_model.dart';
import 'package:votting/data/models/models_converter/date_time_converter.dart';
import 'package:votting/data/models/models_converter/document_reference_converter.dart';
import 'package:votting/data/models/models_converter/list_document_reference_converter.dart';

part 'election_model.g.dart';

@JsonSerializable()
class ElectionModel {
  const ElectionModel({
    this.reference,
    this.createdAt,
    this.title = '',
    this.candidates = const [],
    this.voters = const [],
  });

  final String? title;
  final List<CandidateModel>? candidates;

  @DateTimeConverter()
  final DateTime? createdAt;

  @JsonKey(includeToJson: false)
  @DocumentReferenceConverter()
  final DocumentReference? reference;

  @JsonKey(
    fromJson: ListReferenceConverter.fromJsonListDocumentReference,
    toJson: ListReferenceConverter.toJsonListDocumentReference,
  )
  final List<DocumentReference>? voters;

  ElectionModel copyWith({
    String? title,
    DateTime? createdAt,
    DocumentReference? reference,
    List<DocumentReference>? voters,
    List<CandidateModel>? candidates,
  }) =>
      ElectionModel(
        title: title ?? this.title,
        candidates: candidates ?? this.candidates,
        voters: voters ?? this.voters,
        createdAt: createdAt ?? this.createdAt,
        reference: reference ?? this.reference,
      );

  factory ElectionModel.fromRawJson(String str) =>
      ElectionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ElectionModel.fromJson(Map<String, dynamic> json) =>
      _$ElectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ElectionModelToJson(this);
}
