import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:math';
import './global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF2A2A2A),
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  final currentDate = DateTime.now(); // 현재 날짜 가져오기

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);

    final Size_Height = MediaQuery.of(context).size.height;
    final Size_Width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF2A2A2A),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF363535),
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 왼쪽 버튼 부분
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 버튼 4개
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: (Size_Height * 0.1),
                                  height: (Size_Height * 0.1),
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Size_Height * 0.1),
                                    color: Color(0xFF646667),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.meeting_room),
                                      onPressed: () {
                                        MessageView.showExitConfirmationDialog(
                                            context, Size_Width);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (Size_Height * 0.1),
                                  height: (Size_Height * 0.1),
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Size_Height * 0.1),
                                    color: Color(0xFF646667),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.settings),
                                      onPressed: () {
                                        Haptics.vibrate(HapticsType.light);
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (Size_Height * 0.1),
                                  height: (Size_Height * 0.1),
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Size_Height * 0.1),
                                    color: Color(0xFF646667),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: GlobalVariables.Community_Connect
                                          ? Icon(Icons.link)
                                          : Icon(Icons.link_off),
                                      onPressed: () {
                                        Haptics.vibrate(HapticsType.light);
                                        setState(() {
                                          GlobalVariables.Community_Connect =
                                              !GlobalVariables
                                                  .Community_Connect;
                                          if (GlobalVariables
                                              .Community_Connect) {
                                            GlobalVariables.Arm_Error = true;
                                            print(GlobalVariables
                                                .Community_Connect);
                                          } else {
                                            GlobalVariables.Arm_Error = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (Size_Height * 0.1),
                                  height: (Size_Height * 0.1),
                                  child: Container(
                                      decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Size_Height * 0.1),
                                    color: GlobalVariables.Arm_Error
                                        ? Color.fromARGB(255, 110, 232, 141)
                                        : Color(0xFFE86E6E),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ),

                          //Camera Angle
                          Container(
                            height: Size_Height * 0.37,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF454343),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Camera Angle',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFFF3F3F3),
                                      ),
                                    ),
                                    SizedBox(width: Size_Height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildCircularButton(
                                            context,
                                            Size_Height,
                                            0.15,
                                            0.1,
                                            true,
                                            false,
                                            true,
                                            false,
                                            0),
                                        SizedBox(width: Size_Height * 0.008),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildCircularButton(
                                                context,
                                                Size_Height,
                                                0.1,
                                                0.15,
                                                true,
                                                true,
                                                false,
                                                false,
                                                1),
                                            SizedBox(
                                                height: Size_Height * 0.008),
                                            Container(
                                              width: Size_Height * 0.08,
                                              height: Size_Height * 0.08,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF646667),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Size_Height * 0.08),
                                              ),
                                              child: Icon(Icons.cached),
                                            ),
                                            SizedBox(
                                                height: Size_Height * 0.008),
                                            _buildCircularButton(
                                                context,
                                                Size_Height,
                                                0.1,
                                                0.15,
                                                false,
                                                false,
                                                true,
                                                true,
                                                3),
                                          ],
                                        ),
                                        SizedBox(width: Size_Height * 0.008),
                                        _buildCircularButton(
                                            context,
                                            Size_Height,
                                            0.15,
                                            0.1,
                                            false,
                                            true,
                                            false,
                                            true,
                                            2),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //Camera View Translation
                          Container(
                            height: Size_Height * 0.37,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF454343),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Camera View Translation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFFF3F3F3),
                                      ),
                                    ),
                                    SizedBox(width: Size_Height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildCircularButton(
                                            context,
                                            Size_Height,
                                            0.15,
                                            0.1,
                                            true,
                                            false,
                                            true,
                                            false,
                                            4),
                                        SizedBox(width: Size_Height * 0.008),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildCircularButton(
                                                context,
                                                Size_Height,
                                                0.1,
                                                0.15,
                                                true,
                                                true,
                                                false,
                                                false,
                                                5),
                                            SizedBox(
                                                height: Size_Height * 0.008),
                                            Container(
                                              width: Size_Height * 0.08,
                                              height: Size_Height * 0.08,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF646667),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Size_Height * 0.08),
                                              ),
                                              child: Icon(Icons.control_camera),
                                            ),
                                            SizedBox(
                                                height: Size_Height * 0.008),
                                            _buildCircularButton(
                                                context,
                                                Size_Height,
                                                0.1,
                                                0.15,
                                                false,
                                                false,
                                                true,
                                                true,
                                                7),
                                          ],
                                        ),
                                        SizedBox(width: Size_Height * 0.008),
                                        _buildCircularButton(
                                            context,
                                            Size_Height,
                                            0.15,
                                            0.1,
                                            false,
                                            true,
                                            false,
                                            true,
                                            6),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 카메라 영상 & 데이터 출력 부
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9).withOpacity(0.5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x40000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    height: Size_Height * 0.65,
                                    padding: EdgeInsets.all(5),
                                    child: Container(
                                        decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFD9D9D9),
                                    ))),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    '상품명 :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (Size_Width * 0.025),
                                      color: Color(0xFFF3F3F3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    height: Size_Height * 0.1,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      GlobalVariables.Item_name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFF646667),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (Size_Width * 0.15),
                                  height: ((Size_Height * 0.1)),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Size_Height * 0.1),
                                    color: Color(0xFF646667),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      MessageView.showOverlayMessage(
                                          context, Size_Height, "Select버튼 클릭");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color(0xFF646667), // 버튼 색상
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Container(
                                      width: (Size_Width * 0.2),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Select',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: (Size_Width * 0.025),
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'X :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (Size_Width * 0.025),
                                      color: Color(0xFFF3F3F3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    height: Size_Height * 0.1,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${GlobalVariables.Item_X}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFF646667),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'Y :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (Size_Width * 0.025),
                                      color: Color(0xFFF3F3F3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    height: Size_Height * 0.1,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${GlobalVariables.Item_Y}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFF646667),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'Z :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (Size_Width * 0.025),
                                      color: Color(0xFFF3F3F3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    height: Size_Height * 0.1,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${GlobalVariables.Item_Z}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Size_Width * 0.02,
                                        color: Color(0xFF646667),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCircularButton(
    BuildContext context,
    double size,
    double height,
    double width,
    bool istopLeft,
    bool istopRight,
    bool isbottomLeft,
    bool isbottomRight,
    int num) {
  return Container(
    height: size * height,
    width: size * width,
    decoration: BoxDecoration(
      color: Color(0xFF646667),
      borderRadius: BorderRadius.only(
        topLeft: istopLeft ? Radius.circular(size) : Radius.zero,
        bottomLeft: isbottomLeft ? Radius.circular(size) : Radius.zero,
        topRight: istopRight ? Radius.circular(size) : Radius.zero,
        bottomRight: isbottomRight ? Radius.circular(size) : Radius.zero,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x40000000),
          offset: Offset(0, 4),
          blurRadius: 2,
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: () {
        switch (num) {
          case 0:
            MessageView.showOverlayMessage(context, size, "Camera Angle Left");
            break;
          case 1:
            MessageView.showOverlayMessage(context, size, "Camera Angle UP");
            break;
          case 2:
            MessageView.showOverlayMessage(context, size, "Camera Angle Right");
            break;
          case 3:
            MessageView.showOverlayMessage(context, size, "Camera Angle Down");
            break;
          case 4:
            MessageView.showOverlayMessage(
                context, size, "Camera View Translation Left");
            break;
          case 5:
            MessageView.showOverlayMessage(
                context, size, "Camera View Translation UP");
            break;
          case 6:
            MessageView.showOverlayMessage(
                context, size, "Camera View Translation Right");
            break;
          case 7:
            MessageView.showOverlayMessage(
                context, size, "Camera View Translation Down");
            break;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF646667),
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: istopLeft ? Radius.circular(size) : Radius.zero,
            bottomLeft: isbottomLeft ? Radius.circular(size) : Radius.zero,
            topRight: istopRight ? Radius.circular(size) : Radius.zero,
            bottomRight: isbottomRight ? Radius.circular(size) : Radius.zero,
          ),
        ),
      ),
      child: Container(
        height: size * (height - 0.02),
        width: size * (width - 0.02),
        decoration: BoxDecoration(
          color: Color.fromARGB(220, 85, 79, 111),
          borderRadius: BorderRadius.only(
            topLeft: istopLeft ? Radius.circular(size) : Radius.zero,
            bottomLeft: isbottomLeft ? Radius.circular(size) : Radius.zero,
            topRight: istopRight ? Radius.circular(size) : Radius.zero,
            bottomRight: isbottomRight ? Radius.circular(size) : Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    ),
  );
}
