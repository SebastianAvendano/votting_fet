// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) =>
    CandidateModel(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      votes: json['votes'] as int? ?? 0,
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'votes': instance.votes,
    };
