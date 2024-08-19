import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class GetData extends GetxController {
  final recorder = FlutterSoundRecorder();
  int randomNumber = 1;
  bool isRecorderReady = false;
  File? audioFile;
  String? url;
  String? urlFile;
  PlatformFile? pickedFile;

  void generateRandomNumber() {
    Random random = Random();
    randomNumber = random.nextInt(450) + 1;
    update();
  }

  Future record() async {
    if (!isRecorderReady) return;
    print('object');
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return null;
    final path = await recorder.stopRecorder();
    if (path != null) {
      audioFile = File(path);
      await _uploadToFirebase(audioFile!);
    }
    return null;
  }

  Future _uploadToFirebase(File file) async {
    try {
      final fileName = file.path.split('/').last;
      final storageRef =
          FirebaseStorage.instance.ref().child('recordings/$fileName');
      final uploadTask = storageRef.putFile(file);
      print('ahed');
      final snapshot = await uploadTask;
      url = await snapshot.ref.getDownloadURL();
      print('aklsndlkasnd');
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future initRecording() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'لا يعمل الميكرفون';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  // Future<void> pickFile() async {
  //   final result = await FilePicker.platform
  //       .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
  //   if (result == null) return;
  //   pickedFile = result.files.first;
  //   if (pickedFile != null) {
  //     await uploadFile(File(pickedFile!.path!));
  //   }
  // }

  // Future<void> uploadFile(File file) async {
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref();
  //     final fileRef = storageRef.child('file/${pickedFile!.name}');
  //     // Upload the file
  //     final uploadTask = fileRef.putFile(file);
  //     // Monitor upload progress
  //     uploadTask.snapshotEvents.listen((event) {
  //       double progress =
  //           (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
  //               100;
  //     });
  //     // Wait until the upload is complete
  //     await uploadTask.whenComplete(() => print('Upload complete'));
  //     urlFile = await fileRef.getDownloadURL();
  //     print(urlFile);
  //     print('>>>>>>>>>>>>>>>>');
  //   } catch (e) {
  //     print('Failed to upload file: $e');
  //   }
  // }
}
