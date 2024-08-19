import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';

import '../../../../CONTROLLER/Chat/send_audio.dart';

class StreamRecorder extends StatelessWidget {
  StreamRecorder({super.key});
  SendAudio sendAudio = Get.put(SendAudio());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RecordingDisposition>(
        stream: sendAudio.recorder.onProgress,
        builder: (context, snapshot) {
          final duration =
              snapshot.hasData ? snapshot.data!.duration : Duration.zero;
          String twoDigits(int n) => n.toString().padLeft(1);
          final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
          final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
          return Text('$twoDigitMinutes:$twoDigitSeconds');
        });
  }
}
