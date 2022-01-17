import 'package:json_annotation/json_annotation.dart';

part 'ice_playing.g.dart';

@JsonSerializable()
class Source {
  Source(
      this.artist,
      this.audioBitrate,
      this.audioChannels,
      this.audioInfo,
      this.audioSamplerate,
      this.channels,
      this.genre,
      this.iceBitrate,
      this.listenerPeak,
      this.listeners,
      this.listenURL,
      this.quality,
      this.samplerate,
      this.serverDescription,
      this.serverName,
      this.serverType,
      this.streamStart,
      this.streamStartISO,
      this.subtype,
      this.title,
      this.images);

  String? artist = "";
  String? title = "";

  @JsonKey(name: 'audio_bitrate')
  final int? audioBitrate;
  @JsonKey(name: 'audio_channels')
  final int? audioChannels;
  @JsonKey(name: 'audio_info')
  final String? audioInfo;
  @JsonKey(name: 'audio_samplerate')
  final int? audioSamplerate;
  final int? channels;
  final String? genre;
  @JsonKey(name: 'ice-bitrate')
  final int? iceBitrate;
  @JsonKey(name: 'listener_peak')
  final int? listenerPeak;
  final int? listeners;
  @JsonKey(name: 'listenurl')
  final String? listenURL;
  final double? quality;
  final int? samplerate;
  @JsonKey(name: 'server_description')
  final String? serverDescription;
  @JsonKey(name: 'server_name')
  final String? serverName;
  @JsonKey(name: 'server_type')
  final String? serverType;
  @JsonKey(name: 'stream_start')
  final String? streamStart;

  @JsonKey(name: 'stream_start_iso8601')
  final String? streamStartISO;
  final String? subtype;

  final List<String> images;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class IceStats {
  IceStats(this.admin, this.host, this.location, this.serverId,
      this.serverStart, this.serverStartISO, this.source);

  final String admin;
  final String host;
  final String location;

  @JsonKey(name: 'server_id')
  final String serverId;

  @JsonKey(name: 'server_start')
  final String serverStart;

  @JsonKey(name: 'server_start_iso8601')
  final String serverStartISO;

  final Source source;

  factory IceStats.fromJson(Map<String, dynamic> json) =>
      _$IceStatsFromJson(json);

  Map<String, dynamic> toJson() => _$IceStatsToJson(this);
}

@JsonSerializable()
class Playlist {
  Playlist(this.icestats);

  final IceStats icestats;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
