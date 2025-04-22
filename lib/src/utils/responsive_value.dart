import 'package:flutter/material.dart';
import 'screen_size_utils.dart';

/// A class that provides different values based on screen size
class ResponsiveValue<T> {
  /// Value for mobile screens
  final T mobile;

  /// Value for tablet screens
  final T? tablet;

  /// Value for desktop screens
  final T? desktop;

  /// Value for large desktop screens
  final T? largeDesktop;

  /// Constructor for ResponsiveValue
  const ResponsiveValue({
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  /// Get the value based on the current screen size
  T get(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);
    
    switch (screenType) {
      case ScreenSizeType.mobile:
        return mobile;
      case ScreenSizeType.tablet:
        return tablet ?? mobile;
      case ScreenSizeType.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }

  /// Create a new ResponsiveValue with updated values
  ResponsiveValue<T> copyWith({
    T? mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    return ResponsiveValue<T>(
      mobile: mobile ?? this.mobile,
      tablet: tablet ?? this.tablet,
      desktop: desktop ?? this.desktop,
      largeDesktop: largeDesktop ?? this.largeDesktop,
    );
  }
}

/// Extension methods for common types
extension ResponsiveValueExtensions on BuildContext {
  /// Get a double value based on screen size
  double responsiveDouble(
    double mobile, {
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) {
    return ResponsiveValue<double>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    ).get(this);
  }

  /// Get an int value based on screen size
  int responsiveInt(
    int mobile, {
    int? tablet,
    int? desktop,
    int? largeDesktop,
  }) {
    return ResponsiveValue<int>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    ).get(this);
  }

  /// Get an EdgeInsets value based on screen size
  EdgeInsets responsiveEdgeInsets(
    EdgeInsets mobile, {
    EdgeInsets? tablet,
    EdgeInsets? desktop,
    EdgeInsets? largeDesktop,
  }) {
    return ResponsiveValue<EdgeInsets>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    ).get(this);
  }
}
