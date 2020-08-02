import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget{

  final Function() onPressed;
  final bool showCamera;
  final double radius;
  final dynamic child;


  ProfilePicture({@required this.onPressed, this.showCamera = false, this.radius = 60, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (radius * 2),
      height: (radius * 2),

//      constraints: BoxConstraints(maxWidth: 120, maxHeight: 120),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(100.0),
               child: child
            ),
          ),

          showCamera ? InkWell(
            onTap: onPressed,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: darkAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: lightPrimary, width: 2.5),
                ),
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.camera_alt, color: lightPrimary, size: 18,),

              ),
            ),
          ): XMargin(0)

        ],
      ),
    );
  }
}