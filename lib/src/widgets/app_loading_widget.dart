import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hrms_app/src/core/utils/colors.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      duration: Duration(milliseconds: 1200),
      color: AppColors.primaryColor,
      size: 58.0,
    );
  }
}
