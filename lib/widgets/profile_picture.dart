import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget{

  final Function() onPressed;
  final bool showCamera;


  ProfilePicture({@required this.onPressed, this.showCamera = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size.fromRadius(60)),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),

          showCamera ? InkWell(
            onTap: onPressed,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: darkAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: lightPrimary, width: 2.5),
                ),
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.camera_alt, color: lightPrimary, size: 18,),

              ),
            ),
          ): XMargin(0)

        ],
      ),
    );
  }
}