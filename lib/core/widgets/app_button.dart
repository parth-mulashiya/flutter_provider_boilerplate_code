import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final bool? isShadow;
  final double? verticalPadding;
  final double? iconSize;
  final bool? isLoading;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.icon,
    this.isShadow = true,
    this.verticalPadding,
    this.iconSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!isLoading!) onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 12.h),
          backgroundColor: color ?? ColorConstants.primaryColor,
          shadowColor: ColorConstants.lightGray,
          elevation: isShadow ?? true ? 5 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.w),
          ),
        ),
        child:
            (isLoading ?? false)
                ? Center(
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: CircularProgressIndicator(
                      color: textColor ?? Colors.white,
                      strokeWidth: 3.w,
                    ),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Padding(
                          padding: EdgeInsets.only(
                            right: text.isEmpty ? 0.w : 10.w,
                          ),
                          child: Icon(
                            icon,
                            color: textColor ?? Colors.white,
                            size: iconSize ?? 24.w,
                          ),
                        )
                        : const SizedBox(),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
