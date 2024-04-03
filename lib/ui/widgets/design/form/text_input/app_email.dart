import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/helper/validators.dart';
import 'package:flutterflix/ui/widgets/design/form/text_input/app_input.dart';
import 'package:iconsax/iconsax.dart';

class AppInputEmail extends StatelessWidget {
  final String name;
  final bool hasIcon;
  final String? label;
  final bool readyOnly;
  const AppInputEmail({
    super.key,
    this.label,
    required this.name,
    this.hasIcon = true,
    this.readyOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return AppInputField(
      name: name,
      label: label,
      validator: Validator.email(),
      prefixIcon: hasIcon ? const Icon(Iconsax.sms) : null,
      textInputType: TextInputType.emailAddress,
      hint: 'someone@example.com',
      readOnly: readyOnly,
    );
  }
}
