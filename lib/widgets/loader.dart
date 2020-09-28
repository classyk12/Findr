import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  final bool isLargeLoading;
  Loading({this.isLargeLoading});
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return _loader();
  }

  _loader() {
    if (widget.isLargeLoading) {
      return Container(
          color: Colors.green[100],
          child: Center(
              child: SpinKitFoldingCube(color: Colors.green[900], size: 60.0)));
    } else {
      return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SpinKitCircle(color: darkAccent),
                  ],
                )),
              ));
    }
  }
}
