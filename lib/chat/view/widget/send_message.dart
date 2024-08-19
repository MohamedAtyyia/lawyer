import 'dart:async';
import 'dart:io';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/api.dart';
import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/colors.dart';
import 'package:al_mostashar_lawyer/chat/data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';
enum FileState {
  init,
  loaded,
  failure,
  loading,
}

class SendMessage extends StatefulWidget {
  const SendMessage({
    super.key,
    required this.id,
    required this.controller,
    required this.user,
    required this.id2,
    required this.isSendMessagel,
    required this.idRoom,
  });
  final ScrollController controller;
  final String id;
  final String id2;
  final String user;
  final String idRoom;
  final bool isSendMessagel;

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  late TextEditingController controller;
  late CollectionReference chat;
  File? _image;
  String? urlImage;
  String? pathName;
  bool isLoading = false;
  bool isRecording = false;
  File? audioFile;
  String? url;
  String? urlFile;
  PlatformFile? pickedFile;

  GetData methods = Get.put(GetData());
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    chat = FirebaseFirestore.instance
        .collection('chat')
        .doc(widget.idRoom)
        .collection('message');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _image == null
              ? SizedBox()
              : Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.file(
                          _image!,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        _image = null;
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: ColorsApp.primary_color,
                        child: Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
          Align(alignment: Alignment.centerRight, child: showLoadFile()),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min, // هذا السطر مهم

            children: [
              isRecording == true
                  ? showTim()
                  : Expanded(
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (widget.isSendMessagel &&
                                      controller.text.length == 0 &&
                                      pickedFile == null &&
                                      _image == null) {
                                    isRecording = true;
                                    setState(() {});
                                    await methods.record();
                                  }
                                },
                                child: Icon(
                                  Icons.mic,
                                  size: 22,
                                ),
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () async {
                                  if (widget.isSendMessagel &&
                                      pickedFile == null) {
                                    await _pickImage();
                                  }
                                },
                                child: Icon(
                                  Icons.image,
                                  size: 22,
                                ),
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () async {
                                  if (!widget.isSendMessagel &&
                                      _image == null &&
                                      controller.text.isEmpty) {
                                    try {
                                      Future.delayed(
                                        Duration(milliseconds: 400),
                                        () {
                                          fileState = FileState.loading;
                                          setState(
                                            () {},
                                          );
                                        },
                                      );
                                      await pickFile();
                                    } catch (e) {
                                      fileState = FileState.failure;
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Icon(
                                  Icons.attach_file,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          hintText: 'كتب الرسالة..',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onChanged: (value) {
                          controller.text = value;
                        },
                      ),
                    ),
              isRecording == true
                  ? Spacer(flex: 1)
                  : SizedBox(
                      width: 15,
                    ),
              isLoading == false
                  ? InkWell(
                      onTap: () async {
                        if (widget.isSendMessagel) {
                          try {
                            isLoading = true;
                            setState(() {});
                            await sendVoice();
                            await sendFile();
                            await sendImageOrText();
                            isLoading = false;
                            setState(() {});
                          } catch (e) {
                            isLoading = false;
                            setState(() {});
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'ميعاد الاستشارة انتهى لن تتمكن من ارسال رسالة اخرى ',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 4,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorsApp.primary_color,
                        radius: 22,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    )
                  : CircularProgressIndicator()
            ],
          ),
        ],
      ),
    );
  }

  Future sendVoice() async {
    if (isRecording) {
      await methods.stop();
      await chat.add({
        'message': controller.text,
        'id': Api.id,
        'date': DateTime.now(),
        'image': urlImage ?? null,
        "lawyer": 'huseen',
        "user": widget.user,
        "audio": methods.url
      });
      isRecording = false;
      setState(() {});
    }
  }

  Future sendImageOrText() async {
    if ((_image != null || controller.text.isNotEmpty) && pickedFile == null) {
      if (_image != null) {
        pathName = basename(_image!.path);
      }
      final storage = FirebaseStorage.instance.ref(pathName);
      if (_image != null) {
        await storage.putFile(_image!);
        urlImage = await storage.getDownloadURL();
      }
      await chat.add({
        'message': controller.text,
        'id': Api.id,
        'date': DateTime.now(),
        'image': urlImage ?? null,
        "lawyer": 'huseen',
        "user": widget.user
      });
      controller.clear();
      _image = null;
      urlImage = null;
      isLoading = false;
      widget.controller.animateTo(
        widget.controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOutCubicEmphasized,
      );
      setState(() {});
    }
  }

  Future sendFile() async {
    if (pickedFile != null) {
      await uploadFile(File(pickedFile!.path!));

      await chat.add({
        'message': controller.text,
        'id': Api.id,
        'date': DateTime.now(),
        'image': null,
        "lawyer": 'huseen',
        "user": widget.user,
        "audio": null,
        "file": urlFile
      });
      if (controller.text.isNotEmpty) {
        controller.clear();
      }
      fileState = FileState.init;
      setState(() {});
    }
  }

  Widget showTim() {
    return StreamBuilder<RecordingDisposition>(
      stream: methods.recorder.onProgress,
      builder: (context, snapshot) {
        final duration =
            snapshot.hasData ? snapshot.data!.duration : Duration.zero;
        final minutes =
            duration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds =
            duration.inSeconds.remainder(60).toString().padLeft(2, '0');
        return Text('$minutes : $seconds');
      },
    );
  }

  Widget showLoadFile() {
    if (fileState == FileState.loading) {
      return Container(
        width: 170,
        height: 50,
        alignment: Alignment.center,
        // padding: EdgeInsets.on,
        decoration: BoxDecoration(
            color: ColorsApp.primary_color,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'يتم تحميل الملف ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      );
    } else if (fileState == FileState.loaded) {
      return InkWell(
        onTap: () {
          fileState = FileState.init;
          pickedFile = null;
          setState(() {});
        },
        child: Container(
          width: 140,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorsApp.primary_color,
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'تم تحميل الملف',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'اضغط ل الالغاء',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
    if (result == null) {
      fileState = FileState.init;
      setState(() {});
      return;
    }
    pickedFile = result.files.first;
    if (pickedFile != null) {
      await uploadFile(File(pickedFile!.path!));
    }
  }

  Future<void> uploadFile(File file) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child('file/${pickedFile!.name}');
      final uploadTask = fileRef.putFile(file);
      uploadTask.snapshotEvents.listen((event) {});
      await uploadTask.whenComplete(() => print('Upload complete'));
      urlFile = await fileRef.getDownloadURL();
      fileState = FileState.loaded;
      setState(() {});
    } catch (e) {
      fileState = FileState.failure;
      setState(() {});
    }
  }
}

FileState fileState = FileState.init;
