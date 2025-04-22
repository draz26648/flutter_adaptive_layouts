import 'package:flutter/material.dart';
import '../utils/screen_size_utils.dart';

/// A column that adapts its layout based on screen size
class AdaptiveColumn extends StatelessWidget {
  /// List of children widgets to display in the column
  final List<Widget> children;

  /// Spacing between items in the column
  final double spacing;

  /// Main axis alignment of the column
  final MainAxisAlignment mainAxisAlignment;

  /// Cross axis alignment of the column
  final CrossAxisAlignment crossAxisAlignment;

  /// Whether to convert to a row on desktop screens
  final bool convertToRowOnDesktop;

  /// Whether to reverse the order of items
  final bool reverse;

  /// Main axis size of the column
  final MainAxisSize mainAxisSize;

  /// Main axis alignment when converted to a row
  final MainAxisAlignment? rowMainAxisAlignment;

  /// Cross axis alignment when converted to a row
  final CrossAxisAlignment? rowCrossAxisAlignment;

  /// Spacing between items when converted to a row
  final double? rowSpacing;

  /// Constructor for AdaptiveColumn
  const AdaptiveColumn({
    super.key,
    required this.children,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.convertToRowOnDesktop = true,
    this.reverse = false,
    this.mainAxisSize = MainAxisSize.min,
    this.rowMainAxisAlignment,
    this.rowCrossAxisAlignment,
    this.rowSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ScreenSizeUtils.isDesktop(context);

    // If we're on desktop and should convert to a row
    if (isDesktop && convertToRowOnDesktop) {
      return Row(
        mainAxisAlignment: rowMainAxisAlignment ?? mainAxisAlignment,
        crossAxisAlignment: rowCrossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: _addSpacingBetweenItems(
          reverse ? children.reversed.toList() : children,
          rowSpacing ?? spacing,
          isRow: true,
        ),
      );
    } else {
      // Otherwise, use a column
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _addSpacingBetweenItems(
          reverse ? children.reversed.toList() : children,
          spacing,
          isRow: false,
        ),
      );
    }
  }

  // Helper method to add spacing between items
  List<Widget> _addSpacingBetweenItems(
    List<Widget> items,
    double spacing, {
    required bool isRow,
  }) {
    if (items.isEmpty) return [];
    if (items.length == 1) return items;

    final result = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(
          isRow ? SizedBox(width: spacing) : SizedBox(height: spacing),
        );
      }
    }
    return result;
  }
}
