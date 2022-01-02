import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool? enabled;
  final TextAlign textAlign;
  final int? maxLines;
  final String? hintText;
  final double? fontSize;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Widget? firstWidget;
  final Widget? lastWidget;

  const CustomTextField({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.border,
    this.padding = const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
    this.backgroundColor = Colors.transparent,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.hintText = '',
    this.fontSize = 15.0,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.firstWidget,
    this.lastWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: border ??
              Border.all(color: Colors.black.withOpacity(0.3), width: 0.5)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            firstWidget ?? SizedBox.shrink(),
            Expanded(
              child: Container(
                padding: padding,
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  enabled: enabled,
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                  textAlign: textAlign,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: fontSize,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: fontSize,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            lastWidget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
