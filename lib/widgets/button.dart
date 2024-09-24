import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 58.0, // Set a default height
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.isLoading = false, // Add loading support
    this.borderRadius = 10.0, // Set default border radius
    this.tooltip, // Accessibility improvement
  });

  final String label;
  final IconData? icon;
  final Function()? onPressed;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool isLoading;
  final double borderRadius;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      //! Tooltip for accessibility and better UX
      child: Tooltip(
        message: tooltip ?? label,
        child: ElevatedButton(
          //! Disable button during loading or if onPressed is null
          onPressed: isLoading || onPressed == null ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
            elevation: isLoading ? 0 : 2, // Remove elevation during loading
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, color: textColor ?? Colors.white, size: 24),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor ?? Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
