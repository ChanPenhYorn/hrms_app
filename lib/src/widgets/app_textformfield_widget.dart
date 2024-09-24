import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms_app/src/core/constants/enum/textformfield_enum.dart';
import 'package:hrms_app/src/core/constants/app_formatter.dart';
import 'package:hrms_app/src/core/constants/regex/sps_regex.dart';
import 'package:hrms_app/src/core/utils/colors.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.prefixIcon,
      this.backgroundColor,
      this.suffixIcon,
      this.labelText,
      this.obsecuretext,
      this.onShowPassword,
      this.rule,
      this.inputFormatters,
      this.autovalidateMode,
      this.isAllowNull = false,
      this.validator,
      this.controller,
      this.enabled = true,
      this.border = true,
      this.textColor,
      this.isPreficIcon = true,
      this.isTextCenter = false,
      this.onChanged,
      this.onTap});

  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final String? labelText;
  final bool? obsecuretext;
  final Function(bool)? onShowPassword;
  final TextFieldEnum? rule;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final bool isAllowNull;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enabled;
  final bool? border;
  final Color? textColor;
  final bool? isPreficIcon;
  final bool? isTextCenter;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    List<TextInputFormatter> selectedFormatter = [];
    switch (rule) {
      case TextFieldEnum.phone:
        selectedFormatter.add(AppFormatter.phoneFormatter());
        break;
      case TextFieldEnum.plate:
        // selectedFormatter.add(UpperCaseTextFormatter());
        selectedFormatter.add(FilteringTextInputFormatter.allow(
            SPSRegexExpression().searchPlateRegExp));
        break;
      // case TextFieldEnum.weight:
      //   selectedFormatter.add(SPSFormatter.WeightFormatter());

      // case TextFieldEnum.englishName:
      //   selectedFormatter.add(UpperCaseTextFormatter());

      // case STMTextFormFieldRuleEnum.khmerName:
      //   selectedFormatter.add(FilteringTextInputFormatter.allow(
      //       STMRegexExpression().khmerNameRegExp));
      default:
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: TextFormField(
        onChanged: onChanged,
        textAlign: isTextCenter == true ? TextAlign.center : TextAlign.left,
        enabled: enabled,
        controller: controller,
        validator: validation,
        autovalidateMode: autovalidateMode,
        inputFormatters: inputFormatters ?? selectedFormatter,
        obscureText: obsecuretext ?? false,
        cursorColor: AppColors.primaryColor,
        style: AppFonts.regular(fontSize: 16, color: textColor ?? Colors.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          border: border == false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.blackColor,
                      strokeAlign: BorderSide.strokeAlignInside)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.redColor,
                  strokeAlign: BorderSide.strokeAlignInside)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primaryColor,
                  strokeAlign: BorderSide.strokeAlignInside)),
          disabledBorder: border == false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.blackColor,
                      strokeAlign: BorderSide.strokeAlignInside)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2,
                  color: Colors.grey,
                  strokeAlign: BorderSide.strokeAlignInside)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primaryColor,
                  strokeAlign: BorderSide.strokeAlignInside)),
          // label: const Text('Email'),
          labelStyle: AppFonts.regular(
            fontSize: 16,
          ),
          // errorText: "hintField.pleaseEnterCorrectly",
          errorStyle: AppFonts.regular(fontSize: 14, color: Colors.red),
          hintText: labelText ?? "label",
          hintStyle:
              AppFonts.regular(fontSize: 16, color: Colors.grey.shade400),
          suffixIcon: TextFieldEnum.password == rule
              ? IconButton(
                  onPressed: () {
                    if (onShowPassword != null) {
                      if (obsecuretext == true) {
                        onShowPassword!(false);
                      }
                      if (obsecuretext == false) {
                        onShowPassword!(true);
                      }
                    }
                  },
                  icon: Icon(
                    obsecuretext == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: theme.onSurface,
                  ))
              : suffixIcon,
          prefixIcon: isPreficIcon == true
              ? InkWell(
                  onTap: onTap,
                  child: prefixIcon ??
                      Icon(
                        Icons.person,
                        color: theme.surface,
                      ),
                )
              : null,
        ),
        keyboardType: TextInputType.emailAddress,

        // Add other necessary properties and behaviors as needed
      ),
    );
  }

  String? validation(String? value) {
    if (isAllowNull == true && (value == null || value.isEmpty)) {
      // Allow null values if isAllowNull is true
      return null;
    } else if (value == null || value.isEmpty) {
      // Return validation message if value is null or empty
      return "Please enter correctly";
    } else {
      // Perform further validation checks if necessary
      return checkValidate(value);
    }
  }

  String? checkValidate(value) {
    SPSRegexExpression regRex = SPSRegexExpression();
    switch (rule) {
      case TextFieldEnum.phone:
        if (regRex.phoneRegexp.hasMatch(value)) {
          return null;
        }
        return "Please enter correctly";

      case TextFieldEnum.email:
        if (regRex.emailRegexp.hasMatch(value)) {
          return null;
        }
        return "Please enter correctly";

      case TextFieldEnum.plate:
        if (regRex.searchPlateRegExp.hasMatch(value)) {
          return null;
        }
        return "Please enter correctly";

      default:
        return null;
    }
  }
}
