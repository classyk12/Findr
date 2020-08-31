import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/house_item.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AgentDetailsScreen extends StatelessWidget {

 bool _isVerified = true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPrimary,
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[
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
                  )),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfilePicture(
                    onPressed: () {},
                    showCamera: false,
                    radius: 34,
                  ),
                  XMargin(10),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Olushola Peters',
                              style: TextStyle(
                                color: darkBG,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'Agent',
                                    style: TextStyle(
                                        color: darkBG.withOpacity(0.7),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ),
                                _isVerified
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: darkAccent,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                              color: lightPrimary, width: 1.5),
                                        ),
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.done,
                                            color: lightPrimary, size: 10),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                              color: lightPrimary, width: 1.5),
                                        ),
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.schedule,
                                            color: lightPrimary, size: 10),
                                      ),
                              ]),
                          YMargin(10),
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Registered 2 years 3 months ago',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            YMargin(16),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: darkAccent)),
                    child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {},
                         splashColor: darkAccent.withOpacity(0.2),
                        child: Row(
                          children: <Widget>[
                            Icon(LineIcons.phone, color: darkAccent, size: 20,),
                            XMargin(8),
                            Text(
                              'Call Agent',
                              style: TextStyle(fontSize: 14.0, color: darkAccent),
                            ),
                          ],
                        )),
                  ),
                  XMargin(15),
                  Container(
                    decoration: BoxDecoration(
                        color: darkAccent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: darkAccent)),
                    child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {},
                        splashColor: Colors.white.withOpacity(0.2),
                        child: Text(
                          'Copy number',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            YMargin(20),
            Expanded(
              child: Stack(
//                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    top: 10,
                    child: Expanded(
                      child: Container(
//                        constraints: BoxConstraints(minHeight: 300, minWidth: screenWidth(context),),
                        margin: EdgeInsets.only(top: 10.0),
                        color: Colors.grey[200],
//                      height: 300,
//                      width: screenWidth(context),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 36.0, right: 20, left: 20),
                          child: ListView.builder(
                            itemCount: 6,
                              itemBuilder: (context, index) => HouseItem(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          color: darkAccent,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text('All listings', style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
