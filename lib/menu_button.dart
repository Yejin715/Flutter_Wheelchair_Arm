import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import './global.dart';

class MenuButtonSection extends StatefulWidget {
  final double Size_Height;
  final double Size_Width;

  MenuButtonSection({
    required this.Size_Height,
    required this.Size_Width,
  });

  @override
  _MenuButtonSectionState createState() => _MenuButtonSectionState();
}

class _MenuButtonSectionState extends State<MenuButtonSection> {
  double get sizeHeight => widget.Size_Height;
  double get sizeWidth => widget.Size_Width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (sizeHeight * 0.1),
            height: (sizeHeight * 0.1),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeHeight * 0.1),
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
              child: GestureDetector(
                onTap: () {
                  MessageView.showExitConfirmationDialog(context, sizeWidth);
                },
                child: Icon(
                  Icons.meeting_room,
                  size: sizeHeight * 0.07,
                ),
              ),
            ),
          ),
          Container(
            width: (sizeHeight * 0.1),
            height: (sizeHeight * 0.1),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeHeight * 0.1),
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
              child: GestureDetector(
                onTap: () {
                  Haptics.vibrate(HapticsType.light);
                },
                child: Icon(
                  Icons.settings,
                  size: sizeHeight * 0.07,
                ),
              ),
            ),
          ),
          Container(
            width: (sizeHeight * 0.1),
            height: (sizeHeight * 0.1),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeHeight * 0.1),
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
              child: GestureDetector(
                onTap: () {
                  Haptics.vibrate(HapticsType.light);
                  setState(() {
                    GlobalVariables.Community_Connect =
                        !GlobalVariables.Community_Connect;
                    if (GlobalVariables.Community_Connect) {
                      GlobalVariables.Arm_Error = true;
                      print(GlobalVariables.Community_Connect);
                    } else {
                      GlobalVariables.Arm_Error = false;
                    }
                  });
                },
                child: Icon(
                  GlobalVariables.Community_Connect
                      ? Icons.link
                      : Icons.link_off,
                  size: sizeHeight * 0.07,
                ),
              ),
            ),
          ),
          Container(
            width: (sizeHeight * 0.1),
            height: (sizeHeight * 0.1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeHeight * 0.1),
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
            ),
          ),
        ],
      ),
    );
  }
}
