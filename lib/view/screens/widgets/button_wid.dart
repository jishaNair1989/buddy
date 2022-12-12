import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;
  final double width;
  const ButtonWidget({
    Key? key,
    required this.text,
    this.color = KColors.kThemePink,
    required this.onTap,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
          elevation: 0,
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: const TextStyle(
            color: KColors.kWhiteColor,
            fontSize: 16,
            fontFamily: 'SubMainFont',
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
