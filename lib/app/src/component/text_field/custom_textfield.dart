import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';
import 'package:hall_karo/app/src/utils/constant/icons.dart';
import 'package:hall_karo/app/src/utils/constant/text_styles.dart';


import '../text/custom_text.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final GlobalKey<FormFieldState<String>>? textFieldKey;
  final String? hintText;
  final String? header;
  final TextStyle? headerStyle;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? hintStyle, style;
  final int? maxLength;
  final bool? autoFocus;
  final double? borderRadius,suffixWidth;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final bool? isObscure;
  final bool? isEnable;

  final bool? hasSuffix;
  final bool? hasPrefix;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool showCounter;
  final String? error;
  final Function()? onEditingComplete, onTap;
  final ValueChanged<String>? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final bool onTapRemoveError;
  final bool isRequired;
  final bool isOptional;
  final Color? borderColor;
  final Color? bgColor;
  final Color? suffixIconColor;
  const CustomTextField({
    super.key,
    this.textFieldKey,
    required this.textEditingController,
    this.hintText,
    this.error,
    this.header,
    this.headerStyle,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.style,
    this.borderRadius,
    this.inputFormatters,
    this.padding,
    this.filledColor,
    this.hintStyle,
    this.borderColor,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.showCounter = false,
    this.isEnable = true,
    this.validator,
    this.onChanged,
    this.isObscure,
    this.readOnly = false,
    this.hasSuffix = false,
    this.hasPrefix = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onEditingComplete,
    this.onTapOutside,
    this.bgColor,
    this.isRequired = false,
    this.isOptional = false,
    this.onTapRemoveError = true,
    this.suffixIconColor,
    this.suffixWidth,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  onTapRemoveTextFieldError(
    TextEditingController controller,
    GlobalKey<FormFieldState<String>>? fieldKey,
  ) {
    hasError.value = false;
    String text = controller.text;
    fieldKey?.currentState?.reset();
    controller.value = controller.value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  final ValueNotifier<bool> hasError = ValueNotifier<bool>(false);
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure ?? false; // Initialize safely
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null) ...[
          Row(
            children: [
              CustomTextWidget(
                text: widget.header ?? "",
                style:
                    widget.headerStyle ??
                    AppTextStyles.black1C12w500.copyWith(
                      color: AppColors.kBlack.withValues(alpha: 0.5),
                    ),
              ),
              if (widget.isOptional) ...[
                CustomTextWidget(
                  text: " ${"optional".tr()}",
                  style:
                      widget.headerStyle?.copyWith(
                        color: AppColors.kGreyTextFieldHintColor,
                        fontWeight: FontWeight.normal,
                      ) ??
                      AppTextStyles.grey3cf14regular,
                ),
              ],
              if (widget.isRequired) ...[
                CustomTextWidget(
                  text: " *",
                  style:
                      widget.headerStyle?.copyWith(color: AppColors.kPrimary) ??
                      AppTextStyles.lightGreyIconColorColor14Bold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
        ],
        ValueListenableBuilder<bool>(
          valueListenable: hasError,
          builder: (context, hasErr, child) {
            return TextFormField(
              key: widget.textFieldKey,
              focusNode: widget.focusNode,

              onTap: () {
                if (widget.onTapRemoveError && !widget.readOnly) {
                  onTapRemoveTextFieldError(
                    widget.textEditingController,
                    widget.textFieldKey,
                  );
                }
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              cursorColor: AppColors.kdarkgrey28,
              onTapOutside:
                  widget.onTapOutside ??
                  (_) {
                    FocusScope.of(context).unfocus();
                  },
              autovalidateMode: AutovalidateMode.disabled,
              textInputAction: widget.textInputAction,
              textAlign: TextAlign.start,
              readOnly: widget.readOnly,
              onChanged: widget.onChanged,

              onEditingComplete: widget.onEditingComplete,
              controller: widget.textEditingController,
              obscureText: _isObscure,
              obscuringCharacter: '●',
              maxLines: _isObscure ? 1 : widget.maxLines,
              minLines: widget.minLines,
              autofocus: widget.autoFocus!,
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardType,
              enabled: widget.isEnable,
              inputFormatters: widget.inputFormatters,
              style:
                  widget.style ??
                  AppTextStyles.black1C16Regualr.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    widget.bgColor ??
                    (hasErr ? Colors.transparent : AppColors.kWhite),

                isDense: true,

                errorMaxLines: 2,
                contentPadding: widget.padding,

                enabledBorder: widget.readOnly
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.kWhite,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 8,
                        ),
                      )
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: hasErr
                              ? AppColors.kError
                              : AppColors.kGreyTextFieldBorderColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 8,
                        ),
                      ),

                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.kError, // Error border color
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.kError, // Focused error border color
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                ),

                hintText: widget.hintText,
                hintStyle:
                    widget.hintStyle ??
                    AppTextStyles.kgrey6D12Bold,
                suffixIcon:
                    widget.hasSuffix == true || widget.suffixIcon != null
                    ? SizedBox(
                        height: 30,
                        width:widget.suffixWidth ?? 30,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                              bottom: 2,
                            ),
                            child:
                                (widget.suffixIcon ??
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        _isObscure == true
                                            ? AppIcons.eyeOpened
                                            : AppIcons.eyeClosed,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    : null,
                prefixIcon: widget.hasPrefix == true
                    ? widget.prefixIcon!
                    : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        widget.borderColor ??
                        AppColors.kGreyTextFieldBorderColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                ),
                focusedBorder: widget.readOnly
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.kGreyTextFieldBorderColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 8,
                        ),
                      )
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              widget.borderColor ??
                              AppColors.kGreyTextFieldBorderColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 8,
                        ),
                      ),
              ),
              validator: (str) {
                String? e = widget.validator?.call(str);
                hasError.value = e != null;
                return e;
              },
            );
          },
        ),
      ],
    );
  }
}
