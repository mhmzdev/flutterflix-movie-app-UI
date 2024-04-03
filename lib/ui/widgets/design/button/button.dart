import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

part '_enums.dart';
part '_model.dart';
part '_data.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.icon,
    this.label,
    this.frontColor,
    this.labelStyle,
    this.iconToEnd = false,
    required this.onPressed,
    this.state = AppButtonState.plain,
    this.style = AppButtonStyle.primaryDark,
    this.radius = AppButtonRadius.medium,
    this.mainAxisSize = MainAxisSize.max,
    this.size = AppButtonSize.medium,
  });

  final String? label;
  final TextStyle? labelStyle;

  final IconData? icon;
  final bool iconToEnd;
  final Color? frontColor;

  final VoidCallback onPressed;
  final MainAxisSize mainAxisSize;

  final AppButtonStyle style;
  final AppButtonState state;
  final AppButtonRadius radius;
  final AppButtonSize size;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final data = _mapPropsToData()[style]!;
    final borderRadius = _mapRadiusData()[radius];
    final textStyle = _mapSizeToFontSize()[size]!;

    final color = data.backgroundColor[state]!;
    final textColor = frontColor ?? data.text[state]!;

    final plain = state == AppButtonState.plain;
    final disabled = state == AppButtonState.disabled;
    final bordered = state == AppButtonState.bordered;

    final iconSize = .55.un() * textStyle.fontSize!;

    List<BoxShadow> boxShadows = [];
    if (!plain && !disabled && !bordered) {
      boxShadows = [
        BoxShadow(
          color: color.withOpacity(0.5),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];
    }

    final smallButton = size == AppButtonSize.tiny ||
        size == AppButtonSize.mini ||
        size == AppButtonSize.small;
    final hPadding = smallButton ? Space.v.t20 : Space.v.t30;

    return TouchableOpacity(
      onTap: disabled ? null : onPressed,
      child: AnimatedContainer(
        padding: Space.h.t30 + hPadding,
        duration: AppProps.fast,
        decoration: BoxDecoration(
          border: Border.all(
            color: bordered ? textColor : color,
            width: 2,
          ),
          color: color,
          borderRadius: borderRadius,
          boxShadow: boxShadows,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            if (icon != null && !iconToEnd) ...[
              Icon(
                icon,
                size: iconSize,
                color: textColor,
              ),
              Space.x.t10,
            ],
            if (label != null)
              Text(
                label!,
                style: labelStyle ??
                    AppText.b2.copyWith(
                          fontSize: textStyle.fontSize!,
                        ) +
                        textColor,
              ),
            if (icon != null && iconToEnd) ...[
              Space.x.t10,
              Icon(
                icon,
                size: iconSize,
                color: textColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
