import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {

  final TextEditingController controller;
  final IconData iconData;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String) validator;

  TextInput({ @required this.controller, @required this.hintText,
     this.keyboardType = TextInputType.text, this.validator, this.iconData});

  @override
  _TextInputState createState() => _TextInputState();

}

class _TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Material(
        child: TextFormField(
          style: TextStyle(fontSize: 16,),
          cursorColor: Color(0xff707070),
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          decoration: _getTextDecoration(),
        ),
      ),
    );
  }


  InputDecoration _getTextDecoration(){
    if(widget.iconData != null){
      return InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white,),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.iconData,
          color: lightAccent,
        ),
      );
    }else{
      return InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white,),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hintText,

      );
    }
  }

}
