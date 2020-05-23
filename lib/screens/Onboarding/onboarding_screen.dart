import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/pin_field.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController =
      PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 11.0 : 8.0,
      width: isActive ? 11.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? darkAccent : lightAccent.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: lightPrimary,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: _currentPage > 0 ? InkWell(
          onTap: (){
            setState(() {
              _pageController.animateToPage(_currentPage - 1, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                    fontSize: 16.0,))
          ]),
        ) : InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                    fontSize: 16.0,))
          ]),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0).add(EdgeInsets.only(right: 10)),
            child: Text('${_currentPage + 1}/${_buildPageIndicator().length}',
            style: TextStyle(fontSize: 16)),
          )
        ],
      ),
      body: Stack(
//              fit: StackFit.expand,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
//              YMargin(30),
          Container(
            color: lightPrimary,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[

                _onBoarding1(),
                _onBoarding2(),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),

//              YMargin(30),


        ],
      ),
    );
  }

  Widget _onBoarding1(){
    return Padding(
        padding: const EdgeInsets.all(15.0).add(EdgeInsets.only(left: 5, right: 5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Getting Started',
                      style: TextStyle(
                        color: darkBG,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,),),
                    Image.asset('assets/images/Findr_logo.png',
                        height: 36.0, width: 36.0),
                  ],
                ),
                YMargin(10),
                Text(
                  'Choose from the following options below',
                  style: TextStyle(
                      color: darkBG,
                      fontSize: 12.0),
                ),
              ],
            ),
            YMargin(80),
            Text(
              'Register as',
              style: TextStyle(
                  color: darkBG,
                  fontSize: 16.0),
            ),
            YMargin(40),
            Button(onPressed: () {
              _pageController.animateToPage(_currentPage + 1, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
            }, text: 'an agent', height: 50.0),
            YMargin(20),
            Button(onPressed: () {}, text: 'a student', height: 50.0),


          ],
        ),
      );
  }

  Widget _onBoarding2(){
    return Column(
      children: <Widget>[
        PinField(pinController: null),
        YMargin(10),
        ProfilePicture(onPressed: (){},showCamera: true,),
      ],
    );
  }

}
