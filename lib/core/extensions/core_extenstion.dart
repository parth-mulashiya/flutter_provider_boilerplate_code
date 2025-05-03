import 'package:flutter/material.dart';

extension SpaceExtension on num {
  /// Vertical space (height)
  SizedBox get heightBox => SizedBox(height: toDouble());

  /// Horizontal space (width)
  SizedBox get widthBox => SizedBox(width: toDouble());

  /// Square space (equal height & width)
  SizedBox get squareBox => SizedBox(height: toDouble(), width: toDouble());

  //=== Padding Shortcuts ===//

  /// All sides
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  /// Symmetric vertical
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  /// Symmetric horizontal
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Padding only left
  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());

  /// Padding only top
  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());

  /// Padding only right
  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());

  /// Padding only bottom
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());

  //=== Border Radius Shortcuts ===//

  /// Same radius for all corners
  BorderRadius get circularRadius => BorderRadius.circular(toDouble());

  /// Radius only on top left
  BorderRadius get topLeftRadius =>
      BorderRadius.only(topLeft: Radius.circular(toDouble()));

  /// Radius only on top right
  BorderRadius get topRightRadius =>
      BorderRadius.only(topRight: Radius.circular(toDouble()));

  /// Radius only on bottom left
  BorderRadius get bottomLeftRadius =>
      BorderRadius.only(bottomLeft: Radius.circular(toDouble()));

  /// Radius only on bottom right
  BorderRadius get bottomRightRadius =>
      BorderRadius.only(bottomRight: Radius.circular(toDouble()));

  /// Radius for top (left and right)
  BorderRadius get topRadius => BorderRadius.only(
    topLeft: Radius.circular(toDouble()),
    topRight: Radius.circular(toDouble()),
  );

  /// Radius for bottom (left and right)
  BorderRadius get bottomRadius => BorderRadius.only(
    bottomLeft: Radius.circular(toDouble()),
    bottomRight: Radius.circular(toDouble()),
  );
}

extension ContextExtension on BuildContext {
  //=== Theme & Text ===//
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  //=== MediaQuery ===//
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get viewPadding => MediaQuery.of(this).padding;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
}
