import 'package:flutter/material.dart';

class CameraViewTranslationControls extends StatefulWidget {
  final double Size_Height;
  final double Size_Width;
  final Function _buildCircularButton;

  CameraViewTranslationControls({
    required this.Size_Height,
    required this.Size_Width,
    required Function buildCircularButton,
  }) : _buildCircularButton = buildCircularButton;

  @override
  _CameraViewTranslationControlsState createState() =>
      _CameraViewTranslationControlsState();
}

class _CameraViewTranslationControlsState
    extends State<CameraViewTranslationControls> {
  double get sizeHeight => widget.Size_Height;
  double get sizeWidth => widget.Size_Width;
  Function get buildCircularButton => widget._buildCircularButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight * 0.37,
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
                  fontSize: sizeWidth * 0.02,
                  color: Color(0xFFF3F3F3),
                ),
              ),
              SizedBox(width: sizeHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCircularButton(context, sizeHeight, 0.15, 0.1, true,
                      false, true, false, 4),
                  SizedBox(width: sizeHeight * 0.008),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCircularButton(context, sizeHeight, 0.1, 0.15, true,
                          true, false, false, 5),
                      SizedBox(height: sizeHeight * 0.008),
                      Container(
                        width: sizeHeight * 0.08,
                        height: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xFF646667),
                          borderRadius:
                              BorderRadius.circular(sizeHeight * 0.08),
                        ),
                        child: Icon(Icons.control_camera),
                      ),
                      SizedBox(height: sizeHeight * 0.008),
                      buildCircularButton(context, sizeHeight, 0.1, 0.15, false,
                          false, true, true, 7),
                    ],
                  ),
                  SizedBox(width: sizeHeight * 0.008),
                  buildCircularButton(context, sizeHeight, 0.15, 0.1, false,
                      true, false, true, 6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
