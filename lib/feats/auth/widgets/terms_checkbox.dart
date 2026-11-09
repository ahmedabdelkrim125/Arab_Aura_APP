import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/widgets/app_checkbox.dart';
import '../../../core/const/app_text_styles.dart';

class TermsCheckbox extends FormField<bool> {
  TermsCheckbox({super.key, required String requiredMessage})
    : super(
        initialValue: false,
        validator: (value) => value == true ? null : requiredMessage,
        builder: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.w,
              children: [
                AppCheckbox(
                  value: state.value ?? false,
                  onChanged: state.didChange,
                ),
                Expanded(
                  child: Text(
                    AppStrings.of(state.context).termsLabel,
                    style: AppTextStyles.caption(state.context),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsetsDirectional.only(top: 6.h, start: 34.w),
                child: Text(
                  state.errorText!,
                  style: AppTextStyles.fieldError(state.context),
                ),
              ),
          ],
        ),
      );
}
