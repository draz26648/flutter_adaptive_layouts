import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A container that adapts its size based on screen size
class ResponsiveContainer extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// Width percentage on mobile screens (0.0 to 1.0)
  final double mobileWidthFraction;

  /// Width percentage on tablet screens (0.0 to 1.0)
  final double tabletWidthFraction;

  /// Width percentage on desktop screens (0.0 to 1.0)
  final double desktopWidthFraction;

  /// Maximum width on mobile screens
  final double? mobileMaxWidth;

  /// Maximum width on tablet screens
  final double? tabletMaxWidth;

  /// Maximum width on desktop screens
  final double? desktopMaxWidth;

  /// Height of the container
  final double? height;

  /// Minimum height of the container
  final double? minHeight;

  /// Maximum height of the container
  final double? maxHeight;

  /// Padding inside the container
  final EdgeInsetsGeometry? padding;

  /// Margin around the container
  final EdgeInsetsGeometry? margin;

  /// Alignment of the child within the container
  final Alignment? alignment;

  /// Decoration of the container
  final BoxDecoration? decoration;

  /// Constructor for ResponsiveContainer
  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobileWidthFraction = 1.0,
    this.tabletWidthFraction = 0.8,
    this.desktopWidthFraction = 0.6,
    this.mobileMaxWidth,
    this.tabletMaxWidth,
    this.desktopMaxWidth,
    this.height,
    this.minHeight,
    this.maxHeight,
    this.padding,
    this.margin,
    this.alignment,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenType = ScreenSizeUtils.getScreenSizeType(context);
    
    // Determine width based on screen size
    double widthFraction;
    double? maxWidth;
    
    switch (screenType) {
      case ScreenSizeType.mobile:
        widthFraction = mobileWidthFraction;
        maxWidth = mobileMaxWidth;
        break;
      case ScreenSizeType.tablet:
        widthFraction = tabletWidthFraction;
        maxWidth = tabletMaxWidth;
        break;
      case ScreenSizeType.desktop:
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        widthFraction = desktopWidthFraction;
        maxWidth = desktopMaxWidth;
        break;
    }
    
    // Calculate width based on fraction and max width
    double? width = screenWidth * widthFraction;
    if (maxWidth != null && width > maxWidth) {
      width = maxWidth;
    }
    
    return Container(
      width: width,
      height: height,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: decoration,
      child: child,
    );
  }
}
