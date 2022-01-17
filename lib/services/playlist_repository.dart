import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//import 'now_playing.dart';
import 'ice_playing.dart';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 1}) async {
    return List.generate(length, (index) => _nextSong());
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }

  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': 'DJ Dirty Daddy',
      'album': 'DJ Dirty Daddy',
      'url': 'https://oblivion.couchpotatofries.org:8443/source',
    };
  }
}

class IcePlaylist extends DemoPlaylist {
  final _socket = IO.io(
      'wss://oblivion.couchpotatofries.org:443',
      IO.OptionBuilder()
          .setTransports(["websocket"])
          .enableAutoConnect()
          .build());

  late Playlist _playlist;
  late StreamController<Playlist> _channelController;
  Stream<Playlist> get channel => _channelController.stream.asBroadcastStream();

  IcePlaylist() {
    _channelController = StreamController<Playlist>();
    _loadChannel();
    _listenToChangesInChannel();
  }

  Future<void> _loadChannel() async {
    _socket.onConnect((_) {
      _socket.emit('subscribeToPlaylist');
    });
  }

  void _listenToChangesInChannel() async {
    _socket.on('playlistChanged', (data) {
      print("IcePlaylist: Playlist changed");
      _playlist = Playlist.fromJson(jsonDecode(data));
      _channelController.sink.add(_playlist);
    });
  }

  void dispose() {
    print("IcePlaylist: Disposing of IcePlaylist");
    _channelController.close();
    _socket.dispose();
  }
}
