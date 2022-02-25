import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';


class AudioController extends GetxController {
 final List<AudioSource> playList = [
    AudioSource.uri(Uri.parse('http://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3'), tag: "Song1"),
   AudioSource.uri(Uri.parse('http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3'), tag: "Song2"),
   AudioSource.uri(Uri.parse('https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3'), tag: "Song3"),
   AudioSource.uri(Uri.parse('https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3'), tag: "Song4"),
   AudioSource.uri(Uri.parse('https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3'), tag: "Song5"),
  ];



  late AudioPlayer _audioPlayer;

  var isPlaying = false.obs;
  var isLoaded = false.obs;
  var isShuffle = false.obs;
  var songTitle = ''.obs;

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    _audioPlayer = AudioPlayer();
    fetchSongs();
    isLoaded.value = false;
    super.onInit();
  }

  Future<void> fetchSongs() async {
    await _audioPlayer
        .setAudioSource(
            ConcatenatingAudioSource(
                children: playList,
                useLazyPreparation: true,
                shuffleOrder: DefaultShuffleOrder()),
            initialPosition: Duration.zero,
            initialIndex: 0)
        .catchError((error) {
      debugPrint("An error occurred $error");
    });
    songTitle.value =
        await _audioPlayer.sequenceState?.currentSource?.tag as String;
    isLoaded.value = true;
  }

  Future<void> playOrPause() async {
    if (_audioPlayer.playing && isPlaying.value == true) {
      isPlaying.value = false;
      update();
      await _audioPlayer.pause();
    } else if (!_audioPlayer.playing && isPlaying.value == false) {
      isPlaying.value = true;
      update();
      await _audioPlayer.play();
    }
  }

  Future<void> previous() async {
    _audioPlayer.hasPrevious ? await _audioPlayer.seekToPrevious() : null;
    songTitle.value =
        await _audioPlayer.sequenceState?.currentSource?.tag as String;
  }

  Future<void> next() async {
    _audioPlayer.hasNext ? await _audioPlayer.seekToNext() : null;
    songTitle.value =
        await _audioPlayer.sequenceState?.currentSource?.tag as String;
  }

  Future<void> shuffle() async {
    isShuffle.value = !isShuffle.value;
    if (isShuffle.value) {
      await _audioPlayer.shuffle();
    }
    await _audioPlayer.setShuffleModeEnabled(isShuffle.value);
    update();
  }
}
