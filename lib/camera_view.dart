import 'dart:ui';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final double Size_Height;

  CameraView({required this.Size_Height});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  double get sizeHeight => widget.Size_Height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: sizeHeight * 0.65,
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
