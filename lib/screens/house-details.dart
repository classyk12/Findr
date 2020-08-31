import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HouseDetailScreen extends StatefulWidget {
  @override
  _HouseDetailScreenState createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  AgentProvider agentProvider;
  HouseProvider houseProvider;

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
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
        color: isActive ? Colors.white : lightAccent.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    agentProvider = Provider.of<AgentProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    houseProvider = Provider.of<HouseProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          child: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
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

//            Spacer(),

                  // Text(
                  //   'Edit Profile',
                  //   style: TextStyle(fontSize: 20.0),
                  // ),

                  Row(children: <Widget>[
                    ProfilePicture(
                        onPressed: () {},
                        showCamera: false,
                        radius: 20,
                        image: agentProvider
                                    ?.agentDashboardResponse?.data?.userType
                                    ?.toLowerCase() ==
                                'agent'
                            ? agentProvider?.agentDashboardResponse?.data
                                ?.agentData?.agentdetails?.image
                            : agentProvider?.agentDashboardResponse?.data
                                ?.studentData?.image),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FlatButton(
                          padding: EdgeInsets.only(left: 30),
                          onPressed: () async {},
                          child: Icon(Icons.share, color: Colors.green[800])),
                    )
                  ]),
                ]),
          ),
        ),
      ),
      body: ListView(
//            shrinkWrap: true,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            fit: StackFit.passthrough,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              YMargin(30),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                // color: lightPrimary,
                child: PageView(
                  allowImplicitScrolling: true,
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Image.asset('assets/images/testhouse.jpg',
                        width: MediaQuery.of(context).size.width),
                    Image.asset('assets/images/testhouse.jpg',
                        width: MediaQuery.of(context).size.width),
                    Image.asset('assets/images/testhouse.jpg',
                        width: MediaQuery.of(context).size.width),
                  ],
                ),
              ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 2.5,
                      child: Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[

                        InkWell(onTap: (){}, child: Icon(Icons.chevron_left, color: Colors.white,size: 50)),
                        InkWell(onTap: (){}, child: Icon(Icons.chevron_right, color: Colors.white,size: 50))
                      ]
                    ),
                  ),
                ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: _buildPageIndicator(),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  heightFactor: 17,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _buildPageIndicator(),
                  ),
                ),
              ),

//              YMargin(30),
            ],
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.only(left:25.0, right:20.0, top:10.0, bottom: 10.0 ),
              child: Column(children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(bottom:6.0),
                  child: Row(children: <Widget>[
                    Text('Amusa 5 Bungalow Itamerin', style: TextStyle(color:Colors.blueGrey[800],fontSize:20, fontWeight:FontWeight.bold)),
                    XMargin(40),
                    InkWell(onTap: (){}, child: Icon(Icons.bookmark, color: Colors.grey[600])),
                    XMargin(10),
                    InkWell(onTap: (){}, child: Icon(Icons.favorite_border, color: Colors.grey[600])),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:6.0),
                  child: Row(children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey[700], size: 12),
                    Text('Itamerin, Ago Iwoye, Ogun state', style: TextStyle(color: Colors.grey[600])),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Row(
                      children: <Widget>[
                        Text('₦150,000', style: TextStyle(fontSize: 25,  color: Colors.blue[400], fontWeight: FontWeight.bold)),
                        Text('  (Negotiable)',style: TextStyle(fontSize: 12,  color: Colors.grey[400])),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Text('Today 2:50pm',style: TextStyle(fontSize: 10,  color: Colors.grey[400])),
                  ),
                ]),
                Row(
                    // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: OutlineButton(
                          
                          borderSide: BorderSide(color:Colors.green[900],width:1.2),
                            shape: new RoundedRectangleBorder(),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[                           
                                Icon(Icons.account_circle, color: Colors.green[900]),
                                Text('  View Profile', style: TextStyle(color:Colors.green[900]),)
                              ]),
                            ),
                            onPressed: () {}),
                      ),
                      XMargin(15),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Center(
                          child: RaisedButton(
                              color: Colors.teal[900],
                              shape: new RoundedRectangleBorder(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                Icon(Icons.phone, color: Colors.white),
                                Text('  Show Contact')
                              ]),
                              onPressed: () {}),
                        ),
                      )
                    ]),
              ]),
            ),

          ),
          YMargin(8),

          Container(
            padding: const EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(

                    children: <Widget>[
                    Text('Condition    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 200),
                    Text('    New', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('Bedrooms    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 200),
                    Text('   6', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('Bathrooms   ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 200),
                    Text('   5', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('Parking Space    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 170),
                    Text('    Yes', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),


                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('Furnishing    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 200),
                    Text('   Unfurnished', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
               //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('Fenced    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 215),
                    Text('    Yes', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:5.0, left:5.0, right: 5.0, bottom: 15.0),
                  child: Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text('House Quality    ', style: TextStyle(color:Colors.grey[600])),
                    Container(color: Colors.grey, height: 1.4, width: 170),
                    Text('    Standard', style: TextStyle(color:darkBG, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ])),
          YMargin(10),

          Container(
            padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Text(
                  '6 bed room bungalow at a very affordable price, new home built for the family and for anyone interested.',
                  style: TextStyle(color:Colors.grey[600], height: 1.5))),
          YMargin(10),

          Container(
            padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  ProfilePicture(
                      onPressed: () {},
                      showCamera: false,
                      radius: 40,
                      image: agentProvider
                                  ?.agentDashboardResponse?.data?.userType
                                  ?.toLowerCase() ==
                              'agent'
                          ? agentProvider?.agentDashboardResponse?.data
                              ?.agentData?.agentdetails?.image
                          : agentProvider?.agentDashboardResponse?.data
                              ?.studentData?.image),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                        Text('Olushola Peters ', style: TextStyle(color:Colors.grey[600], fontSize: 16, fontWeight: FontWeight.bold)),
                        Container(
                              decoration: BoxDecoration(
                                color: darkAccent,
                                borderRadius: BorderRadius.circular(20.0),
                                border:
                                Border.all(color: Colors.white, width: 1.5),
                              ),
                              padding: EdgeInsets.all(4.0),
                              child:
                              Icon(Icons.done, color: lightPrimary, size: 10),
                            )
                       // Icon(Icons.done_all, color: Colors.green)
                      ]),

                      Row(children: <Widget>[

                        FlatButton(
                          color: Colors.yellow[800],
                            shape: new RoundedRectangleBorder(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                            //  Padding(
                              //  padding: const EdgeInsets.only(right:10.0),
                                Text('Leave Feedback',style: TextStyle(color:Colors.white, fontWeight: FontWeight.normal)),
                             // ),
                              
                              Icon(Icons.chevron_right,
                                  color: Colors.white),
                              
                            ]),
                            onPressed: () {}),

                            XMargin(10),

                        OutlineButton(
                          borderSide: BorderSide(color:Colors.red, width: 1.2),
                            shape: new RoundedRectangleBorder(),
                            child: Row(children: <Widget>[
                              Text('Report', style: TextStyle(color:Colors.red),)
                            ]),
                            onPressed: () {})
                      ])
                    ]),
                  )
                ],
              ))


        ],
      ),
    );
  }
}
