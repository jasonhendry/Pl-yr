import 'package:json_annotation/json_annotation.dart';

part 'now_playing.g.dart';

@JsonSerializable()
class MetaData {
  MetaData(this.playing, this.timestamp);

  String playing;
  String timestamp;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class Song {
  Song(
      this.title,
      this.artist,
      this.album,
      this.genre,
      this.kind,
      this.track,
      this.year,
      this.comments,
      this.time,
      this.bitrate,
      this.disc,
      this.playCount,
      this.compilation,
      this.composer,
      this.grouping,
      this.urlSource,
      this.file);

  List<String> title;
  List<String> artist;
  List<String> album;
  List<String> genre;
  List<String> kind;
  List<String> track;
  List<String> year;
  List<String> comments;
  List<String> time;
  List<String> bitrate;
  List<String> disc;
  List<String> playCount;
  List<String> compilation;
  List<String> composer;
  List<String> grouping;
  List<String> urlSource;
  List<String> file;
  List<String>? images;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}

@JsonSerializable()
class NowPlaying {
  NowPlaying(this.metadata, this.song);

  @JsonKey(name: '\$')
  MetaData metadata;
  List<Song> song;

  factory NowPlaying.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

@JsonSerializable()
class Playlist {
  Playlist(this.nowPlaying);

  @JsonKey(name: 'now_playing')
  final NowPlaying nowPlaying;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
