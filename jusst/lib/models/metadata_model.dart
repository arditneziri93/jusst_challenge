import 'package:json_annotation/json_annotation.dart';

part 'metadata_model.g.dart';

@JsonSerializable(includeIfNull: false)
class MetaDataModel {
  String title;
  String artist;
  String coverArt;
  int duration;

  MetaDataModel({this.title, this.artist, this.coverArt, this.duration});

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataModelToJson(this);
}
