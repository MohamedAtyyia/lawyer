import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

class VoidMessage1 extends StatelessWidget {
  const VoidMessage1({super.key, required this.url, required this.isMyaudio});
  final String url;
  final bool isMyaudio;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isMyaudio == true ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 8,
          right: 8,
        ),
        child: VoiceMessageView(
            innerPadding: 12,
            cornerRadius: 20,
            controller: VoiceController(
              audioSrc: url,
              maxDuration: const Duration(seconds: 10),
              isFile: false,
              onComplete: () {
                /// do something on complete
              },
              onPause: () {
                /// do something on pause
              },
              onPlaying: () {
                /// do something on playing
              },
              onError: (err) {
                /// do somethin on error
              },
            )),
      ),
    );
  }
}
