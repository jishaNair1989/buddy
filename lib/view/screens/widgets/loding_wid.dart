import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.color = KColors.kThemeYello,
    this.thickness = 3.0,
  }) : super(key: key);
  final Color color;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
      strokeWidth: thickness,
    ));
  }
}
