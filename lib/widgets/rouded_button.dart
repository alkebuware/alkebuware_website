import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;
  final VoidCallback onTap;
  final EdgeInsets padding;

  const RoundedButton({Key key,
    this.text,
    @required this.textStyle,
    this.backgroundColor,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      shadowColor: backgroundColor,
      elevation: 4,
      color: backgroundColor,
      child: InkWell(
        splashColor: textStyle.color.withOpacity(.2),
        highlightColor: textStyle.color.withOpacity(.2),
        borderRadius: BorderRadius.circular(100),
        onTap: onTap ?? () {},
        child: Padding(
          padding: padding,
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}
