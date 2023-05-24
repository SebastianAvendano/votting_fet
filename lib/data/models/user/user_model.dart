import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:votting/data/models/models_converter/date_time_converter.dart';
import 'package:votting/data/models/models_converter/document_reference_converter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.reference,
    this.createdAt,
    this.displayName = '',
    this.photo = '',
    this.email = '',
    this.fcmToken = '',
    this.cellPhone = '',
    this.rolName = '',
    this.isActive = false,
    this.rol,
  });

  final String? displayName;
  final String? email;
  final bool? isActive;
  final String? photo;
  final String? fcmToken;
  final String? cellPhone;
  final String? rolName;


  @DateTimeConverter()
  final DateTime? createdAt;
  
  @JsonKey(includeToJson: false)
  @DocumentReferenceConverter()
  final DocumentReference? reference;

  @DocumentReferenceConverter()
  final DocumentReference? rol;

  UserModel copyWith({
    String? displayName,
    String? email,
    String? photo,
    bool? isActive,
    String? fcmToken,
    String? cellPhone,
    String? rolName,
    DateTime? createdAt,
    DocumentReference? reference,
    DocumentReference? rol,
    
  }) =>
      UserModel(
        displayName: displayName ?? this.displayName,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        fcmToken: fcmToken ?? this.fcmToken,
        isActive: isActive ?? this.isActive,
        cellPhone: cellPhone ?? this.cellPhone,
        createdAt: createdAt ?? this.createdAt,
        reference: reference ?? this.reference,
        rolName: rolName ?? this.rolName,
        rol: rol ?? this.rol,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
