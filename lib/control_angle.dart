import 'package:flutter/material.dart';

class CameraAngleControls extends StatefulWidget {
  final double Size_Height;
  final double Size_Width;
  final Function _buildCircularButton;

  CameraAngleControls({
    required this.Size_Height,
    required this.Size_Width,
    required Function buildCircularButton,
  }) : _buildCircularButton = buildCircularButton;

  @override
  _CameraAngleControlsState createState() => _CameraAngleControlsState();
}

class _CameraAngleControlsState extends State<CameraAngleControls> {
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
                'Camera Angle',
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
                  buildCircularButton(
                    context,
                    sizeHeight,
                    0.15,
                    0.1,
                    true,
                    false,
                    true,
                    false,
                    0,
                  ),
                  SizedBox(width: sizeHeight * 0.008),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCircularButton(
                        context,
                        sizeHeight,
                        0.1,
                        0.15,
                        true,
                        true,
                        false,
                        false,
                        1,
                      ),
                      SizedBox(height: sizeHeight * 0.008),
                      Container(
                        width: sizeHeight * 0.08,
                        height: sizeHeight * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xFF646667),
                          borderRadius:
                              BorderRadius.circular(sizeHeight * 0.08),
                        ),
                        child: Icon(Icons.cached),
                      ),
                      SizedBox(height: sizeHeight * 0.008),
                      buildCircularButton(
                        context,
                        sizeHeight,
                        0.1,
                        0.15,
                        false,
                        false,
                        true,
                        true,
                        3,
                      ),
                    ],
                  ),
                  SizedBox(width: sizeHeight * 0.008),
                  buildCircularButton(
                    context,
                    sizeHeight,
                    0.15,
                    0.1,
                    false,
                    true,
                    false,
                    true,
                    2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}