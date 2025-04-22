import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A builder that returns different widgets based on screen size
class ResponsiveBuilder extends StatelessWidget {
  /// Builder function for mobile screens
  final WidgetBuilder mobileBuilder;

  /// Builder function for tablet screens
  final WidgetBuilder? tabletBuilder;

  /// Builder function for desktop screens
  final WidgetBuilder? desktopBuilder;

  /// Builder function for large desktop screens
  final WidgetBuilder? largeDesktopBuilder;

  /// Constructor for ResponsiveBuilder
  const ResponsiveBuilder({
    super.key,
    required this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
    this.largeDesktopBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);

    switch (screenType) {
      case ScreenSizeType.mobile:
        return mobileBuilder(context);
      case ScreenSizeType.tablet:
        return (tabletBuilder ?? mobileBuilder)(context);
      case ScreenSizeType.desktop:
        return (desktopBuilder ?? tabletBuilder ?? mobileBuilder)(context);
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        return (largeDesktopBuilder ??
            desktopBuilder ??
            tabletBuilder ??
            mobileBuilder)(context);
    }
  }
}

/// A widget that displays different children based on screen size
class ResponsiveWidget extends StatelessWidget {
  /// Widget to display on mobile screens
  final Widget mobile;

  /// Widget to display on tablet screens
  final Widget? tablet;

  /// Widget to display on desktop screens
  final Widget? desktop;

  /// Widget to display on large desktop screens
  final Widget? largeDesktop;

  /// Constructor for ResponsiveWidget
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileBuilder: (_) => mobile,
      tabletBuilder: tablet != null ? (_) => tablet! : null,
      desktopBuilder: desktop != null ? (_) => desktop! : null,
      largeDesktopBuilder: largeDesktop != null ? (_) => largeDesktop! : null,
    );
  }
}
