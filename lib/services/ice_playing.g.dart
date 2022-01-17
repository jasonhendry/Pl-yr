// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    json['artist'] as String?,
    json['audio_bitrate'] as int?,
    json['audio_channels'] as int?,
    json['audio_info'] as String?,
    json['audio_samplerate'] as int?,
    json['channels'] as int?,
    json['genre'] as String?,
    json['ice-bitrate'] as int?,
    json['listener_peak'] as int?,
    json['listeners'] as int?,
    json['listenurl'] as String?,
    (json['quality'] as num?)?.toDouble(),
    json['samplerate'] as int?,
    json['server_description'] as String?,
    json['server_name'] as String?,
    json['server_type'] as String?,
    json['stream_start'] as String?,
    json['stream_start_iso8601'] as String?,
    json['subtype'] as String?,
    json['title'] as String?,
    (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'artist': instance.artist,
      'title': instance.title,
      'audio_bitrate': instance.audioBitrate,
      'audio_channels': instance.audioChannels,
      'audio_info': instance.audioInfo,
      'audio_samplerate': instance.audioSamplerate,
      'channels': instance.channels,
      'genre': instance.genre,
      'ice-bitrate': instance.iceBitrate,
      'listener_peak': instance.listenerPeak,
      'listeners': instance.listeners,
      'listenurl': instance.listenURL,
      'quality': instance.quality,
      'samplerate': instance.samplerate,
      'server_description': instance.serverDescription,
      'server_name': instance.serverName,
      'server_type': instance.serverType,
      'stream_start': instance.streamStart,
      'stream_start_iso8601': instance.streamStartISO,
      'subtype': instance.subtype,
      'images': instance.images,
    };

IceStats _$IceStatsFromJson(Map<String, dynamic> json) {
  return IceStats(
    json['admin'] as String,
    json['host'] as String,
    json['location'] as String,
    json['server_id'] as String,
    json['server_start'] as String,
    json['server_start_iso8601'] as String,
    Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IceStatsToJson(IceStats instance) => <String, dynamic>{
      'admin': instance.admin,
      'host': instance.host,
      'location': instance.location,
      'server_id': instance.serverId,
      'server_start': instance.serverStart,
      'server_start_iso8601': instance.serverStartISO,
      'source': instance.source,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
    IceStats.fromJson(json['icestats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'icestats': instance.icestats,
    };
