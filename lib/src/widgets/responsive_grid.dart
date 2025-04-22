import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A responsive grid that adapts its layout based on screen size
class ResponsiveGrid extends StatelessWidget {
  /// List of children widgets to display in the grid
  final List<Widget> children;

  /// Number of columns to show on mobile screens
  final int mobileColumns;

  /// Number of columns to show on tablet screens
  final int tabletColumns;

  /// Number of columns to show on desktop screens
  final int desktopColumns;

  /// Number of columns to show on large desktop screens
  final int largeDesktopColumns;

  /// Spacing between columns
  final double crossAxisSpacing;

  /// Spacing between rows
  final double mainAxisSpacing;

  /// Aspect ratio of each grid item
  final double childAspectRatio;

  /// Whether to use a fixed cross axis count or a max cross axis extent
  final bool useMaxCrossAxisExtent;

  /// Maximum cross axis extent when useMaxCrossAxisExtent is true
  final double? maxCrossAxisExtent;

  /// Padding around the grid
  final EdgeInsetsGeometry? padding;

  /// Constructor for ResponsiveGrid
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 4,
    this.largeDesktopColumns = 6,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.childAspectRatio = 1.0,
    this.useMaxCrossAxisExtent = false,
    this.maxCrossAxisExtent,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);

    // Determine number of columns based on screen size
    int crossAxisCount;
    switch (screenType) {
      case ScreenSizeType.mobile:
        crossAxisCount = mobileColumns;
        break;
      case ScreenSizeType.tablet:
        crossAxisCount = tabletColumns;
        break;
      case ScreenSizeType.desktop:
        crossAxisCount = desktopColumns;
        break;
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        crossAxisCount = largeDesktopColumns;
        break;
    }

    // Use either a fixed cross axis count or a max cross axis extent
    if (useMaxCrossAxisExtent && maxCrossAxisExtent != null) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: padding,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent!,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      );
    }
  }
}

/// A responsive grid view that can be scrolled
class ResponsiveGridView extends StatelessWidget {
  /// List of children widgets to display in the grid
  final List<Widget> children;

  /// Number of columns to show on mobile screens
  final int mobileColumns;

  /// Number of columns to show on tablet screens
  final int tabletColumns;

  /// Number of columns to show on desktop screens
  final int desktopColumns;

  /// Number of columns to show on large desktop screens
  final int largeDesktopColumns;

  /// Spacing between columns
  final double crossAxisSpacing;

  /// Spacing between rows
  final double mainAxisSpacing;

  /// Aspect ratio of each grid item
  final double childAspectRatio;

  /// Whether to use a fixed cross axis count or a max cross axis extent
  final bool useMaxCrossAxisExtent;

  /// Maximum cross axis extent when useMaxCrossAxisExtent is true
  final double? maxCrossAxisExtent;

  /// Padding around the grid
  final EdgeInsetsGeometry? padding;

  /// Scroll controller for the grid
  final ScrollController? controller;

  /// Scroll physics for the grid
  final ScrollPhysics? physics;

  /// Primary scroll view
  final bool? primary;

  /// Constructor for ResponsiveGridView
  const ResponsiveGridView({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 4,
    this.largeDesktopColumns = 6,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
    this.childAspectRatio = 1.0,
    this.useMaxCrossAxisExtent = false,
    this.maxCrossAxisExtent,
    this.padding,
    this.controller,
    this.physics,
    this.primary,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);

    // Determine number of columns based on screen size
    int crossAxisCount;
    switch (screenType) {
      case ScreenSizeType.mobile:
        crossAxisCount = mobileColumns;
        break;
      case ScreenSizeType.tablet:
        crossAxisCount = tabletColumns;
        break;
      case ScreenSizeType.desktop:
        crossAxisCount = desktopColumns;
        break;
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        crossAxisCount = largeDesktopColumns;
        break;
    }

    // Use either a fixed cross axis count or a max cross axis extent
    if (useMaxCrossAxisExtent && maxCrossAxisExtent != null) {
      return GridView.builder(
        controller: controller,
        physics: physics,
        primary: primary,
        padding: padding,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent!,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      );
    } else {
      return GridView.builder(
        controller: controller,
        physics: physics,
        primary: primary,
        padding: padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      );
    }
  }
}
