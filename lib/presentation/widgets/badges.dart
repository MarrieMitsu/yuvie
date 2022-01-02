import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Color borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Widget? child;

  const Badges({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.backgroundColor = Colors.transparent,
    this.border,
    this.borderColor = Colors.black,
    this.borderRadius,
    this.padding = const EdgeInsets.all(5),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? Border.all(
          width: 1.0,
          color: borderColor,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(50.0),
      ),
      child: child ?? Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}