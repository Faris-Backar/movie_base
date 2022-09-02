// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:movie_base/domain/entities/cast_entity.dart';

CastAndCrewModel castAndCrewModelFromJson(String str) =>
    CastAndCrewModel.fromJson(json.decode(str));

String castAndCrewModelToJson(CastAndCrewModel data) =>
    json.encode(data.toJson());

class CastAndCrewModel {
  CastAndCrewModel({
    this.id,
    this.cast,
    this.crew,
  });

  int? id;
  List<CastModel>? cast;
  List<CastModel>? crew;

  factory CastAndCrewModel.fromJson(Map<String, dynamic> json) =>
      CastAndCrewModel(
        id: json["id"],
        cast: List<CastModel>.from(
            json["cast"].map((x) => CastModel.fromJson(x))),
        // crew: List<CastModel>.from(
        //     json["crew"].map((x) => CastModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}

class CastModel extends CastEntity {
  CastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    required this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  }) : super(
          character: character,
          creditId: creditId,
          name: name,
          posterId: profilePath,
        );

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "credit_id": creditId,
        "order": order == null ? null : order,
        "department": department == null ? null : department,
        "job": job == null ? null : job,
      };
}
