import 'package:demo_app/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color seedColor,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    // Define font family
    const String fontFamily = AssetsConstants.font;

    // Generate ColorScheme from seed color
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
      // background: background,
      error: error,
      onError: Colors.white,
      surface: cardBackground ?? background,
      onSurface: primaryText,
      primary: accentColor,
      onPrimary: buttonText,
      secondary: accentColor.withValues(alpha: .7),
      onSecondary: buttonText,
      tertiary: accentColor.withValues(alpha: .5),
      onTertiary: buttonText,
    );

    // Text theme with responsive font sizes
    final TextTheme textTheme = TextTheme(
      // Display styles
      displayLarge: TextStyle(
        color: primaryText,
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        color: primaryText,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        letterSpacing: -0.25,
      ),
      displaySmall: TextStyle(
        color: secondaryText,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        color: primaryText,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        color: primaryText,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        color: primaryText,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      ),

      // Title styles
      titleLarge: TextStyle(
        color: primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        color: primaryText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        letterSpacing: 0.1,
      ),
      titleSmall: TextStyle(
        color: secondaryText,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        letterSpacing: 0.1,
      ),

      // Body styles
      bodyLarge: TextStyle(
        color: secondaryText,
        fontSize: 15.sp,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: primaryText,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: primaryText,
        fontSize: 11.sp,
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
        letterSpacing: 0.4,
      ),

      // Label styles
      labelLarge: TextStyle(
        color: primaryText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: secondaryText,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: secondaryText,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: brightness,
      colorScheme: colorScheme,

      // Basic colors
      scaffoldBackgroundColor: background,
      canvasColor: background,
      cardColor: cardBackground ?? colorScheme.surface,

      // Divider theme
      dividerColor: divider ?? colorScheme.outlineVariant,
      dividerTheme: DividerThemeData(
        color: divider ?? colorScheme.outlineVariant,
        space: 1.h,
        thickness: 1.w,
        indent: 0,
        endIndent: 0,
      ),

      // Card theme
      cardTheme: CardTheme(
        color: cardBackground ?? colorScheme.surface,
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        elevation: 2,
        shadowColor: colorScheme.shadow,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
        ),
      ),

      // Dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: cardBackground ?? colorScheme.surface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        titleTextStyle: textTheme.headlineSmall,
        contentTextStyle: textTheme.bodyMedium,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),

      // AlertDialog theme

      // alertDialogTheme: AlertDialogTheme(
      //   backgroundColor: cardBackground ?? colorScheme.surface,
      //   elevation: 6,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16.r),
      //   ),
      //   titleTextStyle: textTheme.headlineSmall,
      //   contentTextStyle: textTheme.bodyMedium,
      //   actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      //   actionsOverflowButtonSpacing: 8.w,
      //   actionsOverflowDirection: VerticalDirection.down,
      // ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor:
            brightness == Brightness.light
                ? colorScheme.primary
                : colorScheme.primary,
        foregroundColor:
            brightness == Brightness.light
                ? colorScheme.onPrimary
                : colorScheme.onSurface,
        elevation: 2,
        centerTitle: true,
        toolbarHeight: 56.h,
        scrolledUnderElevation: 4,
        shadowColor: colorScheme.shadow,
        iconTheme: IconThemeData(
          color:
              brightness == Brightness.light
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
          size: 24.sp,
        ),
        actionsIconTheme: IconThemeData(
          color:
              brightness == Brightness.light
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
          size: 24.sp,
        ),
        titleTextStyle: TextStyle(
          color:
              brightness == Brightness.light
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          letterSpacing: 0.15,
        ),
        toolbarTextStyle: TextStyle(
          color:
              brightness == Brightness.light
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
          fontSize: 16.sp,
          fontFamily: fontFamily,
          letterSpacing: 0.15,
        ),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardBackground ?? colorScheme.surface,
        elevation: 8,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        selectedIconTheme: IconThemeData(size: 24.sp),
        unselectedIconTheme: IconThemeData(size: 24.sp),
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),

      // Navigation rail theme
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: cardBackground ?? colorScheme.surface,
        elevation: 4,
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
          size: 24.sp,
        ),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurfaceVariant,
          size: 24.sp,
        ),
        selectedLabelTextStyle: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        useIndicator: true,
        indicatorColor: colorScheme.primaryContainer,
        labelType: NavigationRailLabelType.selected,
      ),

      // Text selection theme
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colorScheme.primary.withValues(alpha: .3),
        selectionHandleColor: colorScheme.primary,
        cursorColor: colorScheme.primary,
      ),

      // Icon theme
      iconTheme: IconThemeData(
        color: secondaryText ?? colorScheme.onSurfaceVariant,
        size: 24.sp,
      ),
      primaryIconTheme: IconThemeData(
        color: colorScheme.onPrimary,
        size: 24.sp,
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          minimumSize: Size(64.w, 40.h),
          maximumSize: Size(double.infinity, 48.h),
          disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: .12),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: .38),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          minimumSize: Size(64.w, 36.h),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: .38),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          side: BorderSide(color: colorScheme.outline, width: 1.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          minimumSize: Size(64.w, 40.h),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: .38),
          disabledBackgroundColor: Colors.transparent,
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colorScheme.onSurfaceVariant,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: .38),
          iconSize: 24.sp,
          minimumSize: Size(40.w, 40.h),
          padding: EdgeInsets.all(8.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          minimumSize: Size(64.w, 40.h),
          disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: .12),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: .38),
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 6,
        focusElevation: 8,
        hoverElevation: 8,
        disabledElevation: 0,
        highlightElevation: 12,
        splashColor: colorScheme.onPrimary.withValues(alpha: .12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        extendedTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),

      // Toggle button theme
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: colorScheme.onSurface,
        selectedColor: colorScheme.primary,
        disabledColor: colorScheme.onSurface.withValues(alpha: .38),
        fillColor: colorScheme.primary.withValues(alpha: .12),
        focusColor: colorScheme.primary.withValues(alpha: .12),
        highlightColor: colorScheme.primary.withValues(alpha: .12),
        hoverColor: colorScheme.primary.withValues(alpha: .08),
        splashColor: colorScheme.primary.withValues(alpha: .12),
        borderColor: colorScheme.outline,
        selectedBorderColor: colorScheme.primary,
        disabledBorderColor: colorScheme.onSurface.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(8.r),
        borderWidth: 1.w,
        constraints: BoxConstraints(minHeight: 36.h, minWidth: 48.w),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceVariant.withValues(alpha: .5),
        focusColor: colorScheme.primary.withValues(alpha: .1),
        hoverColor: colorScheme.primary.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.error, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.error, width: 2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: .12),
            width: 1.w,
          ),
        ),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
        ),
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant.withValues(alpha: .6),
        ),
        helperStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        errorStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.error,
        ),
        prefixStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        suffixStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        counterStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        errorMaxLines: 2,
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withValues(alpha: .12);
          }
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.surfaceContainerHighest;
        }),
        checkColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withValues(alpha: .38);
          }
          return colorScheme.onPrimary;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: .12);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: .08);
          }
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        side: BorderSide(color: colorScheme.outline, width: 1.5.w),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      // Radio button theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.onSurface.withValues(alpha: .12);
          }
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.surfaceContainerHighest;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: .12);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary.withValues(alpha: .08);
          }
          return Colors.transparent;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.onSurface.withValues(alpha: .38);
            }
            return colorScheme.onSurface.withValues(alpha: .38);
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.onSurface.withValues(alpha: .12);
            }
            return colorScheme.surfaceVariant.withValues(alpha: .12);
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.surfaceVariant;
        }),
        trackOutlineColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withValues(alpha: 0.12);
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.outline;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.08);
          }
          return Colors.transparent;
        }),
        splashRadius: 24.r,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.surfaceVariant,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.12),
        valueIndicatorColor: colorScheme.primaryContainer,
        valueIndicatorTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimaryContainer,
        ),
        trackHeight: 4.h,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.onlyForDiscrete,
        tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 2.r),
        activeTickMarkColor: colorScheme.onPrimary,
        inactiveTickMarkColor: colorScheme.outline,
      ),

      // Progress indicator theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceVariant,
        circularTrackColor: colorScheme.surfaceVariant,
        refreshBackgroundColor: colorScheme.surfaceVariant,
        linearMinHeight: 4.h,
      ),

      // Tooltip theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4.r),
        ),
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onInverseSurface,
        ),
        preferBelow: true,
        verticalOffset: 20.h,
      ),

      // Popup menu theme
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        elevation: 4,
        enableFeedback: true,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface.withValues(alpha: 0.38),
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          );
        }),
      ),

      // Date picker theme
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        elevation: 6,
        shadowColor: colorScheme.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        headerBackgroundColor: colorScheme.primary,
        headerForegroundColor: colorScheme.onPrimary,
        headerHeadlineStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
        headerHelpStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onPrimary.withValues(alpha: 0.8),
        ),
        weekdayStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurfaceVariant,
        ),
        dayStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        dayForegroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withValues(alpha: 0.38);
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.onSurface;
        }),
        dayBackgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.12);
          }
          return Colors.transparent;
        }),
        todayForegroundColor: MaterialStateProperty.all(colorScheme.primary),
        todayBackgroundColor: MaterialStateProperty.all(
          colorScheme.primaryContainer.withValues(alpha: 0.3),
        ),
        rangePickerBackgroundColor: colorScheme.surface,
        rangePickerElevation: 6,
        rangePickerShadowColor: colorScheme.shadow,
        rangePickerHeaderBackgroundColor: colorScheme.primary,
        rangePickerHeaderForegroundColor: colorScheme.onPrimary,
        rangePickerHeaderHeadlineStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
        rangePickerHeaderHelpStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onPrimary.withValues(alpha: 0.8),
        ),
        rangeSelectionBackgroundColor: colorScheme.primaryContainer.withValues(
          alpha: 0.5,
        ),
        rangeSelectionOverlayColor: MaterialStateProperty.all(
          colorScheme.primaryContainer.withValues(alpha: 0.3),
        ),
        dividerColor: colorScheme.outlineVariant,
      ),

      // Time picker theme
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.surface,
        hourMinuteTextColor: colorScheme.primary,
        hourMinuteColor: colorScheme.surfaceVariant,
        dialBackgroundColor: colorScheme.surfaceVariant,
        dayPeriodColor: colorScheme.surfaceVariant,

        dayPeriodBorderSide: BorderSide(
          color: colorScheme.surfaceVariant,
          width: 1.w,
        ),
        dialHandColor: colorScheme.primary,
        dialTextColor: colorScheme.onSurfaceVariant,
        entryModeIconColor: colorScheme.primary,
        hourMinuteTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        ),
        dayPeriodTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.primary,
        ),
        helpTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 6,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: colorScheme.primary, width: 2.w),
          ),
        ),
      ),

      // Tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
        ),
        indicatorColor: colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: colorScheme.outlineVariant,
        labelPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.12);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withValues(alpha: 0.08);
          }
          return Colors.transparent;
        }),
      ),

      // Drawer theme
      drawerTheme: DrawerThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 16,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        width: 280.w,
        scrimColor: colorScheme.scrim.withValues(alpha: 0.6),
      ),

      // Snack bar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onInverseSurface,
        ),
        actionTextColor: colorScheme.inversePrimary,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        behavior: SnackBarBehavior.floating,
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceVariant,
        deleteIconColor: colorScheme.onSurfaceVariant,
        disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
        selectedColor: colorScheme.secondaryContainer,
        secondarySelectedColor: colorScheme.primaryContainer,
        secondaryLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.onPrimaryContainer,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        labelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurfaceVariant,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 0,
        pressElevation: 1,
        side: BorderSide(color: colorScheme.outline, width: 1.w),
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        minLeadingWidth: 24.w,
        minVerticalPadding: 8.h,
        iconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        leadingAndTrailingTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurfaceVariant,
        ),
        tileColor: Colors.transparent,
        selectedTileColor: colorScheme.primaryContainer.withValues(alpha: 0.3),
        selectedColor: colorScheme.primary,
        enableFeedback: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),

      // DataTable theme
      dataTableTheme: DataTableThemeData(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8.r),
        ),
        headingRowColor: MaterialStateProperty.resolveWith<Color>((states) {
          return colorScheme.primaryContainer.withValues(alpha: 0.3);
        }),
        dataRowColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primaryContainer.withValues(alpha: 0.2);
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.surfaceVariant.withValues(alpha: 0.5);
          }
          return Colors.transparent;
        }),
        dividerThickness: 1.w,
        columnSpacing: 16.w,
        horizontalMargin: 16.w,
        headingRowHeight: 48.h,
        dataRowHeight: 48.h,
        headingTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        dataTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
      ),

      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        modalElevation: 16,
        modalBackgroundColor: colorScheme.surface,
        modalBarrierColor: colorScheme.scrim.withValues(alpha: 0.5),
        shadowColor: colorScheme.shadow,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        dragHandleSize: Size(32.w, 4.h),
        dragHandleColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
        showDragHandle: true,
      ),

      // Expansion tile theme
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        expandedAlignment: Alignment.topLeft,
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        iconColor: colorScheme.onSurfaceVariant,
        collapsedIconColor: colorScheme.onSurfaceVariant,
        textColor: colorScheme.onSurface,
        collapsedTextColor: colorScheme.onSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),

      // Banner theme
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        padding: EdgeInsets.all(16.w),
        leadingPadding: EdgeInsets.only(right: 16.w),
      ),

      // CupertinoOverrideTheme
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: colorScheme.primary,
        textTheme: CupertinoTextThemeData(
          primaryColor: colorScheme.primary,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          actionTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
          tabLabelTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          navTitleTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          navLargeTitleTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
          pickerTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
          dateTimePickerTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
          ),
        ),
      ),

      textTheme: textTheme,
    );
  }

  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    seedColor: ColorConstants.primaryColor,
    background: ColorConstants.light.background,
    cardBackground: Colors.white,
    primaryText: ColorConstants.light.textPrimary,
    secondaryText: ColorConstants.light.textSecondary,
    accentColor: ColorConstants.primaryColor,
    divider: ColorConstants.lightGray,
    buttonBackground: ColorConstants.primaryColor,
    buttonText: Colors.white,
    disabled: ColorConstants.lightGray,
    error: Colors.red.shade700,
  );

  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    seedColor: ColorConstants.primaryColor,
    background: ColorConstants.dark.background,
    cardBackground: Color(0xFF1F1F1F),
    primaryText: ColorConstants.dark.textPrimary,
    secondaryText: ColorConstants.dark.textSecondary,
    accentColor: ColorConstants.primaryColor,
    divider: Colors.white12,
    buttonBackground: ColorConstants.primaryColor,
    buttonText: Colors.white,
    disabled: Colors.white38,
    error: Colors.redAccent.shade200,
  );
}
