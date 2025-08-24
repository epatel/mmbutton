// https://dartpad.dev/0e397e1d3d2686860efcf608d762512e
// Primary Button: https://gist.github.com/epatel/0e397e1d3d2686860efcf608d762512e#file-main-dart-L462-L472

import 'package:flutter/material.dart';

// Custom button style class that defines all visual properties for different states
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

  final Color backgroundColor;
  final Color foregroundColor;
  final Color? hoverBackgroundColor;
  final Color? hoverForegroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final Color? borderColor;
  final Color? hoverBorderColor;
  final Color? pressedBorderColor;
  final Color? disabledBorderColor;
  final double borderWidth;
  final double borderRadius;
  final double elevation;
  final double? hoverElevation;
  final double? pressedElevation;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final double? width;
  final double height;
  final Duration animationDuration;

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
}

enum ButtonState { normal, hover, pressed, disabled }

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.isEnabled = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final CustomButtonStyle? buttonStyle;
  final bool isEnabled;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  ButtonState _currentState = ButtonState.normal;
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration:
          widget.buttonStyle?.animationDuration ??
          const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateState() {
    if (!widget.isEnabled) {
      _currentState = ButtonState.disabled;
    } else if (_isPressed) {
      _currentState = ButtonState.pressed;
      _animationController.forward();
    } else if (_isHovering) {
      _currentState = ButtonState.hover;
      _animationController.reverse();
    } else {
      _currentState = ButtonState.normal;
      _animationController.reverse();
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isEnabled) return;
    setState(() {
      _isPressed = true;
      _updateState();
    });
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.isEnabled) return;
    setState(() {
      _isPressed = false;
      _updateState();
    });
  }

  void _handleTapCancel() {
    if (!widget.isEnabled) return;
    setState(() {
      _isPressed = false;
      _updateState();
    });
  }

  void _handleHoverEnter() {
    if (!widget.isEnabled) return;
    setState(() {
      _isHovering = true;
      _updateState();
    });
  }

  void _handleHoverExit() {
    if (!widget.isEnabled) return;
    setState(() {
      _isHovering = false;
      _updateState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.buttonStyle ?? const CustomButtonStyle();
    final effectiveOnPressed = widget.isEnabled ? widget.onPressed : null;

    return MouseRegion(
      onEnter: (_) => _handleHoverEnter(),
      onExit: (_) => _handleHoverExit(),
      cursor: widget.isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: effectiveOnPressed,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: style.width,
                height: style.height,
                padding: style.padding,
                decoration: BoxDecoration(
                  color: style.getEffectiveBackgroundColor(_currentState),
                  borderRadius: BorderRadius.circular(style.borderRadius),
                  border: style.borderWidth > 0
                      ? Border.all(
                          color:
                              style.getEffectiveBorderColor(_currentState) ??
                              Colors.transparent,
                          width: style.borderWidth,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: style.getEffectiveElevation(_currentState),
                      offset: Offset(
                        0,
                        style.getEffectiveElevation(_currentState) * 0.5,
                      ),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style:
                        (style.textStyle ??
                                Theme.of(context).textTheme.bodyLarge)
                            ?.copyWith(
                              color: style.getEffectiveForegroundColor(
                                _currentState,
                              ),
                            ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Demo extension methods for pre-defined button styles
extension DemoButtonStyles on CustomButton {
  static CustomButton primary({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: const CustomButtonStyle(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        hoverBackgroundColor: Colors.blueAccent,
        hoverForegroundColor: Colors.white,
        borderRadius: 8.0,
        elevation: 2.0,
        hoverElevation: 4.0,
        pressedElevation: 1.0,
      ),
    );
  }

  static CustomButton success({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: const CustomButtonStyle(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        hoverBackgroundColor: Colors.greenAccent,
        hoverForegroundColor: Colors.black,
        borderRadius: 8.0,
        elevation: 2.0,
        hoverElevation: 4.0,
        pressedElevation: 1.0,
      ),
    );
  }

  static CustomButton warning({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: const CustomButtonStyle(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        hoverBackgroundColor: Colors.orangeAccent,
        hoverForegroundColor: Colors.black,
        borderRadius: 8.0,
        elevation: 2.0,
        hoverElevation: 4.0,
        pressedElevation: 1.0,
      ),
    );
  }

  static CustomButton danger({
    required String text,
    required VoidCallback? onPressed,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: const CustomButtonStyle(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        hoverBackgroundColor: Colors.redAccent,
        hoverForegroundColor: Colors.white,
        borderRadius: 8.0,
        elevation: 2.0,
        hoverElevation: 4.0,
        pressedElevation: 1.0,
      ),
    );
  }

  static CustomButton custom({
    required String text,
    required VoidCallback? onPressed,
    required CustomButtonStyle buttonStyle,
    bool isEnabled = true,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      isEnabled: isEnabled,
      buttonStyle: buttonStyle,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomButton Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomButton Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),

            // Pre-defined style buttons
            const Text(
              'Pre-defined Styles:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DemoButtonStyles.primary(
                  text: 'Primary',
                  onPressed: _incrementCounter,
                ),
                const SizedBox(width: 16),
                DemoButtonStyles.success(
                  text: 'Success',
                  onPressed: _incrementCounter,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DemoButtonStyles.warning(
                  text: 'Warning',
                  onPressed: _incrementCounter,
                ),
                const SizedBox(width: 16),
                DemoButtonStyles.danger(
                  text: 'Danger',
                  onPressed: _resetCounter,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Custom styled buttons
            const Text(
              'Custom Styled Buttons:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Custom button with purple theme and border
            DemoButtonStyles.custom(
              text: 'Custom Purple',
              onPressed: _incrementCounter,
              buttonStyle: const CustomButtonStyle(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                hoverBackgroundColor: Colors.purpleAccent,
                hoverForegroundColor: Colors.white,
                borderColor: Colors.purpleAccent,
                borderWidth: 2.0,
                borderRadius: 12.0,
                elevation: 4.0,
                hoverElevation: 8.0,
                pressedElevation: 2.0,
                width: 160,
                height: 50,
              ),
            ),

            const SizedBox(height: 16),

            // Custom button with gradient effect (simulated with hover states)
            DemoButtonStyles.custom(
              text: 'Teal Button',
              onPressed: _incrementCounter,
              buttonStyle: const CustomButtonStyle(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                hoverBackgroundColor: Colors.tealAccent,
                hoverForegroundColor: Colors.black87,
                pressedBackgroundColor: Colors.teal,
                pressedForegroundColor: Colors.white,
                borderRadius: 20.0,
                elevation: 3.0,
                hoverElevation: 6.0,
                pressedElevation: 1.0,
                width: 140,
                height: 45,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Disabled button example
            const CustomButton(
              text: 'Disabled',
              isEnabled: false,
              buttonStyle: CustomButtonStyle(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey,
                disabledForegroundColor: Colors.white54,
                borderRadius: 8.0,
                elevation: 0.0,
              ),
            ),

            const SizedBox(height: 32),

            // Manual CustomButtonStyle usage example
            const Text(
              'Manual Style Creation:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            CustomButton(
              text: 'Styled Manually',
              onPressed: _incrementCounter,
              buttonStyle: const CustomButtonStyle(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                hoverBackgroundColor: Colors.indigoAccent,
                hoverForegroundColor: Colors.white,
                pressedBackgroundColor: Colors.indigo,
                pressedForegroundColor: Colors.white,
                borderRadius: 16.0,
                elevation: 5.0,
                hoverElevation: 10.0,
                pressedElevation: 2.0,
                borderColor: Colors.indigoAccent,
                borderWidth: 1.0,
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
