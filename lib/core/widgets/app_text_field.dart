// ignore_for_file: prefer_const_constructors

import 'package:demo_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import '../constants/common_constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? text;
  //FieldIcon icon;
  final bool password, readonly, expands;
  final double radius;
  final Widget? iconSuffix;
  final Widget? iconPrefix;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final int? maxLength;
  // final Function? validator;
  final String? Function(String?)? validator;
  final bool? enable;
  final List<TextInputFormatter>? inputFormater;
  final Function? onEditingComplete;
  final Function(String)? onChange;
  final int maxLine;
  final Color? borderColor;
  final Color? filledColor;
  final String? helperText;
  final String? hintText;
  final Color? helperTextColor;
  final BorderStyle? borderStyle;
  final double? borderWidth;
  final EdgeInsetsGeometry? margin;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final OutlineInputBorder? errorBorder;
  final bool? isShadow;
  final Iterable<String>? autofillHints;
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.text,
    this.password = false,
    this.readonly = false,
    this.expands = false,
    this.radius = 7,
    this.iconSuffix,
    this.iconPrefix,
    this.suffixWidget,
    this.prefixWidget,
    this.focusNode,
    this.textAlign,
    this.onTap,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.enable,
    this.inputFormater,
    this.onEditingComplete,
    this.onChange,
    this.maxLine = 1,
    this.borderColor = Colors.transparent,
    this.filledColor = Colors.white,
    this.helperText,
    this.hintText,
    this.borderStyle = BorderStyle.none,
    this.borderWidth = 0,
    this.helperTextColor = Colors.green,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.textInputAction,
    this.margin,
    this.errorBorder,
    this.textCapitalization = TextCapitalization.none,
    this.isShadow = false,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: filledColor,
        borderRadius: radius == 0 ? null : BorderRadius.circular(radius),
        boxShadow: isShadow! ? [CommonConstants.boxShadow] : [],
      ),
      margin: EdgeInsets.symmetric(vertical: 5.w),
      child: TextFormField(
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText,
          counterText: "",
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14.sp,
            color: ColorConstants.darkGray,
          ),
          contentPadding:
              margin ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
          errorBorder: errorBorder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              style: borderStyle ?? BorderStyle.none,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              style: borderStyle ?? BorderStyle.none,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              style: borderStyle ?? BorderStyle.none,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              style: borderStyle ?? BorderStyle.none,
              color: borderColor ?? Colors.transparent,
            ),
          ),
          isDense: true,
          helperText: helperText,
          helperStyle: TextStyle(
            color: helperTextColor,
            overflow: TextOverflow.clip,
          ),
          fillColor: filledColor,
          filled: true,
          suffixIcon: iconSuffix,
          suffix: suffixWidget,
          prefixIcon: iconPrefix,
          prefix: prefixWidget,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorConstants.lightGray,
            fontSize: 14.sp,
          ),
        ),
        initialValue: text,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onTap: onTap,
        focusNode: focusNode,
        controller: controller,
        autofocus: false,
        obscureText: password,
        readOnly: readonly,
        textAlign: textAlign ?? TextAlign.left,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
        textAlignVertical: TextAlignVertical.top,
        expands: expands,
        maxLines: maxLine,
        validator: validator,
        enabled: enable,
        inputFormatters: inputFormater,
        onEditingComplete: onEditingComplete as void Function()?,
        onChanged: onChange,
        autovalidateMode: autovalidateMode,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofillHints: autofillHints,
      ),
    );
  }
}
