import 'package:findr/utils/margin.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Lottie.asset('assets/lottie/emptyHouse.json', height: 300),
            Text('Nothing Found Here!',
                style: TextStyle(color: Colors.green[900], fontSize: 20)),
            YMargin(10),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Go Back',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
