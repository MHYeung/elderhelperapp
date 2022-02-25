import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/global_widgets/global_appbar/global_appbar.dart';
import 'package:helper/pages/audio_player/audio_controller.dart';

class AudioPlayerScreen extends StatelessWidget {
  AudioPlayerScreen({Key? key}) : super(key: key);

  final audio = Get.find<AudioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Audio Player',
      ),
      body: Obx(
        () => audio.isLoaded.value ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FractionallySizedBox(child: Text(audio.songTitle.value)),
              Expanded(child: Image.network('https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bXVzaWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', fit: BoxFit.cover,),),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: audio.shuffle,
                        icon: Icon(
                          Icons.shuffle,
                          color: audio.isShuffle.value
                              ? Colors.deepPurpleAccent
                              : Colors.grey,
                        )),
                    IconButton(
                        onPressed: audio.previous,
                        icon: const Icon(Icons.skip_previous)),
                    IconButton(
                      onPressed: audio.playOrPause,
                      icon: Icon(
                          audio.isPlaying.value ? Icons.pause : Icons.play_arrow),
                    ),
                    IconButton(
                        onPressed: audio.next, icon: const Icon(Icons.skip_next)),
                  ],
                ),
              ),
            ],
          ) : const Center(child: CircularProgressIndicator(),),
        ),
    );
  }
}
