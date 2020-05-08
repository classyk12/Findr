import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  String Function(String) validator;
  Function(String) onChanged;
  PasswordInput(
      {@required this.controller,
      @required this.hintText,
       this.validator, this.onChanged});

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<PasswordInput> {
  String hintText;
  bool _obscureText = true;


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
        child: Stack(
          children: <Widget>[
            TextFormField(
              validator: widget.validator,
              onChanged: widget.onChanged,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 16,
              ),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
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
                  LineIcons.lock,
                  color: lightAccent,
                ),

              ),

              obscureText: _obscureText,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 36,
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    onPressed: _toggle,
                    child: _obscureText
                        ? Icon(
                            LineIcons.eye_slash,
                            size: 18,
                            color: lightAccent,
                          )
                        : Icon(
                            LineIcons.eye,
                        color: lightAccent,
                        size: 18
                          ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
