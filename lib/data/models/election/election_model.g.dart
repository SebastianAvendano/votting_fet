// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectionModel _$ElectionModelFromJson(Map<String, dynamic> json) =>
    ElectionModel(
      reference: const DocumentReferenceConverter()
          .fromJson(json['reference'] as DocumentReference<Object?>?),
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp?),
      title: json['title'] as String? ?? '',
      candidates: (json['candidates'] as List<dynamic>?)
              ?.map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voters: json['voters'] == null
          ? const []
          : ListReferenceConverter.fromJsonListDocumentReference(
              json['voters'] as List?),
    );

Map<String, dynamic> _$ElectionModelToJson(ElectionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'candidates': instance.candidates,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'voters':
          ListReferenceConverter.toJsonListDocumentReference(instance.voters),
    };
