import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/My%20Consulting/widget/canceled.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/My%20Consulting/widget/current.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/My%20Consulting/widget/custom_tab.dart';
import 'package:al_mostashar_lawyer/VIEW/Home%20Nav/My%20Consulting/widget/finished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CONTROLLER/App Constant/colors.dart';
import '../../../../CONTROLLER/App Constant/text.dart';
import '../../../CONTROLLER/App Constant/handle_error.dart';

class MyConsulting extends StatefulWidget {
  MyConsulting({Key? key}) : super(key: key);

  @override
  State<MyConsulting> createState() => _MyConsultingState();
}

class _MyConsultingState extends State<MyConsulting> {
  int _selectedItem = 1;
  @override
  void initState() {
    HandleError.toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60)),
                    gradient: LinearGradient(
                      colors: [
                        ColorsApp.primary_color,
                        ColorsApp.white12,
                        ColorsApp.primary_color,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: TextApp.customText(
                      text: 'استشاراتي',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, top: 130.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: customTapBarItem(
                            text: 'حالية',
                            textColor: Colors.white,
                            itemColor: _selectedItem == 1
                                ? ColorsApp.default_color
                                : ColorsApp.smallContainer_color,
                            borderColor: _selectedItem == 1
                                ? Colors.white
                                : ColorsApp.smallContainer_color,
                            onTap: () {
                              setState(() {
                                _selectedItem = 1;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: customTapBarItem(
                            text: 'منتهية',
                            textColor: Colors.white,
                            itemColor: _selectedItem == 2
                                ? ColorsApp.default_color
                                : ColorsApp.smallContainer_color,
                            borderColor: _selectedItem == 2
                                ? Colors.white
                                : ColorsApp.smallContainer_color,
                            onTap: () {
                              setState(() {
                                _selectedItem = 2;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: customTapBarItem(
                            text: 'ملغية',
                            textColor: Colors.white,
                            itemColor: _selectedItem == 3
                                ? ColorsApp.default_color
                                : ColorsApp.smallContainer_color,
                            borderColor: _selectedItem == 3
                                ? Colors.white
                                : ColorsApp.smallContainer_color,
                            onTap: () {
                              setState(() {
                                _selectedItem = 3;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: 190.h, bottom: 20.h),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();

                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (_selectedItem == 1) Current(),
                      if (_selectedItem == 2) Finished(),
                      if (_selectedItem == 3) Canceled(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class MyPainter extends CustomPainter {
//   final Color topLeftColor;

//   MyPainter({required this.topLeftColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     paint.color = topLeftColor;
//     paint.style = PaintingStyle.fill;
//     paint.strokeWidth = 12;

//     var path = Path();
//     path.lineTo(size.width/5, 0);
//     path.lineTo(0, size.height/2);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
// Container(
//                         width: 100,
//                         height: 100,
//                         margin: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(12),
//                             ),
//                         child: CustomPaint(
//                             painter: MyPainter(topLeftColor: ColorsApp.default_color),
//                             child: Text('Container')))



