import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A text widget that adapts its size based on screen size
class ResponsiveText extends StatelessWidget {
  /// Text to display
  final String text;

  /// Text style for mobile screens
  final TextStyle? mobileStyle;

  /// Text style for tablet screens
  final TextStyle? tabletStyle;

  /// Text style for desktop screens
  final TextStyle? desktopStyle;

  /// Text style for large desktop screens
  final TextStyle? largeDesktopStyle;

  /// Text alignment
  final TextAlign? textAlign;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Maximum number of lines
  final int? maxLines;

  /// Whether to softwrap text
  final bool? softWrap;

  /// Text scaling factor
  final double? textScaleFactor;

  /// Constructor for ResponsiveText
  const ResponsiveText(
    this.text, {
    super.key,
    this.mobileStyle,
    this.tabletStyle,
    this.desktopStyle,
    this.largeDesktopStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);
    
    // Determine text style based on screen size
    TextStyle? style;
    switch (screenType) {
      case ScreenSizeType.mobile:
        style = mobileStyle;
        break;
      case ScreenSizeType.tablet:
        style = tabletStyle ?? mobileStyle;
        break;
      case ScreenSizeType.desktop:
        style = desktopStyle ?? tabletStyle ?? mobileStyle;
        break;
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        style = largeDesktopStyle ?? desktopStyle ?? tabletStyle ?? mobileStyle;
        break;
    }
    
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textScaler: textScaleFactor != null 
          ? TextScaler.linear(textScaleFactor!) 
          : null,
    );
  }
}
