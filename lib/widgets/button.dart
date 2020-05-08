
import 'package:findr/utils/margin.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final double width;


  Button({@required this.text, @required this.onPressed, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0.0 ? screenWidth(context) : width,
    constraints: BoxConstraints.tightForFinite(),

      child: RaisedButton(

        elevation: 0,
        onPressed: onPressed,
        child: Text(text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.only(left: 0, right: 0, top: 13, bottom: 13),
      ),
    );
  }
}