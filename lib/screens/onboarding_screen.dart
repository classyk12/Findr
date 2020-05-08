import 'package:findr/screens/login_screen.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController =
      PageController(viewportFraction: 0.867, initialPage: 0);
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
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? darkAccent : lightAccent.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          padding: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              YMargin(30),
              Container(
                height: screenHeight(context, percent: 0.65),
                width: screenWidth(context),
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    _onboarding1(),
                    _onboarding2(),
                    _onboarding3(),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),

//              YMargin(30),

              Container(
                width: screenWidth(context),
                constraints: BoxConstraints.tightForFinite(),
                child: RaisedButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text('Skip'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 13, bottom: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onboarding1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Icon(
            LineIcons.dashboard,
            size: screenWidth(context, percent: 0.7),
          ),
        ),
        YMargin(20),
        Center(
          child: Text(
            'page 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        YMargin(15),
        Center(
          child: Container(
            width: screenWidth(context, percent: 0.75),
            child: Text(
              'lorem Ipsum hjbjhacb hwoijdow kmlxn wugei dwmlmcnj cjhwcjhoiheo ihcjwnjkco cwknkw kcnknkek necnnokene kncekneo nceknlke n',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  _onboarding2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Icon(
            LineIcons.expand,
            size: screenWidth(context, percent: 0.7),
          ),
        ),
        YMargin(20),
        Center(
          child: Text(
            'page 2',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        YMargin(15),
        Center(
          child: Container(
            width: screenWidth(context, percent: 0.75),
            child: Text(
              'lorem Ipsum hjbjhacb hwoijdow kmlxn wugei dwmlmcnj cjhwcjhoiheo ihcjwnjkco cwknkw kcnknkek necnnokene kncekneo nceknlke n',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  _onboarding3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Icon(
            LineIcons.question,
            size: screenWidth(context, percent: 0.7),
          ),
        ),
        YMargin(20),
        Center(
          child: Text(
            'page 3',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        YMargin(15),
        Center(
          child: Container(
            width: screenWidth(context, percent: 0.75),
            child: Text(
              'lorem Ipsum hjbjhacb hwoijdow kmlxn wugei dwmlmcnj cjhwcjhoiheo ihcjwnjkco cwknkw kcnknkek necnnokene kncekneo nceknlke n',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
