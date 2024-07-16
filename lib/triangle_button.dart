import 'package:flutter/material.dart';
import './global.dart';

Widget buildTriangleButton(
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
