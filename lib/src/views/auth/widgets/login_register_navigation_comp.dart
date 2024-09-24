import 'package:flutter/material.dart';
import 'package:hrms_app/src/core/utils/space_exs.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';

class LoginRegisterNav extends StatelessWidget {
  const LoginRegisterNav({
    super.key,
    this.labelText,
    this.labelButton,
    this.onTap,
  });

  final String? labelText;
  final String? labelButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText ?? 'label',
          style: AppFonts.regular(fontSize: 16, color: theme.onSurface),
        ),
        8.w,
        GestureDetector(
          onTap: onTap,
          child: Text(
            labelButton ?? 'label',
            style: AppFonts.regular(fontSize: 16, color: theme.error),
          ),
        ),
      ],
    );
  }
}
