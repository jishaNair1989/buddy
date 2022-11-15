import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyType;
  final int? minLines;
  final int? maxLines;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyType = TextInputType.emailAddress,
    required TextInputType inputType,
     this. minLines,
    this. maxLines,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
minLines: minLines,
maxLines: maxLines, 
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        fillColor: KColors.kTextFieldColor,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: KColors.kBlackColor),
      ),
      keyboardType: keyType,
      style: const TextStyle(
        fontFamily: 'Chewy',
      ),
    );
  }
}
