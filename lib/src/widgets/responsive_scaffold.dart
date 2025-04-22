import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A responsive scaffold that adapts its layout based on screen size
class ResponsiveScaffold extends StatelessWidget {
  /// App bar for the scaffold
  final PreferredSizeWidget? appBar;

  /// Body of the scaffold
  final Widget body;

  /// Drawer for mobile and tablet screens
  final Widget? drawer;

  /// Navigation rail for desktop screens
  final Widget? navigationRail;

  /// Bottom navigation bar for mobile screens
  final Widget? bottomNavigationBar;

  /// Floating action button
  final Widget? floatingActionButton;

  /// Floating action button location
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Whether to show the drawer on desktop screens
  final bool showDrawerOnDesktop;

  /// Width of the navigation rail
  final double navigationRailWidth;

  /// Background color of the scaffold
  final Color? backgroundColor;

  /// Whether to resize the body to avoid bottom insets
  final bool? resizeToAvoidBottomInset;

  /// Constructor for ResponsiveScaffold
  const ResponsiveScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.drawer,
    this.navigationRail,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.showDrawerOnDesktop = false,
    this.navigationRailWidth = 72.0,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ScreenSizeUtils.isDesktop(context);

    // If we're on desktop and have a navigation rail
    if (isDesktop && navigationRail != null && !showDrawerOnDesktop) {
      return Scaffold(
        appBar: appBar,
        body: Row(
          children: [
            SizedBox(width: navigationRailWidth, child: navigationRail!),
            Expanded(child: body),
          ],
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
    } else {
      // Otherwise, use a standard scaffold with drawer and bottom navigation
      return Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: body,
        bottomNavigationBar: !isDesktop ? bottomNavigationBar : null,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
    }
  }
}
