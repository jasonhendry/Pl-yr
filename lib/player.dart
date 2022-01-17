import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:basemental/page_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:basemental/services/service_locator.dart';
import 'package:basemental/notifiers/play_button_notifier.dart';
import 'package:basemental/notifiers/progress_notifier.dart';
import 'package:basemental/notifiers/repeat_button_notifier.dart';

// from this article
// https://suragch.medium.com/background-audio-in-flutter-with-audio-service-and-just-audio-3cce17b4a7d

/* void main() async {
  await setupServiceLocator();
  runApp(MyApp());
}
 */
class Player extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Player> {
  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
              child: // AspectRatio(aspectRatio: 1, child:
                  CurrentBackgroundImage()),
          //),
          Column(
            children: [
              Expanded(
                child: Text("DJDirtyDaddy"),
              ),
              //Playlist(),
              CurrentSongTitle(),
              //AudioProgressBar(),
              AudioControlButtons(),
            ],
          ),
        ],
      ),
    );
  }
} // class

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Column(
      children: [
        ValueListenableBuilder<String>(
          valueListenable: pageManager.currentArtistNotifier,
          builder: (_, title, __) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(title),
            );
          },
        ),
        ValueListenableBuilder<String>(
          valueListenable: pageManager.currentSongTitleNotifier,
          builder: (_, title, __) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title),
            );
          },
        ),
      ],
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Expanded(
      child: ValueListenableBuilder<List<String>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (context, playlistTitles, _) {
          return ListView.builder(
            itemCount: playlistTitles.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Color(0x807f7f7f),
                title: Text('${playlistTitles[index]}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

class AddRemoveSongButtons extends StatelessWidget {
  const AddRemoveSongButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: pageManager.remove,
            child: Icon(Icons.remove),
          ),
          ElevatedButton(
            onPressed: pageManager.add,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //RepeatButton(),
          //PreviousSongButton(),
          PlayButton(),
          //NextSongButton(),
          //ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = Icon(Icons.repeat, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one);
            break;
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat);
            break;
        }
        return ElevatedButton(
          child: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return ElevatedButton(
          child: Icon(Icons.skip_previous),
          onPressed: (isFirst) ? null : pageManager.previous,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return ElevatedButton(
              child: const Icon(Icons.play_arrow),
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return ElevatedButton(
              child: const Icon(Icons.stop),
              onPressed: pageManager.stop,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return ElevatedButton(
          child: Icon(Icons.skip_next),
          onPressed: (isLast) ? null : pageManager.next,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return ElevatedButton(
          child: (isEnabled)
              ? Icon(Icons.shuffle)
              : Icon(Icons.shuffle, color: Colors.grey),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}

class CurrentBackgroundImage extends StatelessWidget {
  const CurrentBackgroundImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentBackgroundNotifier,
      builder: (context, imageURL, child) {
        return Image.network(imageURL,
            fit: BoxFit.contain,
            frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) =>
                wasSynchronouslyLoaded
                    ? child
                    : AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeOut,
                      ),
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/cds.png',
                fit: BoxFit.contain,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                        bool wasSynchronouslyLoaded) =>
                    wasSynchronouslyLoaded
                        ? child
                        : AnimatedOpacity(
                            child: child,
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeOut,
                          ),
              );
            });
      },
    );
  }
}
