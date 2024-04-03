import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterflix/configs/configs.dart';

class AppInputField extends StatefulWidget {
  final String name;
  final String? hint;
  final TextStyle? hintStyle;
  final String? label;

  final FocusNode? node;
  final TextEditingController? controller;

  final bool passwordField;
  final bool autofocus;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;

  final Color? labelColor;
  final Color? textColor;
  final Color? filledColor;

  final bool readOnly;
  final bool? enabled;

  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  final String? errorText;
  final TextStyle? errorStyle;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  final List<String>? autofillHints;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? constraints;

  final TextAlign? textAlign;
  final VoidCallback? onTap;

  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final String? Function(String?)? validator;

  const AppInputField({
    super.key,
    required this.name,
    this.node,
    this.hint,
    this.label,
    this.enabled,
    this.autofocus = false,
    this.validator,
    this.onChanged,
    this.textColor,
    this.labelColor,
    this.suffixIcon,
    this.errorText,
    this.prefixIcon,
    this.initialValue,
    this.textInputType,
    this.passwordField = false,
    this.inputFormatters,
    this.readOnly = false,
    this.autofillHints,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.constraints,
    this.hintStyle,
    this.filledColor,
    this.onSubmitted,
    this.textAlign,
    this.onTap,
    this.controller,
    this.errorStyle,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  AppInputFieldState createState() => AppInputFieldState();
}

class AppInputFieldState extends State<AppInputField> {
  late TextEditingController _controller;
  bool showPass = true;

  void _showPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    final form = FormBuilder.of(context);
    if (form == null) return;

    final initialValues = form.initialValue;
    final initialValue = initialValues[widget.name] ?? widget.initialValue;
    if (initialValue != null) {
      _controller.text = initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppText.b3 + (widget.labelColor ?? AppTheme.c.primary),
          ),
          Space.y.t10,
        ],
        FormBuilderTextField(
          name: widget.name,
          onTap: widget.onTap,
          controller: _controller,
          focusNode: widget.node,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          cursorColor: AppTheme.c.primary,
          enabled: widget.enabled ?? true,
          initialValue: widget.initialValue,
          keyboardType: widget.textInputType,
          autofillHints: widget.autofillHints,
          style: AppText.b2 + widget.textColor,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign ?? TextAlign.start,
          obscureText: widget.passwordField ? showPass : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            constraints: widget.constraints,
            errorStyle: widget.errorStyle ?? AppText.s1 + AppTheme.c.error,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            suffixIconConstraints: widget.suffixIconConstraints,
            suffixIcon: widget.suffixIcon ??
                (widget.passwordField
                    ? IconButton(
                        onPressed: _showPass,
                        icon: !showPass
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      )
                    : null),
            filled: true,
            fillColor: widget.filledColor,
            hintText: widget.hint,
            hintStyle: widget.hintStyle ??
                AppText.b2.copyWith(
                  color: AppTheme.c.grey,
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: 10.radius(),
              borderSide: const BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: 10.radius(),
              borderSide: BorderSide(
                color: AppTheme.c.primary,
                width: .5.un(),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: 10.radius(),
              borderSide: BorderSide(
                color: AppTheme.c.error,
                width: .5.un(),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: 10.radius(),
              borderSide: BorderSide(
                color: AppTheme.c.error,
                width: .5.un(),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: 10.radius(),
              borderSide: BorderSide(
                width: .5.un(),
                color: Colors.transparent,
              ),
            ),
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onReset: () {
            if (!context.mounted) return;
            _controller.clear();
          },
        ),
      ],
    );
  }
}
