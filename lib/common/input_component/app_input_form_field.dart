import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_base/config/app_config.dart';

class LineInputFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? description;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final bool? obscureText;
  final bool enabled;
  final Color? activeColor;
  final double? borderRadius;
  final double? borderWidth;

  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const LineInputFormField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.type,
    this.obscureText,
    this.inputFormatters,
    this.validator,
    this.suffix,
    this.prefix,
    this.description,
    this.enabled = true,
    this.activeColor,
    this.borderRadius,
    this.borderWidth,
  });

  @override
  State<LineInputFormField> createState() => _LineInputFormFieldState();
}

class _LineInputFormFieldState extends State<LineInputFormField> {
  String? errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: AppStyles.text16.preMed),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: widget.enabled,
                obscureText: widget.obscureText ?? false,
                obscuringCharacter: '●',
                keyboardType: widget.type,
                onChanged: widget.onChanged,
                inputFormatters: widget.inputFormatters,
                cursorColor: AppColors.primary02,
                style: AppStyles.text14.preReg,
                validator: widget.validator != null
                    ? (value) {
                        setState(() {
                          errorMessage = widget.validator!(value);
                        });
                        if (errorMessage != null) {
                          return '';
                        }
                        return null;
                      }
                    : null,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: widget.hint,
                  errorText: null,
                  errorStyle: const TextStyle(height: 0),
                  labelStyle: AppStyles.text14.preReg,
                  prefixIcon: widget.prefix,
                  hintStyle:
                      AppStyles.text14.preReg.copyWith(color: AppColors.hint),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.activeColor ?? AppColors.primary01,
                        width: widget.borderWidth ?? AppSize.borderWidth),
                    borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? AppSize.mediumRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.borderSelected,
                        width: widget.borderWidth ?? AppSize.borderWidth),
                    borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? AppSize.mediumRadius),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.borderError,
                        width: widget.borderWidth ?? AppSize.borderWidth),
                    borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? AppSize.mediumRadius),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.neutral04,
                        width: widget.borderWidth ?? AppSize.borderWidth),
                    borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? AppSize.mediumRadius),
                  ),
                  fillColor: !widget.enabled
                      ? AppColors.borderDefault
                      : AppColors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.5.h),
                  suffixIcon: widget.obscureText == null
                      ? const SizedBox()
                      : Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          child: widget.suffix,
                        ),
                ),
                controller: widget.controller,
              ),
            ),
            widget.obscureText != null
                ? const SizedBox()
                : widget.suffix != null
                    ? Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        child: widget.suffix,
                      )
                    : const SizedBox(),
          ],
        ),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Container(
            margin: EdgeInsets.only(
              top: AppSize.spaceBetweenWidgetSmall,
            ),
            child: Text(errorMessage ?? "",
                style:
                    AppStyles.text12.preReg.copyWith(color: AppColors.error)),
          ),
        if (widget.description != null && widget.description!.isNotEmpty)
          Container(
            margin: EdgeInsets.only(
              top: AppSize.spaceBetweenWidgetSmall,
            ),
            child: Text(
              widget.description ?? "",
              style:
                  AppStyles.text12.preReg.copyWith(color: AppColors.neutral05),
            ),
          ),
      ],
    );
  }
}

class ContentInputFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? suffixText;
  final TextInputType? type;
  final TextStyle? labelStyle;
  final bool enabled;
  final int maxLines;
  final int maxLength;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const ContentInputFormField(
      {super.key,
      this.label,
      this.labelStyle,
      this.hint,
      this.enabled = true,
      required this.controller,
      this.onChanged,
      this.type,
      this.inputFormatters,
      this.validator,
      required this.maxLength,
      required this.maxLines,
      this.suffixText});

  @override
  State<ContentInputFormField> createState() => _ContentInputFormFieldState();
}

class _ContentInputFormFieldState extends State<ContentInputFormField> {
  String? errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!,
              style: widget.labelStyle ?? AppStyles.text16.preMed),
        TextFormField(
          keyboardType: widget.type,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatters,
          cursorColor: AppColors.black,
          validator: widget.validator != null
              ? (value) {
                  setState(() {
                    errorMessage = widget.validator!(value);
                  });
                  if (errorMessage != null) {
                    return '';
                  }
                  return null;
                }
              : null,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
              filled: true,
              hintText: widget.hint,
              labelStyle: AppStyles.text16.preReg,
              hintStyle:
                  AppStyles.text15.preReg.copyWith(color: AppColors.hint),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.5.h),
              counterText:
                  "(${widget.controller.text.length}/${widget.maxLength}자)",
              suffixIcon: widget.suffixText == null
                  ? const SizedBox()
                  : Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      child: Text(
                        widget.suffixText ?? '',
                        style: AppStyles.text16,
                      ),
                    ),
              suffixIconColor: AppColors.primary01),
          controller: widget.controller,
        ),
      ],
    );
  }
}

class SearchInputFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? description;
  final Widget? suffix;
  final TextInputType? type;
  final bool obscureText;

  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const SearchInputFormField(
      {super.key,
      this.label,
      this.hint,
      this.controller,
      this.onChanged,
      this.type,
      this.obscureText = false,
      this.inputFormatters,
      this.validator,
      this.suffix,
      this.description});

  @override
  State<SearchInputFormField> createState() => _SearchInputFormFieldState();
}

class _SearchInputFormFieldState extends State<SearchInputFormField> {
  String? errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.label != null)
            SizedBox(
              width: 100,
              child: Text(widget.label!, style: AppStyles.text16),
            ),
          Expanded(
            child: TextFormField(
              obscureText: widget.obscureText,
              obscuringCharacter: '●',
              keyboardType: widget.type,
              onChanged: widget.onChanged,
              inputFormatters: widget.inputFormatters,
              cursorColor: AppColors.black,
              style: AppStyles.text16.copyWith(color: AppColors.black),
              validator: widget.validator != null
                  ? (value) {
                      setState(() {
                        errorMessage = widget.validator!(value);
                      });
                      if (errorMessage != null) {
                        return '';
                      }
                      return null;
                    }
                  : null,
              decoration: InputDecoration(
                fillColor: AppColors.black.withOpacity(0.4),
                border: InputBorder.none,
                hintText: widget.hint,
                errorText: null,
                errorStyle: const TextStyle(height: 0),
                labelStyle: AppStyles.text16,
                hintStyle: AppStyles.text16.copyWith(color: AppColors.black),
              ),
              controller: widget.controller,
            ),
          ),
          if (errorMessage != null && errorMessage!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(
                top: AppSize.spaceBetweenWidgetSmall,
              ),
              child: Text(errorMessage ?? "",
                  style: AppStyles.text16.copyWith(color: AppColors.error)),
            ),
          if (widget.description != null && widget.description!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(
                top: AppSize.spaceBetweenWidgetSmall,
              ),
              child: Text(
                widget.description ?? "",
                style: AppStyles.text16.copyWith(color: AppColors.black),
              ),
            ),
        ],
      ),
    );
  }
}

class CurrencyFormatters extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
