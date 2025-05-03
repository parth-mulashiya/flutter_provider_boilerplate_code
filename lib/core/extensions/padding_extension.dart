import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  // All sides
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  // Symmetric vertical and horizontal
  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  // Only specific sides
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  // Individual sides
  Widget paddingTop(double value) =>
      Padding(padding: EdgeInsets.only(top: value), child: this);

  Widget paddingBottom(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);

  Widget paddingLeft(double value) =>
      Padding(padding: EdgeInsets.only(left: value), child: this);

  Widget paddingRight(double value) =>
      Padding(padding: EdgeInsets.only(right: value), child: this);

  Widget paddingHorizontal(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  Widget paddingVertical(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);
}
