import 'package:flutter/material.dart';

class NewPostOpt extends StatelessWidget {
  const NewPostOpt({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
           Icon(icon),
        ],
      ),
    );
  }
}
