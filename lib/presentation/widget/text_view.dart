import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLine;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  final TextOverflow? textOverflow;

  const TextView(
      {Key? key,
      required this.text,
      this.fontSize,
      this.textAlign,
      this.color,
      this.textOverflow, this.fontWeight, this.maxLine, this.letterSpacing, this.fontStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color??Theme.of(context).textTheme.bodyText2?.color!,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          fontWeight: fontWeight, fontSize: fontSize),
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: textOverflow,
    );
  }
}
