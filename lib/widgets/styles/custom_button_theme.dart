import 'package:mmbutton/index.dart';

class CustomButtonTheme extends ThemeExtension<CustomButtonTheme> {
  final CustomButtonStyle? defaultStyle;
  final CustomButtonStyle? demo1Style;
  final CustomButtonStyle? demo2Style;
  final CustomButtonStyle? demo3Style;
  final CustomButtonStyle? demo4Style;
  final CustomButtonStyle? demo5Style;

  const CustomButtonTheme({
    this.defaultStyle,
    this.demo1Style,
    this.demo2Style,
    this.demo3Style,
    this.demo4Style,
    this.demo5Style,
  });

  @override
  ThemeExtension<CustomButtonTheme> copyWith({
    CustomButtonStyle? defaultStyle,
    CustomButtonStyle? demo1Style,
    CustomButtonStyle? demo2Style,
    CustomButtonStyle? demo3Style,
    CustomButtonStyle? demo4Style,
    CustomButtonStyle? demo5Style,
  }) {
    return CustomButtonTheme(
      defaultStyle: defaultStyle ?? this.defaultStyle,
      demo1Style: demo1Style ?? this.demo1Style,
      demo2Style: demo2Style ?? this.demo2Style,
      demo3Style: demo3Style ?? this.demo3Style,
      demo4Style: demo4Style ?? this.demo4Style,
      demo5Style: demo5Style ?? this.demo5Style,
    );
  }

  @override
  ThemeExtension<CustomButtonTheme> lerp(
    ThemeExtension<CustomButtonTheme>? other,
    double t,
  ) {
    if (other is! CustomButtonTheme) {
      return this;
    }
    return CustomButtonTheme(
      defaultStyle: t < 0.5 ? defaultStyle : other.defaultStyle,
      demo1Style: t < 0.5 ? demo1Style : other.demo1Style,
      demo2Style: t < 0.5 ? demo2Style : other.demo2Style,
      demo3Style: t < 0.5 ? demo3Style : other.demo3Style,
      demo4Style: t < 0.5 ? demo4Style : other.demo4Style,
      demo5Style: t < 0.5 ? demo5Style : other.demo5Style,
    );
  }
}
