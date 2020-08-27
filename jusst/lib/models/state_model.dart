import 'package:json_annotation/json_annotation.dart';

import 'metadata_model.dart';

part 'state_model.g.dart';

enum SystemState { booting, updating, error, ready }

enum PlaybackState { inactive, paused, playing }

enum BluetoothState { inactive, pairing, connected }

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class StateModel {
  SystemState system;
  PlaybackState playback;
  int volume;
  BluetoothState bluetooth;
  MetaDataModel metadata;
  int playbackPosition;

  StateModel({
    this.system,
    this.playback,
    this.volume,
    this.bluetooth,
    this.metadata,
    this.playbackPosition,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);
  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
