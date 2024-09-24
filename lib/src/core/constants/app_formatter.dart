import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AppFormatter extends TextInputFormatter {
  TextEditingValue englishName(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }

  static phoneFormatter() {
    String mask = 'HS# ### ####';
    return MaskTextInputFormatter(
      mask: mask,
      filter: {
        'H': RegExp(r'^[0]'),
        'S': RegExp(r'^[1-9]\d*'),
        '#': RegExp(r'^[0-9]\d*'),
      },
    );
  }

  static toUpperCaseFormatter(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }

  static formatTimeOfDayManual(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  // static khmerCurrencyFormatter(double value) {
  //   final formatCurrency = NumberFormat.currency(
  //     locale: 'km_KH', // Khmer locale
  //     symbol: '៛', // Riel symbol
  //     decimalDigits: 0, // No decimal digits
  //   );
  //   return formatCurrency.format(value);
  // }
}
