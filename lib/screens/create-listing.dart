import 'package:findr/providers/agent_provider.dart';
import 'package:findr/providers/house_provider.dart';
import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:findr/widgets/button.dart';
import 'package:findr/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class CreateListingScreen extends StatefulWidget {
  @override
  _CreateListingScreenState createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  AgentProvider agentProvider;
  HouseProvider houseProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    houseProvider = Provider.of<HouseProvider>(context, listen: true);
    agentProvider = Provider.of<AgentProvider>(context, listen: false);

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
                    FlatButton(
                        padding: EdgeInsets.only(left: 30),
                        onPressed: () async {},
                        child: Text(
                          'clear',
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        )),
                  ]),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Text('Add Photo'),
                  Text('Add at least 3 photos for this category'),
                  Text('First picture defaults to the title picture'),
                ],
              ),
              Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: darkAccent,
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ),
                Text(
                    "Each picture must not exceed 5 Mb \n supported formats are *jpg, *jpeg and png")
              ]),
              TextInput(
                controller: null,
                hintText: 'Title *',
              ),
              Container(
                child: Material(
                  color: Colors.grey[100],
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      focusColor: Colors.red,
                      hint: Text('select your gender'),
                      dropdownColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                            value: "Male",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.male, color: Colors.green[900]),
                              XMargin(10),
                              Text('Male',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ])),
                        DropdownMenuItem(
                            value: "Female",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.female, color: Colors.green[900]),
                              XMargin(10),
                              Text('Female',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          // _value = value;
                        });
                      },
                      // value: _value),
                    ),
                  ),
                ),
              ),
              Container(
                child: Material(
                  color: Colors.grey[100],
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      focusColor: Colors.red,
                      hint: Text('select your gender'),
                      dropdownColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                            value: "Male",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.male, color: Colors.green[900]),
                              XMargin(10),
                              Text('Male',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ])),
                        DropdownMenuItem(
                            value: "Female",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.female, color: Colors.green[900]),
                              XMargin(10),
                              Text('Female',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          // _value = value;
                        });
                      },
                      // value: _value),
                    ),
                  ),
                ),
              ),
              Container(
                child: Material(
                  color: Colors.grey[100],
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      focusColor: Colors.red,
                      hint: Text('select your gender'),
                      dropdownColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                            value: "Male",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.male, color: Colors.green[900]),
                              XMargin(10),
                              Text('Male',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ])),
                        DropdownMenuItem(
                            value: "Female",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.female, color: Colors.green[900]),
                              XMargin(10),
                              Text('Female',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          // _value = value;
                        });
                      },
                      // value: _value),
                    ),
                  ),
                ),
              ),
              Container(
                child: Material(
                  color: Colors.grey[100],
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      focusColor: Colors.red,
                      hint: Text('select your gender'),
                      dropdownColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                            value: "Male",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.male, color: Colors.green[900]),
                              XMargin(10),
                              Text('Male',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ])),
                        DropdownMenuItem(
                            value: "Female",
                            child: Row(children: <Widget>[
                              Icon(LineIcons.female, color: Colors.green[900]),
                              XMargin(10),
                              Text('Female',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green))
                            ]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          // _value = value;
                        });
                      },
                      // value: _value),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Parking Space '),
                  Container(
                    color: darkAccent,
                    height: 1,
                    width: 50,
                  ),
                  Radio(value: null, groupValue: null, onChanged: null),
                  Text('Yes'),
                  Radio(value: null, groupValue: null, onChanged: null),
                  Text('No'),
                ],
              ),
              Container(
                  height: 100,
                  child: TextField(
                    controller: null,
                    maxLines: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Description *',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: darkAccent, width: 1)),
                    ),
                  )),
              Container(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: null,
                maxLines: null,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    color: Colors.grey,
                    child: Text('₦'),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Price *',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: darkAccent, width: 1)),
                ),
              )),
              Row(
                children: [
                  Text('Parking Space '),
                  Container(
                    color: darkAccent,
                    height: 1,
                    width: 50,
                  ),
                  Radio(value: null, groupValue: null, onChanged: null),
                  Text('Neigotiable'),
                ],
              ),
              RaisedButton(
                  child: Text('Continue'),
                  onPressed: () {
                    detailsModal();
                  })
            ],
          ),
        ));
  }

  detailsModal() {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Text("House information here"),
            ),
          );
        });
  }
}
