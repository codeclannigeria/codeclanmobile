import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.title,
    this.onPressed,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_50,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppColors.buttonShade1,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
  });

  final VoidCallback onPressed;
  final double width;
  final double height;
  final double elevation;
  final double borderRadius;
  final Widget title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        elevation: elevation,
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderSide,
        ),
        height: height,
        color: color,
        child: title);
  }
}
