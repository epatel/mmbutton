import 'package:mmbutton/index.dart';

class OurStyles {
  static CustomButtonStyle get _defaultStyle => const CustomButtonStyle(
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

  static CustomButtonStyle get _demo0Style => _defaultStyle.copyWith(
    borderRadius: 16.0,
    elevation: 4.0,
    hoverElevation: 8.0,
    pressedElevation: 2.0,
    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  static CustomButtonStyle get demo1 => _demo0Style.copyWith(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    hoverBackgroundColor: Colors.greenAccent,
    hoverForegroundColor: Colors.black,
    pressedBackgroundColor: Colors.green,
    pressedForegroundColor: Colors.white,
  );

  static CustomButtonStyle get demo2 => _demo0Style.copyWith(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    hoverBackgroundColor: Colors.redAccent,
    hoverForegroundColor: Colors.white,
    pressedBackgroundColor: Colors.red,
    pressedForegroundColor: Colors.white,
  );

  static CustomButtonStyle get demo3 => demo2.copyWith(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    hoverBackgroundColor: Colors.orangeAccent,
    hoverForegroundColor: Colors.black,
    pressedBackgroundColor: Colors.orange,
    pressedForegroundColor: Colors.white,
  );

  static CustomButtonStyle get demo4 => _demo0Style.copyWith(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.white54,
  );

  static CustomButtonStyle get demo5 => _demo0Style.copyWith(
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

  static CustomButtonTheme get buttonTheme => CustomButtonTheme(
    defaultStyle: _defaultStyle,
    demo1Style: demo1,
    demo2Style: demo2,
    demo3Style: demo3,
    demo4Style: demo4,
    demo5Style: demo5,
  );
}
