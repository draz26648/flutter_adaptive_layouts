import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A responsive row that adapts its layout based on screen size
class ResponsiveRow extends StatelessWidget {
  /// List of children widgets to display in the row
  final List<Widget> children;

  /// Spacing between items
  final double spacing;

  /// Alignment of the row
  final MainAxisAlignment mainAxisAlignment;

  /// Cross axis alignment of the row
  final CrossAxisAlignment crossAxisAlignment;

  /// Custom number of items to show on mobile screens
  final int? mobileItemCount;

  /// Custom number of items to show on tablet screens
  final int? tabletItemCount;

  /// Custom number of items to show on desktop screens
  final int? desktopItemCount;

  /// Whether to wrap items when they don't fit
  final bool wrap;

  /// Spacing between rows when wrap is true
  final double runSpacing;

  /// Whether to reverse the order of items
  final bool reverse;

  /// Constructor for ResponsiveRow
  const ResponsiveRow({
    super.key,
    required this.children,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mobileItemCount,
    this.tabletItemCount,
    this.desktopItemCount,
    this.wrap = false,
    this.runSpacing = 8.0,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizeUtils.getScreenSizeType(context);

    // Determine how many items to show based on screen size
    int itemCount = children.length;

    switch (screenType) {
      case ScreenSizeType.mobile:
        itemCount = mobileItemCount ?? children.length;
        break;
      case ScreenSizeType.tablet:
        itemCount = tabletItemCount ?? children.length;
        break;
      case ScreenSizeType.desktop:
      case ScreenSizeType.largeDesktop:
      case ScreenSizeType.extraLargeDesktop:
        itemCount = desktopItemCount ?? children.length;
        break;
    }

    // Limit the number of items to show
    final visibleChildren = children.take(itemCount).toList();

    // Create the row or wrap based on the wrap parameter
    if (wrap) {
      return Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        direction: Axis.horizontal,
        alignment: _convertMainAxisToWrapAlignment(mainAxisAlignment),
        crossAxisAlignment: _convertCrossAxisToWrapCrossAlignment(
          crossAxisAlignment,
        ),
        children: reverse ? visibleChildren.reversed.toList() : visibleChildren,
      );
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _addSpacingBetweenItems(
          reverse ? visibleChildren.reversed.toList() : visibleChildren,
          spacing,
        ),
      );
    }
  }

  // Helper method to add spacing between items in a row
  List<Widget> _addSpacingBetweenItems(List<Widget> items, double spacing) {
    if (items.isEmpty) return [];
    if (items.length == 1) return items;

    final result = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(SizedBox(width: spacing));
      }
    }
    return result;
  }

  // Convert MainAxisAlignment to WrapAlignment
  WrapAlignment _convertMainAxisToWrapAlignment(MainAxisAlignment alignment) {
    switch (alignment) {
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }

  // Convert CrossAxisAlignment to WrapCrossAlignment
  WrapCrossAlignment _convertCrossAxisToWrapCrossAlignment(
    CrossAxisAlignment alignment,
  ) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      case CrossAxisAlignment.stretch:
      case CrossAxisAlignment.baseline:
        return WrapCrossAlignment.center; // Default fallback
    }
  }
}
