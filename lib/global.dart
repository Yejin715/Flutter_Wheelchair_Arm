import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';

class GlobalVariables {
  static bool Community_Connect = false;
  static String Item_name = "";
  static double Item_X = 0.0;
  static double Item_Y = 0.0;
  static double Item_Z = 0.0;
  static bool Arm_Error = false;
}

class MessageView {
  static void showExitConfirmationDialog(
      BuildContext context, double Size_Width) {
    Haptics.vibrate(HapticsType.light);
    showDialog(
      context: context,
      barrierDismissible: true, // 이 부분을 true로 설정합니다.
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          title: Text('앱 종료'),
          content: Text('앱을 종료하시겠습니까?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Haptics.vibrate(HapticsType.light);
                Navigator.of(context).pop(); // 팝업 닫기
              },
              child: Container(
                width: (Size_Width * 0.07),
                alignment: Alignment.center,
                child: Text(
                  'No',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Size_Width * 0.015,
                    color: Color(0xFFF3F3F3),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Haptics.vibrate(HapticsType.light);
                SystemNavigator.pop(); // 앱 종료
              },
              child: Container(
                width: (Size_Width * 0.07),
                alignment: Alignment.center,
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Size_Width * 0.015,
                    color: Color(0xFFF3F3F3),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showOverlayMessage(
      BuildContext context, double Size_Width, String message) {
    Haptics.vibrate(HapticsType.light);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Size_Width * 0.05,
                  color: Color(0xFFF3F3F3),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // 일정 시간 후에 Overlay를 제거합니다.
    Future.delayed(Duration(milliseconds: 700), () {
      overlayEntry.remove();
    });
  }
}
