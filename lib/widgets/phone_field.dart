import 'package:country_code_picker/country_code_picker.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String) validator;
  final void Function(String) onChanged;

  PhoneField(
      {@required this.hintText,
      @required this.onChanged,
      this.keyboardType = TextInputType.number,
      this.validator,
      this.controller});

  @override
  _SPhoneInputState createState() {
    return _SPhoneInputState();
  }
}

class _SPhoneInputState extends State<PhoneField> {
//  bool _obscureText = false;
  String countryCode = '+234';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            offset: Offset(0, 8),
            spreadRadius: -10,
            color: darkBG.withOpacity(0.3),
            blurRadius: 16,
          ),
        ],
      ),
      child: Material(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.tightForFinite(width: 50),
                child: CountryCodePicker(
                  padding: EdgeInsets.zero,
                  textStyle: TextStyle(fontSize: 16, color: darkBG),
//                    countryFilter: ['NG', 'GH', 'US', 'ZA'],
                  countryFilter: ['NG'],
                  onChanged: (value) {
                    setState(() {
                      countryCode = value.dialCode.substring(1);
                    });
                    String num = '$countryCode$phoneNumber';
                    widget.controller.text = num;

//                  String num = '$countryCode$phoneNumber';
//                  widget.onChanged(num);
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'NG',
                  enabled: false,
//                    favorite: [
//                      'NG',
//                    ],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  showFlag: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: VerticalDivider(
                  color: darkBG,
                ),
              ),
              Expanded(
                child: TextFormField(
//          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  cursorColor: Color(0xff707070),
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
//                      controller: widget.controller,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                  validator: widget.validator,
                  maxLength: 11,
                  maxLengthEnforced: true,
//                      buildCounter: (ctx, max, length) => Container(),
                  onChanged: (value) {
                    String phoneNum = '';
                    if (value.startsWith('0'))
                      phoneNum = value.substring(1);
                    else
                      phoneNum = value;

                    setState(() {
                      phoneNumber = phoneNum;
                    });
                    String num = '$countryCode$phoneNumber';
                    widget.controller.text = num;

//                String num = '$countryCode$phoneNumber';
//                widget.onChanged(num);
                  },
                  decoration: InputDecoration(
                    counterText: '',

//                isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBG.withOpacity(0.0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBG.withOpacity(0.0)),
                    ),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(fontSize: 16),
                  ),
//                      obscureText: _obscureText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
