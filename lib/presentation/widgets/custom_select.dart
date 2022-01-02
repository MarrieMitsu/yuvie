import 'package:flutter/material.dart';

// Custom Select
class CustomSelect<T> extends StatelessWidget {
  final T? value;
  final void Function(T?)? onChange;
  final Function()? onTap;
  final String hintText;
  final int elevation;
  final List<DropdownMenuItem<T>> items;
  final Widget? firstWidget;
  final Widget? lastWidget;

  const CustomSelect({
    Key? key,
    this.value,
    this.onChange,
    this.onTap,
    this.hintText = 'Select',
    this.elevation = 8,
    required this.items,
    this.firstWidget,
    this.lastWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 0.5),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            firstWidget ?? SizedBox.shrink(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: DropdownButton<T>(
                  onTap: onTap,
                  onChanged: onChange,
                  value: value,
                  hint: Text(
                    hintText,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15.0,
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down_rounded,
                  ),
                  underline: SizedBox(),
                  iconSize: 24,
                  elevation: elevation,
                  isDense: true,
                  isExpanded: true,
                  items: items,
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
