import 'package:al_mostashar_lawyer/VIEW/Component/component.dart';
import 'package:animate_do/animate_do.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../CONTROLLER/App Constant/api.dart';
import '../../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../../CONTROLLER/App Constant/handle_error.dart';
import '../../../../../CONTROLLER/App Constant/text.dart';
import '../../../../../CONTROLLER/Auth/Auth.dart';
import '../../../../../CONTROLLER/Chat/Notification/push_notification.dart';
import '../../../../../CONTROLLER/Home Nav/Consulting/consulting.dart';
import '../../../../../CONTROLLER/Home Nav/methods.dart';
import '../../../../../MODEL/Consulting/consulting_detail.dart';
import '../../../home_nav.dart';
import 'component.dart';

class GeneralConsulting extends StatefulWidget {
  GeneralConsulting(
      {super.key,
      required this.consultingID,
      required this.pageNumber,
      this.consultingPrice});
  String consultingID;
  String? consultingPrice;
  int pageNumber;
  @override
  State<GeneralConsulting> createState() => _GeneralConsultingState();
}

class _GeneralConsultingState extends State<GeneralConsulting> {
  ConsultingController consultingController = Get.put(ConsultingController());
  Auth auth = Get.put(Auth());
  Methods methods = Get.put(Methods());
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late bool isLoading = false;
  TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customBlurryModal(
      isLoading: isLoading,
      circleSize: 30,
      widget: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            context,
            widget.pageNumber == 0
                ? 'استشاره عامة'
                : widget.pageNumber == 1
                    ? 'استشاره خاصة'
                    : 'طلبات التفويض'),
        body: FutureBuilder<ConsultingDetail?>(
            future: consultingController.consultingDetail(
                consultingID: widget.consultingID, id: Api.id),
            builder: (context, snapshot) {
              ConsultingDetail? item = snapshot.data;
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();

                      return true;
                    },
                    child: FlipInY(
                      child: ListView(
                        children: [
                          customLawyerCard3(
                            text: item!.userFirstName!.isNotEmpty
                                ? '${item.userFirstName ?? ''} ${item.userFamilyName ?? ''}'
                                : 'لم يتم تحديد المحامي بعد',
                            sizedHeight: 60.h,
                            image: '${Api.upload}${item.userImage}',
                            consultingName:
                                '${item.mainConsultingName} - ${item.subConsultingName ?? item.unDefinedSubConsultingName}',
                            status: item.requestStatus ?? '',
                            price: item.createdBy == null
                                ? widget.consultingPrice == null
                                    ? 'لا يوجد'
                                    : widget.consultingPrice!
                                : '${item.createdBy} ريال ',
                            widget: const SizedBox(),
                          ),
                          TextApp.smallheightSpace(30),
                          TextApp.customText(
                              text: 'تفاصيل الاستشارة',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorsApp.primary_color),
                          Notes(
                            notes: item.notes ?? item.requestText ?? '',
                          ),
                          TextApp.customText(
                              text: 'الصور والصوتيات والملفات المرفقة',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorsApp.primary_color),
                          TextApp.smallheightSpace(8),
                          item.requestAudio != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {});
                                        if (isPlaying) {
                                          await audioPlayer
                                              .pause()
                                              .then((value) {
                                            setState(() {
                                              isPlaying = false;
                                            });
                                          });
                                        } else {
                                          await audioPlayer
                                              .play(UrlSource(
                                                  '${Api.upload}${item.requestAudio}'))
                                              .then((value) {
                                            setState(() {
                                              isPlaying = true;
                                            });
                                          });
                                        }
                                      },
                                      child: Icon(isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                    ),
                                    TextApp.smallwidthSpace(20),
                                    AudioWave(
                                      height: 30.h,
                                      width: 280.w,
                                      spacing: 2.5,
                                      animation: isPlaying,
                                      alignment: 'center',
                                      bars: TextApp.audioBar2,
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          TextApp.smallheightSpace(14),
                          item.requestDocument != null
                              ? Container(
                                  height: 124.h,
                                  margin: EdgeInsets.only(bottom: 19.w),
                                  width: double.infinity,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    children: [
                                      if (item.requestDocument != null)
                                        CustomField(
                                          splittedFile: item.requestDocument!
                                              .split('.')
                                              .last,
                                          fileUrl:
                                              '${Api.upload}${item.requestDocument}',
                                          imageUrl:
                                              '${Api.upload}${item.requestDocument}',
                                        ),
                                      if (item.requestDocument2 != null)
                                        CustomField(
                                          splittedFile: item.requestDocument2!
                                              .split('.')
                                              .last,
                                          fileUrl:
                                              '${Api.upload}${item.requestDocument2}',
                                          imageUrl:
                                              '${Api.upload}${item.requestDocument2}',
                                        ),
                                      if (item.requestDocument3 != null)
                                        CustomField(
                                          splittedFile: item.requestDocument3!
                                              .split('.')
                                              .last,
                                          fileUrl:
                                              '${Api.upload}${item.requestDocument3}',
                                          imageUrl:
                                              '${Api.upload}${item.requestDocument3}',
                                        ),
                                      if (item.requestDocument4 != null)
                                        CustomField(
                                          splittedFile: item.requestDocument4!
                                              .split('.')
                                              .last,
                                          fileUrl:
                                              '${Api.upload}${item.requestDocument4}',
                                          imageUrl:
                                              '${Api.upload}${item.requestDocument4}',
                                        ),
                                      if (item.requestDocument5 != null)
                                        CustomField(
                                          splittedFile: item.requestDocument5!
                                              .split('.')
                                              .last,
                                          fileUrl:
                                              '${Api.upload}${item.requestDocument5}',
                                          imageUrl:
                                              '${Api.upload}${item.requestDocument5}',
                                        ),
                                      if (item.imageOne != null)
                                        CustomField(
                                          splittedFile:
                                              item.imageOne!.split('.').last,
                                          fileUrl:
                                              '${Api.upload}${item.imageOne}',
                                          imageUrl:
                                              '${Api.upload}${item.imageOne}',
                                        ),
                                      if (item.imageTwo != null)
                                        CustomField(
                                          splittedFile:
                                              item.imageTwo!.split('.').last,
                                          fileUrl:
                                              '${Api.upload}${item.imageTwo}',
                                          imageUrl:
                                              '${Api.upload}${item.imageTwo}',
                                        ),
                                      if (item.imageThree != null)
                                        CustomField(
                                          splittedFile:
                                              item.imageThree!.split('.').last,
                                          fileUrl:
                                              '${Api.upload}${item.imageThree}',
                                          imageUrl:
                                              '${Api.upload}${item.imageThree}',
                                        ),
                                      if (item.imageFour != null)
                                        CustomField(
                                          splittedFile:
                                              item.imageFour!.split('.').last,
                                          fileUrl:
                                              '${Api.upload}${item.imageFour}',
                                          imageUrl:
                                              '${Api.upload}${item.imageFour}',
                                        ),
                                      if (item.imageFive != null)
                                        CustomField(
                                          splittedFile:
                                              item.imageFive!.split('.').last,
                                          fileUrl:
                                              '${Api.upload}${item.imageFive}',
                                          imageUrl:
                                              '${Api.upload}${item.imageFive}',
                                        ),
                                    ],
                                  ),
                                )
                              : const WithNoAttach(),
                          TextApp.smallheightSpace(29),
                          widget.pageNumber == 1
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: customButton(
                                        text: widget.pageNumber == 0
                                            ? 'تقديم عرض'
                                            : widget.pageNumber == 2
                                                ? 'قبول التفويض'
                                                : 'قبول الإستشارة',
                                        color: ColorsApp.primary_color,
                                        textColor: Colors.white,
                                        height: 56.h,
                                        onTap: () async {
                                          if (widget.pageNumber == 2) {
                                            CustomBottomSheet(
                                                context, priceController, () {
                                              consultingController
                                                  .approveDelegationOffer(
                                                consultingID:
                                                    widget.consultingID,
                                                id: Api.id,
                                                price:
                                                    priceController.text.trim(),
                                              )
                                                  .then((val) {
                                                auth
                                                    .getPersonalData(
                                                        id: item.userId ?? '')
                                                    .then((value) {
                                                  APIs.sendDelegationNotification(
                                                    consultingID:
                                                        widget.consultingID,
                                                    consultingPrice: val[
                                                            'value']['myModel'][
                                                        'delegationValueSentFromLawyer'],
                                                    fcmToken:
                                                        value!.deviceToken,
                                                    channelID: '2',
                                                    title: widget.consultingID,
                                                    msg:
                                                        "ارسل المحامي ${val['value']['myModel']['lawyerName'] ?? ''} ${val['value']['myModel']['lawyerFamilyName'] ?? ''} عرض سعر ${val['value']['myModel']['delegationValueSentFromLawyer']} ريال للموافقة عليه",
                                                  );
                                                }).then((value) {
                                                  HandleError.showToasts(
                                                      msg: 'تم إرسال عرض السعر',
                                                      color: Colors.green);
                                                });

                                                priceController.clear();
                                                Get.back();
                                              });
                                            });
                                          } else {
                                            CustomOfferBottomSheet(
                                                context, priceController, () {
                                              setState(() {
                                                consultingController
                                                    .submitOffer(
                                                  userID: Api.id,
                                                  price: priceController.text
                                                      .trim(),
                                                  consultingID:
                                                      widget.consultingID,
                                                  lawyerID: Api.id,
                                                )
                                                    .then((val) {
                                                  if (val == null) {
                                                    HandleError.showToasts(
                                                        msg:
                                                            'تم تقديم عرض مسبقا',
                                                        color: Colors.red);
                                                    Get.back();
                                                    priceController.clear();
                                                  } else {
                                                    HandleError.showToasts(
                                                        msg: 'تم تقديم العرض',
                                                        color: Colors.green);
                                                    priceController.clear();
                                                    Get.back();
                                                    auth
                                                        .getPersonalData(
                                                            id: item.userId ??
                                                                '')
                                                        .then((value) {
                                                      auth
                                                          .getPersonalData(
                                                              id: Api.id)
                                                          .then((value2) {
                                                        APIs.sendPushNotification(
                                                            fcmToken: value!
                                                                .deviceToken,
                                                            msg:
                                                                'تم تقديم عرض من المحامي ${value2!.firstName ?? ''} ${value2.familyName ?? ''}',
                                                            title: 'عرض مقدم',
                                                            channelID: '3');
                                                      });
                                                    });
                                                    // send notification here to user to tell him the cosulting is approved
                                                  }
                                                });
                                              });
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    TextApp.smallwidthSpace(10),
                                    RejectConsulting(
                                      onTap: () async {
                                        Get.back();
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds: 5), () {
                                          setState(() {
                                            consultingController
                                                .rejectConsulting(
                                                    consultingID:
                                                        widget.consultingID,
                                                    lawyerID: Api.id)
                                                .then((value) {
                                              if (value == null) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: TextApp.customText(
                                                      text: 'حدث خطأ',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: Colors.white),
                                                  backgroundColor:
                                                      ColorsApp.primary_color,
                                                ));
                                              } else {
                                                Get.offAll(
                                                    () => const HomeNav());
                                              }
                                            });
                                          });
                                        });
                                      },
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return HandleError.checkInternetConnection;
              }
              return HandleError.generalConsulting;
            }),
      ),
    );
  }
}
