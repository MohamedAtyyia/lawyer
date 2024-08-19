import 'package:al_mostashar_lawyer/CONTROLLER/App%20Constant/handle_error.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate/rate.dart';
import '../../CONTROLLER/App Constant/colors.dart';
import '../../CONTROLLER/App Constant/image.dart';
import '../../CONTROLLER/App Constant/text.dart';
import '../Home Nav/Home Page/screen/custom_switch.dart';
import '../Home Nav/My Consulting/widget/count down/count_down.dart';

class customSmallButton extends StatelessWidget {
  customSmallButton(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});
  String text;
  String image;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorsApp.smallContainer_color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            TextApp.smallwidthSpace(10),
            TextApp.customText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class customSmallButton2 extends StatelessWidget {
  customSmallButton2(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});
  String text;
  String image;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorsApp.smallContainer_color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextApp.customText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white),
            TextApp.smallwidthSpace(10),
            SvgPicture.asset(image),
          ],
        ),
      ),
    );
  }
}

class customTextFiled extends StatelessWidget {
  customTextFiled(
      {Key? key,
      this.prefix,
      required this.validator,
      required this.text,
      this.suffix,
      required this.controller,
      required this.inputType,
      this.obscureText})
      : super(key: key);
  String text;
  Widget? prefix;
  Widget? suffix;
  TextEditingController controller = TextEditingController();
  TextInputType inputType;
  bool? obscureText = false;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText!,
        cursorColor: ColorsApp.primary_color,
        validator: validator,
        style: const TextStyle(
            fontFamily: 'tajwal',
            color: ColorsApp.primary_color,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: ColorsApp.grey,
          filled: true,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: text,
          hintStyle: TextStyle(
              fontFamily: 'tajwal',
              color: Colors.grey.shade200,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}

class customTextFiled2 extends StatelessWidget {
  customTextFiled2(
      {Key? key,
      this.prefix,
      this.suffix,
      required this.controller,
      required this.inputType,
      this.obscureText})
      : super(key: key);
  Widget? prefix;
  Widget? suffix;
  TextEditingController controller = TextEditingController();
  TextInputType inputType;
  bool? obscureText = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 57.w,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText!,
        cursorColor: ColorsApp.primary_color,
        style: const TextStyle(
            fontFamily: 'tajwal',
            color: ColorsApp.primary_color,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          fillColor: ColorsApp.grey,
          filled: true,
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
        ),
        onChanged: (val) {
          if (val.length == 1) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class customTextFiled4 extends StatelessWidget {
  customTextFiled4(
      {Key? key,
      this.prefix,
      required this.text,
      this.suffix,
      required this.maxline,
      required this.controller,
      required this.inputType,
      this.obscureText})
      : super(key: key);
  String text;
  Widget? prefix;
  Widget? suffix;
  int maxline;
  TextEditingController controller = TextEditingController();
  TextInputType inputType;
  bool? obscureText = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText!,
        cursorColor: ColorsApp.primary_color,
        maxLines: maxline,
        style: const TextStyle(
            fontFamily: 'tajwal',
            color: ColorsApp.primary_color,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: ColorsApp.grey,
          filled: true,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: text,
          hintStyle: TextStyle(
              fontFamily: 'tajwal',
              color: Colors.grey.shade300,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}

class customPriceField extends StatelessWidget {
  customPriceField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 80.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        cursorColor: ColorsApp.primary_color,
        style: const TextStyle(
            fontFamily: 'tajwal',
            color: ColorsApp.primary_color,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: ColorsApp.grey,
          filled: true,
          hintText: 'السعر',
          hintStyle: TextStyle(
              fontFamily: 'tajwal',
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}

class customButton extends StatelessWidget {
  customButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color,
      required this.height,
      required this.textColor});
  String text;
  VoidCallback onTap;
  Color color;
  Color textColor;
  double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: TextApp.customText(
            text: text,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: textColor),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({super.key, required this.onChange, required this.controller});
  void Function(String)? onChange;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        autofocus: true,
        cursorColor: ColorsApp.primary_color,
        style: const TextStyle(
            fontFamily: 'tajwal', fontSize: 14, color: Colors.grey),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: SvgPicture.asset(
            ImageApp.search,
            fit: BoxFit.scaleDown,
          ),
          hintText: 'بحث',
          hintStyle: const TextStyle(
              fontFamily: 'tajwal', fontSize: 14, color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

class customSearchBar extends StatelessWidget {
  const customSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: double.infinity,
      padding: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            ImageApp.search,
            fit: BoxFit.scaleDown,
          ),
          TextApp.smallwidthSpace(10),
          TextApp.customText(
              text: 'بحث',
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.grey)
        ],
      ),
    );
  }
}

class customLawyerCard4 extends StatelessWidget {
  customLawyerCard4(
      {super.key,
      required this.text,
      required this.image,
      required this.starRate,
      required this.date,
      required this.desc});
  String text;
  String image;
  String starRate;
  String desc;
  String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 24.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 70.h,
              width: 70.w,
              child: CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (context, url, progress) {
                  if (progress.progress != null) {
                    final percent = progress.progress! * 100;
                    return TextApp.customText(
                        text: '$percent%',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: ColorsApp.primary_color);
                  }
                  return HandleError.circleIndicator2;
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitWidth,
              )),
          TextApp.smallwidthSpace(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: TextApp.customText(
                      text: text,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorsApp.primary_color,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 1,
                    ),
                  ),
                  TextApp.customText(
                      text: date,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorsApp.primary_color,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 1),
                ],
              ),
              Rate(
                iconSize: 20,
                color: Colors.orange,
                allowHalf: true,
                allowClear: true,
                initialValue: double.parse(starRate) + 1,
                readOnly: true,
                onChange: (value) => print(value),
              ),
              TextApp.smallheightSpace(10),
              SizedBox(
                  width: 150.w,
                  child: TextApp.customText(
                      text: desc,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class customPersonalData extends StatelessWidget {
  customPersonalData(
      {super.key,
      required this.height,
      required this.widget,
      required this.width});
  double height;
  double width;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 7.h),
        padding: EdgeInsets.only(left: 10.w, right: 17.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: widget);
  }
}

class customLawyerCard3 extends StatelessWidget {
  customLawyerCard3(
      {Key? key,
      required this.image,
      required this.text,
      required this.widget,
      required this.sizedHeight,
      required this.consultingName,
      required this.price,
      required this.status})
      : super(key: key);
  String image;
  String text;
  Widget widget;
  double sizedHeight;
  String consultingName;
  String price;
  String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding:
          EdgeInsets.only(top: 16.h, left: 10.w, right: 10.w, bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          TextApp.smallheightSpace(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            image,
                          ),
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: sizedHeight,
                  ),
                ],
              ),
              TextApp.smallwidthSpace(7),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: TextApp.customText(
                        text: text,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorsApp.primary_color),
                  ),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: consultingName,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'الحالة : $status',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  TextApp.smallheightSpace(12),
                  TextApp.customText(
                      text: 'العرض المالي المقدم  : $price ',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade400),
                  widget,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class customUploadFile extends StatelessWidget {
  customUploadFile({Key? key, required this.onTap, required this.text})
      : super(key: key);
  String text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 132.h,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 17.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ColorsApp.whiteGrey,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageApp.squareLinear),
            TextApp.smallheightSpace(16),
            TextApp.customText(
                text: text,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorsApp.whiteGrey),
          ],
        ),
      ),
    );
  }
}

class customSalonDate extends StatefulWidget {
  customSalonDate(
      {Key? key,
      required this.dayName,
      required this.from,
      required this.to,
      required this.onChange,
      required this.onChangeTo,
      required this.dayDate,
      required this.switchValue,
      required this.onChangeAvaliable})
      : super(key: key);
  String dayName;
  String dayDate;
  String from;
  String to;
  void Function(String?)? onChange;
  void Function(String?)? onChangeTo;
  void Function(bool)? onChangeAvaliable;
  bool switchValue;
  @override
  State<customSalonDate> createState() => _customSalonDateState();
}

class _customSalonDateState extends State<customSalonDate> {
  String dropdownvalue2 = '1 مساءا';

  var item = [
    '1 صباحا',
    '2 صباحا',
    '3 صباحا',
    '4 صباحا',
    '5 صباحا',
    '6 صباحا',
    '7 صباحا',
    '8 صباحا',
    '9 صباحا',
    '10 صباحا',
    '11 صباحا',
    '12 صباحا',
    '1 مساءا',
    '2 مساءا',
    '3 مساءا',
    '4 مساءا',
    '5 مساءا',
    '6 مساءا',
    '7 مساءا',
    '8 مساءا',
    '9 مساءا',
    '10 مساءا',
    '11 مساءا',
    '12 مساءا',
  ];
  var item2 = [
    '1 صباحا',
    '2 صباحا',
    '3 صباحا',
    '4 صباحا',
    '5 صباحا',
    '6 صباحا',
    '7 صباحا',
    '8 صباحا',
    '9 صباحا',
    '10 صباحا',
    '11 صباحا',
    '12 صباحا',
    '1 مساءا',
    '2 مساءا',
    '3 مساءا',
    '4 مساءا',
    '5 مساءا',
    '6 مساءا',
    '7 مساءا',
    '8 مساءا',
    '9 مساءا',
    '10 مساءا',
    '11 مساءا',
    '12 مساءا',
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      elevation: 2,
      shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 86.h,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 5.w, left: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 60.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextApp.customText(
                      text: widget.dayName,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: ColorsApp.primary_color),
                  TextApp.smallheightSpace(5),
                  TextApp.customText(
                      text: widget.dayDate,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      color: ColorsApp.primary_color),
                ],
              ),
            ),
            // TextApp.smallwidthSpace(0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextApp.customText(
                      text: 'من',
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: ColorsApp.primary_color),
                  TextApp.smallwidthSpace(5),
                  Container(
                    height: 32.h,
                    width: 70.w,
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorsApp.primary_color)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        value: widget.from,
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ),
                          iconSize: 14,
                          iconEnabledColor: ColorsApp.primary_color,
                          iconDisabledColor: ColorsApp.primary_color,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 80,
                          openInterval: const Interval(
                              curve: Curves.easeInCirc, 0.25, 0.70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          elevation: 8,
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        isExpanded: true,
                        items: item.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: TextApp.customText(
                                text: items,
                                fontWeight: FontWeight.w700,
                                fontSize: 10.sp,
                                color: ColorsApp.primary_color),
                          );
                        }).toList(),
                        onChanged: widget.onChange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextApp.smallwidthSpace(5),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextApp.customText(
                      text: 'الى',
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: ColorsApp.primary_color),
                  TextApp.smallwidthSpace(5),
                  Container(
                    height: 32.h,
                    width: 70.w,
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorsApp.primary_color)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        value: widget.to,
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                          ),
                          iconSize: 14,
                          iconEnabledColor: ColorsApp.primary_color,
                          iconDisabledColor: ColorsApp.primary_color,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 80,
                          openInterval: const Interval(
                              curve: Curves.easeInCirc, 0.25, 0.70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          elevation: 8,
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        isExpanded: true,
                        items: item2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: TextApp.customText(
                                text: items,
                                fontWeight: FontWeight.w700,
                                fontSize: 10.sp,
                                color: ColorsApp.primary_color),
                          );
                        }).toList(),
                        onChanged: widget.onChangeTo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextApp.smallwidthSpace(10),
            CustomSwitch(
                value: widget.switchValue,
                height: 20.h,
                width: 40.w,
                switchHeight: 13.h,
                switchWidth: 13.w,
                enableColor: ColorsApp.primary_color,
                disableColor: Colors.grey.shade300,
                onChanged: widget.onChangeAvaliable),
          ],
        ),
      ),
    );
  }
}

class customTimer extends StatelessWidget {
  customTimer({super.key, required this.time});
  String time;
  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: int.parse(time),
      endWidget: TextApp.customText(
          text: 'بدأت الإستشارة',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: ColorsApp.default_color),
      textStyle: TextStyle(
          fontFamily: 'tajwal',
          fontSize: 12.sp,
          color: ColorsApp.default_color,
          fontWeight: FontWeight.w700),
    );
  }
}

class customBlurryModal extends StatelessWidget {
  customBlurryModal(
      {super.key,
      required this.isLoading,
      required this.widget,
      required this.circleSize});
  Widget widget;
  bool isLoading;
  double circleSize;
  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 4,
        progressIndicator: SpinKitFadingCircle(
          color: ColorsApp.primary_color,
          size: circleSize,
        ),
        dismissible: false,
        opacity: 0.4,
        color: ColorsApp.primary_color,
        child: widget);
  }
}

class showFileInConsulting extends StatelessWidget {
  showFileInConsulting({super.key, required this.child, required this.onTap});
  VoidCallback onTap;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 124.h,
          width: 185.w,
          margin: EdgeInsets.only(left: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ));
  }
}

class customCasheImage extends StatelessWidget {
  customCasheImage({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          )),
    );
  }
}

class customPDFFile extends StatelessWidget {
  customPDFFile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorsApp.primary_color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white,
            width: 1.w,
          )),
      child: TextApp.customText(
          text: 'ملف PDF',
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: Colors.white),
    );
  }
}
