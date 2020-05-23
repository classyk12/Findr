
import 'package:findr/utils/margin.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  Button({@required this.text, @required this.onPressed, this.width = 0.0, this.height=0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(
//        boxShadow: [
//          new BoxShadow(
//            offset: Offset(0, 8),
//            spreadRadius: -10,
//            color: darkBG.withOpacity(0.9),
//            blurRadius: 24,
//          ),
//        ],
//      ),
      width: width == 0.0 ? screenWidth(context) : width,
      constraints: BoxConstraints.tightForFinite(),

      height: this.height,

      child: RaisedButton(

        splashColor: Colors.white.withOpacity(0.2),
        elevation: 8,
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: EdgeInsets.only(left: 0, right: 0, top: 13, bottom: 13),
      ),
    );
  }
}