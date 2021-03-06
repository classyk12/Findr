
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String Function(String) validator;
  final String hintText;

  TextInput({ @required this.controller,
     this.keyboardType = TextInputType.text, this.validator, this.hintText = ''});

  @override
  _TextInputState createState() => _TextInputState();

}

class _TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            offset: Offset(0, 8),
            spreadRadius: -10,
            color: darkBG.withOpacity(0.3),
            blurRadius: 24,
          ),
        ],
      ),
      child: Material(
        child: TextFormField(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: darkBG),
//          cursorColor: Colors.white,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 16),
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.transparent,),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,),
              borderRadius: BorderRadius.circular(20.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,),
              borderRadius: BorderRadius.circular(20.0),
            ),

          ),
        ),
      ),
    );
  }

}
