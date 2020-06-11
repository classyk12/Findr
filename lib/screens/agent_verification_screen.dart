
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/empty_state.dart';
import 'package:findr/widgets/file_upload_button.dart';
import 'package:flutter/material.dart';

class AgentVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
            Text('Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ))
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ID verification',
              style: TextStyle(
                color: darkBG,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            YMargin(80),
            Text(
              'Submit your ID here(Government ID/Agent ID)',
              style: TextStyle(
                color: darkBG,
                fontSize: 15.0,
                fontWeight: FontWeight.w500
              ),
            ),
            YMargin(10),
            UploadButton(onPressed: (){},),
            YMargin(30),
            Center(
              child: FlatButton(
                splashColor: lightAccent.withOpacity(0.2),
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EmptyState()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
