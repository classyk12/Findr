import 'package:findr/utils/margin.dart';
import 'package:findr/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class PinField extends StatelessWidget {
  final TextEditingController pinController;

  PinField({
    @required this.pinController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, percent: 0.6),
      height: 40,
      child: PinInputTextField(
        pinLength: 4,
        decoration: BoxLooseDecoration(
          strokeColor: darkAccent,
          textStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: darkBG),
//          color: darkAccent,
          strokeWidth: 2,
//obscureStyle: ObscureStyle(
//  isTextObscure: true,
////      obscureText: '*'
//),
          gapSpace: 12,
//          lineHeight: 2,
        ),
        inputFormatter: [WhitelistingTextInputFormatter.digitsOnly],
        controller: pinController,
        autoFocus: true,
//        onSubmit: (pin) {
//          debugPrint('submit pin:$pin');
//        },
      ),
    );
  }
}
