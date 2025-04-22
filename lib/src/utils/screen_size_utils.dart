import 'package:flutter/material.dart';

/// Utility class to determine screen size based on width
class ScreenSizeUtils {
  /// Default breakpoints for different screen sizes
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
  static const double largeDesktopBreakpoint = 1800.0;

  /// Returns the current screen size type based on width
  static ScreenSizeType getScreenSizeType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return getScreenSizeTypeFromWidth(width);
  }

  /// Returns the screen size type based on a given width
  static ScreenSizeType getScreenSizeTypeFromWidth(double width) {
    if (width < mobileBreakpoint) {
      return ScreenSizeType.mobile;
    } else if (width < tabletBreakpoint) {
      return ScreenSizeType.tablet;
    } else if (width < desktopBreakpoint) {
      return ScreenSizeType.desktop;
    } else if (width < largeDesktopBreakpoint) {
      return ScreenSizeType.largeDesktop;
    } else {
      return ScreenSizeType.extraLargeDesktop;
    }
  }

  /// Returns true if the screen is considered mobile
  static bool isMobile(BuildContext context) {
    return getScreenSizeType(context) == ScreenSizeType.mobile;
  }

  /// Returns true if the screen is considered tablet
  static bool isTablet(BuildContext context) {
    return getScreenSizeType(context) == ScreenSizeType.tablet;
  }

  /// Returns true if the screen is considered desktop
  static bool isDesktop(BuildContext context) {
    return getScreenSizeType(context) == ScreenSizeType.desktop ||
        getScreenSizeType(context) == ScreenSizeType.largeDesktop ||
        getScreenSizeType(context) == ScreenSizeType.extraLargeDesktop;
  }

  /// Returns true if the screen is considered mobile or tablet
  static bool isMobileOrTablet(BuildContext context) {
    final type = getScreenSizeType(context);
    return type == ScreenSizeType.mobile || type == ScreenSizeType.tablet;
  }

  /// Returns the orientation of the device
  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  /// Returns true if the device is in portrait orientation
  static bool isPortrait(BuildContext context) {
    return getOrientation(context) == Orientation.portrait;
  }

  /// Returns true if the device is in landscape orientation
  static bool isLandscape(BuildContext context) {
    return getOrientation(context) == Orientation.landscape;
  }
}

/// Enum representing different screen size types
enum ScreenSizeType {
  mobile,
  tablet,
  desktop,
  largeDesktop,
  extraLargeDesktop,
}
