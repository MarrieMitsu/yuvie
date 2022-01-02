import 'package:flutter/material.dart';

// Custom TextButton
class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final Size? minimumSize;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final String text;
  final TextDecoration? decoration;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? elevation;
  final Widget? child;

  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.minimumSize = const Size(0, 0),
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 8.0,
    ),
    this.borderRadius,
    required this.text,
    this.decoration = TextDecoration.none,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.w500,
    this.elevation = 0.0,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: minimumSize,
        padding: padding,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5.0),
        ),
        primary: textColor,
        elevation: elevation,
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              decoration: decoration,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
    );
  }
}

// Custom IconButton
class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final Color color;
  final double iconSize;
  final Color backgroundColor;
  final bool borderRadius;
  final double radius;
  final bool border;
  final Color borderColor;

  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color = Colors.black,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = true,
    this.radius = 45.0,
    this.border = false,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius ? BorderRadius.circular(radius) : BorderRadius.zero,
      child: InkWell(
        borderRadius: borderRadius ? BorderRadius.circular(radius) : BorderRadius.zero,
        onTap: onTap,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            borderRadius: borderRadius ? BorderRadius.circular(radius) : BorderRadius.zero,
            border: border ? Border.all(
              width: 1.0,
              color: borderColor,
            ) : Border(),
          ),
          child: Center(
            child: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}