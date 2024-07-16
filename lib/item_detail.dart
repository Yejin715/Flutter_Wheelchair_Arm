import 'package:flutter/material.dart';
import './global.dart';

class ItemDetails extends StatefulWidget {
  final double Size_Height;
  final double Size_Width;

  ItemDetails({required this.Size_Height, required this.Size_Width});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  double get sizeHeight => widget.Size_Height;
  double get sizeWidth => widget.Size_Width;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
                    fontSize: (sizeWidth * 0.025),
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
                  height: sizeHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    GlobalVariables.Item_name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeWidth * 0.02,
                      color: Color(0xFF646667),
                    ),
                  ),
                ),
              ),
              Container(
                width: (sizeWidth * 0.15),
                height: ((sizeHeight * 0.1)),
                alignment: Alignment.center,
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
                child: ElevatedButton(
                  onPressed: () {
                    MessageView.showOverlayMessage(
                        context, sizeHeight, "Select버튼 클릭");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF646667), // 버튼 색상
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: (sizeWidth * 0.2),
                    alignment: Alignment.center,
                    child: Text(
                      'Select',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: (sizeWidth * 0.025),
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
                    fontSize: (sizeWidth * 0.025),
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
                  height: sizeHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${GlobalVariables.Item_X}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeWidth * 0.02,
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
                    fontSize: (sizeWidth * 0.025),
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
                  height: sizeHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${GlobalVariables.Item_Y}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeWidth * 0.02,
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
                    fontSize: (sizeWidth * 0.025),
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
                  height: sizeHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${GlobalVariables.Item_Z}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sizeWidth * 0.02,
                      color: Color(0xFF646667),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
