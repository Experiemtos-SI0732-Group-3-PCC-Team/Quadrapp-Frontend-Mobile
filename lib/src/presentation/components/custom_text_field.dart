import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_typography.dart';

enum TextFieldVariant { outlined, filled }

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextFieldVariant variant;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;

  const CustomTextField({
    Key? key,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.validator,
    this.focusNode,
    this.variant = TextFieldVariant.filled,
    this.contentPadding,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppTypography.inputLabel),
          const SizedBox(height: AppDimensions.paddingS),
        ],
        Container(
          decoration: _getContainerDecoration(),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: _obscureText,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            autofocus: widget.autofocus,
            textCapitalization: widget.textCapitalization,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            style: AppTypography.inputText.copyWith(
              color: widget.enabled ? AppColors.darkText : AppColors.hintText,
            ),
            decoration: _getInputDecoration(),
          ),
        ),
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: AppDimensions.paddingXS),
          Text(
            widget.errorText ?? widget.helperText!,
            style: AppTypography.bodySmall.copyWith(
              color: widget.errorText != null
                  ? AppColors.error
                  : AppColors.hintText,
            ),
          ),
        ],
      ],
    );
  }

  BoxDecoration? _getContainerDecoration() {
    if (widget.variant == TextFieldVariant.outlined) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(
          color: _getBorderColor(),
          width: _isFocused
              ? AppDimensions.borderMedium
              : AppDimensions.borderThin,
        ),
      );
    }
    return null;
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: AppTypography.inputHint,
      prefixIcon: widget.prefixIcon,
      suffixIcon: _getSuffixIcon(),
      counterText: widget.maxLength != null ? '' : null,
      filled: widget.variant == TextFieldVariant.filled,
      fillColor: widget.variant == TextFieldVariant.filled
          ? AppColors.inputBackground
          : Colors.transparent,
      border: _getBorder(),
      enabledBorder: _getBorder(),
      focusedBorder: _getBorder(focused: true),
      errorBorder: _getBorder(error: true),
      focusedErrorBorder: _getBorder(focused: true, error: true),
      disabledBorder: _getBorder(disabled: true),
      contentPadding:
          widget.contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingM,
            vertical: AppDimensions.paddingM,
          ),
      errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.error),
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        onPressed: _toggleObscureText,
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.hintText,
        ),
      );
    }
    return widget.suffixIcon;
  }

  Color _getBorderColor() {
    if (widget.errorText != null) return AppColors.error;
    if (_isFocused) return AppColors.primaryPurple;
    if (!widget.enabled) return AppColors.hintText.withOpacity(0.5);
    return AppColors.borderColor;
  }

  InputBorder _getBorder({
    bool focused = false,
    bool error = false,
    bool disabled = false,
  }) {
    Color borderColor = AppColors.borderColor;
    double borderWidth = AppDimensions.borderThin;

    if (error) {
      borderColor = AppColors.error;
      borderWidth = focused
          ? AppDimensions.borderMedium
          : AppDimensions.borderThin;
    } else if (focused) {
      borderColor = AppColors.primaryPurple;
      borderWidth = AppDimensions.borderMedium;
    } else if (disabled) {
      borderColor = AppColors.hintText.withOpacity(0.5);
    }

    if (widget.variant == TextFieldVariant.outlined) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
  }
}
