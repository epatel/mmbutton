import 'package:mmbutton/index.dart';

CustomButtonStyle get _defaultStyle => const CustomButtonStyle(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  hoverBackgroundColor: Colors.blueAccent,
  hoverForegroundColor: Colors.white,
  pressedBackgroundColor: Colors.blue,
  pressedForegroundColor: Colors.white,
  borderRadius: 8.0,
  elevation: 2.0,
  hoverElevation: 4.0,
  pressedElevation: 1.0,
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
);

CustomButtonStyle get _demo0Style => _defaultStyle.copyWith(
  borderRadius: 16.0,
  elevation: 4.0,
  hoverElevation: 8.0,
  pressedElevation: 2.0,
  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
);

CustomButtonStyle get _demo1Style => _demo0Style.copyWith(
  backgroundColor: Colors.green,
  foregroundColor: Colors.white,
  hoverBackgroundColor: Colors.greenAccent,
  hoverForegroundColor: Colors.black,
  pressedBackgroundColor: Colors.green,
  pressedForegroundColor: Colors.white,
);

CustomButtonStyle get _demo2Style => _demo0Style.copyWith(
  backgroundColor: Colors.red,
  foregroundColor: Colors.white,
  hoverBackgroundColor: Colors.redAccent,
  hoverForegroundColor: Colors.white,
  pressedBackgroundColor: Colors.red,
  pressedForegroundColor: Colors.white,
);

CustomButtonStyle get _demo3Style => _demo0Style.copyWith(
  backgroundColor: Colors.orange,
  foregroundColor: Colors.white,
  hoverBackgroundColor: Colors.orangeAccent,
  hoverForegroundColor: Colors.black,
  pressedBackgroundColor: Colors.orange,
  pressedForegroundColor: Colors.white,
);

CustomButtonStyle get _demo4Style => _demo0Style.copyWith(
  backgroundColor: Colors.grey,
  foregroundColor: Colors.white,
  disabledBackgroundColor: Colors.grey,
  disabledForegroundColor: Colors.white54,
);

CustomButtonStyle get _demo5Style => _demo0Style.copyWith(
  backgroundColor: Colors.purple,
  foregroundColor: Colors.white,
  hoverBackgroundColor: Colors.purpleAccent,
  hoverForegroundColor: Colors.white,
  borderRadius: 24.0,
  elevation: 6.0,
  hoverElevation: 12.0,
  pressedElevation: 2.0,
  width: 200,
  height: 60,
  animationDuration: Duration(milliseconds: 300),
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
);

// ------------------------------------------------------------

/// Extension methods on CustomButton providing pre-defined demo styles
extension OurButton on CustomButtonStyle {
  /// Demo 1: Green increment-style button with hover effects
  static CustomButton demo1({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: _demo1Style,
    );
  }

  /// Demo 2: Red decrement-style button with hover effects
  static CustomButton demo2({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: _demo2Style,
    );
  }

  /// Demo 3: Orange reset-style button with border effects
  static CustomButton demo3({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: _demo3Style,
    );
  }

  /// Demo 4: Disabled button example
  static CustomButton demo4({
    required String text,
    bool isEnabled = false,
  }) {
    return CustomButton(
      text: text,
      isEnabled: isEnabled,
      buttonStyle: _demo4Style,
    );
  }

  /// Demo 5: Custom size purple button with extended animation
  static CustomButton demo5({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: _demo5Style,
    );
  }
}
