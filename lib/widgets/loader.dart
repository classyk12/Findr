import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[100],
        child:
            Center(child: SpinKitFoldingCube(color: Colors.green[900], size: 100.0)));
            
  }
}
