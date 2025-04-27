import 'package:flutter/material.dart';

/// A widget that creates vertical space with a specified height.
/// We avoid creating them as functions to avoid the need for a context and make them const as possible.
///
/// This is a convenience widget similar to SizedBox but specifically for
/// vertical spacing.
class VerticalSpace extends StatelessWidget {
  /// Creates a widget that adds vertical space.
  ///
  /// The [height] parameter is required and specifies the amount of vertical space.
  const VerticalSpace({super.key, required this.height});

  /// The height of the vertical space.
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

/// A widget that creates horizontal space with a specified width.
///
/// This is a convenience widget similar to SizedBox but specifically for
/// horizontal spacing.
class HorizontalSpace extends StatelessWidget {
  /// Creates a widget that adds horizontal space.
  ///
  /// The [width] parameter is required and specifies the amount of horizontal space.
  const HorizontalSpace({super.key, required this.width});

  /// The width of the horizontal space.
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
