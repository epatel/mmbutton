import 'package:mmbutton/index.dart';

/// Custom button widget built from scratch
class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.isEnabled = true,
    super.key,
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
    final style = widget.buttonStyle ?? const CustomButtonStyle();
    _animationController = AnimationController(
      duration: style.animationDuration,
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
    final buttonTheme = Theme.of(context).extension<CustomButtonTheme>();
    final style =
        widget.buttonStyle ??
        buttonTheme?.defaultStyle ??
        const CustomButtonStyle();
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
