import 'package:mmbutton/index.dart';

/// Custom button style class that defines all visual properties for different states
class CustomButtonStyle {
  const CustomButtonStyle({
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.hoverBackgroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.disabledBackgroundColor = Colors.grey,
    this.disabledForegroundColor = Colors.white54,
    this.borderColor,
    this.hoverBorderColor,
    this.pressedBorderColor,
    this.disabledBorderColor,
    this.borderWidth = 0.0,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
    this.hoverElevation,
    this.pressedElevation,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.textStyle,
    this.width,
    this.height = 48.0,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  // Colors
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? hoverBackgroundColor;
  final Color? hoverForegroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;

  // Border
  final Color? borderColor;
  final Color? hoverBorderColor;
  final Color? pressedBorderColor;
  final Color? disabledBorderColor;
  final double borderWidth;
  final double borderRadius;

  // Elevation
  final double elevation;
  final double? hoverElevation;
  final double? pressedElevation;

  // Layout
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final double? width;
  final double height;

  // Animation
  final Duration animationDuration;

  // Helper methods to get effective colors for each state
  Color getEffectiveBackgroundColor(ButtonState state) {
    switch (state) {
      case ButtonState.pressed:
        return pressedBackgroundColor ??
            hoverBackgroundColor ??
            backgroundColor;
      case ButtonState.hover:
        return hoverBackgroundColor ?? backgroundColor;
      case ButtonState.disabled:
        return disabledBackgroundColor;
      case ButtonState.normal:
        return backgroundColor;
    }
  }

  Color getEffectiveForegroundColor(ButtonState state) {
    switch (state) {
      case ButtonState.pressed:
        return pressedForegroundColor ??
            hoverForegroundColor ??
            foregroundColor;
      case ButtonState.hover:
        return hoverForegroundColor ?? foregroundColor;
      case ButtonState.disabled:
        return disabledForegroundColor;
      case ButtonState.normal:
        return foregroundColor;
    }
  }

  Color? getEffectiveBorderColor(ButtonState state) {
    switch (state) {
      case ButtonState.pressed:
        return pressedBorderColor ?? hoverBorderColor ?? borderColor;
      case ButtonState.hover:
        return hoverBorderColor ?? borderColor;
      case ButtonState.disabled:
        return disabledBorderColor ?? borderColor;
      case ButtonState.normal:
        return borderColor;
    }
  }

  double getEffectiveElevation(ButtonState state) {
    switch (state) {
      case ButtonState.pressed:
        return pressedElevation ?? hoverElevation ?? elevation;
      case ButtonState.hover:
        return hoverElevation ?? elevation;
      case ButtonState.disabled:
      case ButtonState.normal:
        return elevation;
    }
  }

  CustomButtonStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? hoverBackgroundColor,
    Color? hoverForegroundColor,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? borderColor,
    Color? hoverBorderColor,
    Color? pressedBorderColor,
    Color? disabledBorderColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    double? hoverElevation,
    double? pressedElevation,
    EdgeInsets? padding,
    TextStyle? textStyle,
    double? width,
    double? height,
    Duration? animationDuration,
  }) {
    return CustomButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      borderColor: borderColor ?? this.borderColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      pressedBorderColor: pressedBorderColor ?? this.pressedBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      hoverElevation: hoverElevation ?? this.hoverElevation,
      pressedElevation: pressedElevation ?? this.pressedElevation,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      width: width ?? this.width,
      height: height ?? this.height,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}

/// Enum for button states
enum ButtonState { normal, hover, pressed, disabled }
