import 'package:mmbutton/index.dart';

class OurButtons {
  /// Demo 1: Green increment-style button with hover effects
  static CustomButton demo1({
    required BuildContext context,
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: buttonTheme?.demo1Style,
    );
  }

  /// Demo 2: Red decrement-style button with hover effects
  static CustomButton demo2({
    required BuildContext context,
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: buttonTheme?.demo2Style,
    );
  }

  /// Demo 3: Orange reset-style button with border effects
  static CustomButton demo3({
    required BuildContext context,
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: buttonTheme?.demo3Style,
    );
  }

  /// Demo 4: Disabled button example
  static CustomButton demo4({
    required BuildContext context,
    required String text,
    bool isEnabled = false,
  }) {
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    return CustomButton(
      text: text,
      isEnabled: isEnabled,
      buttonStyle: buttonTheme?.demo4Style,
    );
  }

  /// Demo 5: Custom size purple button with extended animation
  static CustomButton demo5({
    required BuildContext context,
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: buttonTheme?.demo5Style,
    );
  }
}
