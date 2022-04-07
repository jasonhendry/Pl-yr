import 'package:json_annotation/json_annotation.dart';

part 'station_playlist_sample.g.dart';

@JsonSerializable()
class PlaylistItem {
  PlaylistItem(this.album, this.artist, this.title, this.image, this.purchase);

  @JsonKey(name: 'Album')
  final String album;
  @JsonKey(name: 'Artist')
  final String artist;
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'Image')
  final String image;
  @JsonKey(name: 'Purchase')
  final String purchase;

  factory PlaylistItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistItemToJson(this);
}

@JsonSerializable()
class NowPlaying {
  NowPlaying(
      this.last3, this.last2, this.last1, this.current, this.next1, this.next2);

  @JsonKey(name: 'Last3')
  final PlaylistItem last3;
  @JsonKey(name: 'Last2')
  final PlaylistItem last2;
  @JsonKey(name: 'Last1')
  final PlaylistItem last1;
  @JsonKey(name: 'Current')
  final PlaylistItem current;
  @JsonKey(name: 'Next1')
  final PlaylistItem next1;
  @JsonKey(name: 'Next2')
  final PlaylistItem next2;

  factory NowPlaying.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

@JsonSerializable()
class Playlist {
  Playlist(this.nowplaying);

  final NowPlaying nowplaying;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
