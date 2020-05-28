import 'dart:math';

import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget{

  final VoidCallback onPressed;
  final double width;

  UploadButton({@required this.onPressed, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.grey.withOpacity(0.15),

    ),
      width: width == 0.0 ? screenWidth(
          context) : width,
      constraints: BoxConstraints.tightForFinite(),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              XMargin(10),
              Text('Select an option here', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[400]),),
              XMargin(6),
              Transform.rotate(child: Icon(Icons.attach_file, color: Colors.grey[400],), angle:  pi / 0.8,),
            ],
          ),
        ),
      ),
    );
  }
}