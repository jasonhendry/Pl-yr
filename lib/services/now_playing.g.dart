// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return MetaData(
    json['playing'] as String,
    json['timestamp'] as String,
  );
}

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'playing': instance.playing,
      'timestamp': instance.timestamp,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    (json['title'] as List<dynamic>).map((e) => e as String).toList(),
    (json['artist'] as List<dynamic>).map((e) => e as String).toList(),
    (json['album'] as List<dynamic>).map((e) => e as String).toList(),
    (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
    (json['kind'] as List<dynamic>).map((e) => e as String).toList(),
    (json['track'] as List<dynamic>).map((e) => e as String).toList(),
    (json['year'] as List<dynamic>).map((e) => e as String).toList(),
    (json['comments'] as List<dynamic>).map((e) => e as String).toList(),
    (json['time'] as List<dynamic>).map((e) => e as String).toList(),
    (json['bitrate'] as List<dynamic>).map((e) => e as String).toList(),
    (json['disc'] as List<dynamic>).map((e) => e as String).toList(),
    (json['playCount'] as List<dynamic>).map((e) => e as String).toList(),
    (json['compilation'] as List<dynamic>).map((e) => e as String).toList(),
    (json['composer'] as List<dynamic>).map((e) => e as String).toList(),
    (json['grouping'] as List<dynamic>).map((e) => e as String).toList(),
    (json['urlSource'] as List<dynamic>).map((e) => e as String).toList(),
    (json['file'] as List<dynamic>).map((e) => e as String).toList(),
  )..images =
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList();
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'album': instance.album,
      'genre': instance.genre,
      'kind': instance.kind,
      'track': instance.track,
      'year': instance.year,
      'comments': instance.comments,
      'time': instance.time,
      'bitrate': instance.bitrate,
      'disc': instance.disc,
      'playCount': instance.playCount,
      'compilation': instance.compilation,
      'composer': instance.composer,
      'grouping': instance.grouping,
      'urlSource': instance.urlSource,
      'file': instance.file,
      'images': instance.images,
    };

NowPlaying _$NowPlayingFromJson(Map<String, dynamic> json) {
  return NowPlaying(
    MetaData.fromJson(json[r'$'] as Map<String, dynamic>),
    (json['song'] as List<dynamic>)
        .map((e) => Song.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NowPlayingToJson(NowPlaying instance) =>
    <String, dynamic>{
      r'$': instance.metadata,
      'song': instance.song,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
    NowPlaying.fromJson(json['now_playing'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'now_playing': instance.nowPlaying,
    };
