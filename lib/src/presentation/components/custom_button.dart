import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

enum ButtonVariant { primary, secondary, outlined, text, gradient }

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !isLoading;

    return Container(width: width, child: _buildButton(context, isEnabled));
  }

  Widget _buildButton(BuildContext context, bool isEnabled) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimaryButton(context, isEnabled);
      case ButtonVariant.secondary:
        return _buildSecondaryButton(context, isEnabled);
      case ButtonVariant.outlined:
        return _buildOutlinedButton(context, isEnabled);
      case ButtonVariant.text:
        return _buildTextButton(context, isEnabled);
      case ButtonVariant.gradient:
        return _buildGradientButton(context, isEnabled);
    }
  }

  Widget _buildPrimaryButton(BuildContext context, bool isEnabled) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.primaryText,
        disabledBackgroundColor: AppColors.hintText,
        disabledForegroundColor: AppColors.primaryText.withOpacity(0.6),
        elevation: isEnabled ? AppDimensions.elevationM : 0,
        minimumSize: Size(_getMinWidth(), _getHeight()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        padding: padding ?? _getPadding(),
        textStyle: _getTextStyle(),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, bool isEnabled) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryPurple,
        foregroundColor: AppColors.primaryText,
        disabledBackgroundColor: AppColors.hintText,
        disabledForegroundColor: AppColors.primaryText.withOpacity(0.6),
        elevation: isEnabled ? AppDimensions.elevationS : 0,
        minimumSize: Size(_getMinWidth(), _getHeight()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        padding: padding ?? _getPadding(),
        textStyle: _getTextStyle(),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, bool isEnabled) {
    return OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        disabledForegroundColor: AppColors.hintText,
        side: BorderSide(
          color: isEnabled ? AppColors.primaryPurple : AppColors.hintText,
          width: AppDimensions.borderMedium,
        ),
        minimumSize: Size(_getMinWidth(), _getHeight()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        padding: padding ?? _getPadding(),
        textStyle: _getTextStyle().copyWith(color: AppColors.primaryPurple),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildTextButton(BuildContext context, bool isEnabled) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        disabledForegroundColor: AppColors.hintText,
        minimumSize: Size(_getMinWidth(), _getHeight()),
        padding: padding ?? _getPadding(),
        textStyle: _getTextStyle().copyWith(color: AppColors.primaryPurple),
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildGradientButton(BuildContext context, bool isEnabled) {
    return Container(
      height: _getHeight(),
      decoration: BoxDecoration(
        gradient: isEnabled ? AppColors.primaryGradient : null,
        color: !isEnabled ? AppColors.hintText : null,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(0.3),
                  blurRadius: AppDimensions.elevationM,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          child: Container(
            padding: padding ?? _getPadding(),
            child: Center(child: _buildButtonContent()),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryText),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          const SizedBox(width: AppDimensions.paddingS),
        ],
        Text(text),
        if (suffixIcon != null) ...[
          const SizedBox(width: AppDimensions.paddingS),
          suffixIcon!,
        ],
      ],
    );
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.buttonHeightS;
      case ButtonSize.medium:
        return AppDimensions.buttonHeightM;
      case ButtonSize.large:
        return AppDimensions.buttonHeightL;
    }
  }

  double _getMinWidth() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.buttonMinWidth * 0.8;
      case ButtonSize.medium:
        return AppDimensions.buttonMinWidth;
      case ButtonSize.large:
        return AppDimensions.buttonMinWidth * 1.2;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingS,
        );
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
          vertical: AppDimensions.paddingM,
        );
      case ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingXL,
          vertical: AppDimensions.paddingM,
        );
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case ButtonSize.small:
        return AppTypography.buttonMedium;
      case ButtonSize.medium:
        return AppTypography.buttonLarge;
      case ButtonSize.large:
        return AppTypography.buttonLarge.copyWith(fontSize: 18);
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.iconS;
      case ButtonSize.medium:
        return AppDimensions.iconM;
      case ButtonSize.large:
        return AppDimensions.iconL;
    }
  }
}
