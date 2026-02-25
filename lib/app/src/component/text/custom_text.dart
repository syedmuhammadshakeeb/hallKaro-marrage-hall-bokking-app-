import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomTextWidget extends StatelessWidget {
  final TextType type;
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final double? textScaleFactor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  const CustomTextWidget({
    super.key,
    required this.text,
    this.type = TextType.body1,
    this.style,
    this.maxLines,
    this.textAlign,
    this.textScaleFactor,
    this.textDirection,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
          text,
          style: _getStyle(
            context,
            textTheme,
          )!.merge(style).copyWith(height: 1.2),
          maxLines: maxLines,
          textAlign: textAlign,
          textScaler: TextScaler.linear( 1),
          //  textScaleFactor != null
          //     ? TextScaler.linear(textScaleFactor!)
          //     : null,
          textDirection: textDirection,
          overflow: overflow,
        );
      
  }

  TextStyle? _getStyle(BuildContext context, TextTheme textTheme) {
    switch (type) {
      case TextType.h1:
        return textTheme.headlineLarge;
      case TextType.h2:
        return textTheme.headlineMedium;
      case TextType.h3:
        return textTheme.headlineSmall;
      case TextType.h4:
        return textTheme.titleLarge;
      case TextType.subtitle1:
        return textTheme.titleMedium;
      case TextType.subtitle2:
        return textTheme.titleSmall;
      case TextType.body1:
        return textTheme.bodyLarge;
      case TextType.body2:
        return textTheme.bodyMedium;
      case TextType.caption:
        return textTheme.bodySmall;
      case TextType.overline:
        return textTheme.labelSmall;
    }
  }
}

enum TextType {
  h1,
  h2,
  h3,
  h4,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline,
}
