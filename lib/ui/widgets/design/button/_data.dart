part of 'button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData() {
  return {
    AppButtonStyle.primary: _AppButtonModel(
      text: {
        AppButtonState.elevated: Colors.white,
        AppButtonState.plain: Colors.white,
        AppButtonState.bordered: AppTheme.c.primary,
        AppButtonState.disabled: AppTheme.c.lightGrey,
      },
      backgroundColor: {
        AppButtonState.bordered: Colors.transparent,
        AppButtonState.elevated: AppTheme.c.primary,
        AppButtonState.plain: AppTheme.c.primary,
        AppButtonState.disabled: AppTheme.c.grey,
      },
    ),
    AppButtonStyle.primaryDark: _AppButtonModel(
      text: {
        AppButtonState.elevated: Colors.white,
        AppButtonState.plain: Colors.white,
        AppButtonState.bordered: AppTheme.c.primaryDark,
        AppButtonState.disabled: AppTheme.c.lightGrey,
      },
      backgroundColor: {
        AppButtonState.bordered: Colors.transparent,
        AppButtonState.elevated: AppTheme.c.primaryDark,
        AppButtonState.plain: AppTheme.c.primaryDark,
        AppButtonState.disabled: AppTheme.c.grey,
      },
    ),
    AppButtonStyle.danger: _AppButtonModel(
      text: {
        AppButtonState.elevated: Colors.white,
        AppButtonState.plain: Colors.white,
        AppButtonState.bordered: AppTheme.c.error,
        AppButtonState.disabled: AppTheme.c.grey,
      },
      backgroundColor: {
        AppButtonState.elevated: AppTheme.c.error,
        AppButtonState.plain: AppTheme.c.error,
        AppButtonState.bordered: Colors.transparent,
        AppButtonState.disabled: AppTheme.c.lightGrey,
      },
    ),
    AppButtonStyle.grey: _AppButtonModel(
      text: {
        AppButtonState.elevated: Colors.white,
        AppButtonState.plain: Colors.white,
        AppButtonState.bordered: AppTheme.c.grey,
        AppButtonState.disabled: AppTheme.c.grey,
      },
      backgroundColor: {
        AppButtonState.bordered: Colors.transparent,
        AppButtonState.elevated: AppTheme.c.grey,
        AppButtonState.plain: AppTheme.c.grey,
        AppButtonState.disabled: AppTheme.c.lightGrey,
      },
    ),
  };
}

Map<AppButtonRadius, BorderRadius> _mapRadiusData() {
  return {
    AppButtonRadius.less: 10.radius(),
    AppButtonRadius.medium: 15.radius(),
    AppButtonRadius.round: 20.radius(),
    AppButtonRadius.capsule: 30.radius(),
  };
}

Map<AppButtonSize, TextStyle> _mapSizeToFontSize() {
  return {
    AppButtonSize.large: AppText.b1.removeHeight(),
    AppButtonSize.medium: AppText.b2.removeHeight(),
    AppButtonSize.small: AppText.b3.removeHeight(),
    AppButtonSize.mini: AppText.s1.removeHeight(),
    AppButtonSize.tiny: AppText.s2.removeHeight(),
  };
}
