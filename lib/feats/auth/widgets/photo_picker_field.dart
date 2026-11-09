import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import '../../../core/const/app_text_styles.dart';
import '../../../core/utils/responsive_extension.dart';
import 'photo_source_sheet.dart';

class PhotoPickerField extends FormField<XFile> {
  PhotoPickerField({
    super.key,
    required String label,
    required IconData icon,
    required String requiredMessage,
  }) : super(
         validator: (file) => file == null ? requiredMessage : null,
         builder: (state) => _PhotoTile(
           label: label,
           icon: icon,
           file: state.value,
           errorText: state.errorText,
           onPicked: state.didChange,
         ),
       );
}

class _PhotoTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final XFile? file;
  final String? errorText;
  final ValueChanged<XFile?> onPicked;

  const _PhotoTile({
    required this.label,
    required this.icon,
    required this.file,
    required this.errorText,
    required this.onPicked,
  });

  Future<void> _pick(BuildContext context) async {
    final source = await showPhotoSourceSheet(context);
    if (source == null) return;
    final picked = await ImagePicker().pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1600,
    );
    if (picked != null) onPicked(picked);
  }

  Color _borderColor(AppPalette palette) {
    if (errorText != null) return palette.error;
    if (file != null) return palette.accent;
    return palette.border;
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.h,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _pick(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: palette.fieldFill,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: _borderColor(palette),
                width: file != null ? 1.5 : 1,
              ),
            ),
            child: Row(
              spacing: 12.w,
              children: [
                _thumbnail(palette),
                Expanded(child: _texts(context, palette)),
                _trailing(palette),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 4.w),
            child: Text(errorText!, style: AppTextStyles.fieldError(context)),
          ),
      ],
    );
  }

  Widget _thumbnail(AppPalette palette) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 56.r,
        height: 56.r,
        child: file == null
            ? Container(
                color: palette.surface,
                child: Icon(icon, color: palette.textSecondary, size: 26.r),
              )
            : Image.file(File(file!.path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _texts(BuildContext context, AppPalette palette) {
    final strings = AppStrings.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2.h,
      children: [
        Text(label, style: AppTextStyles.fieldLabel(context)),
        Text(
          file == null ? strings.tapToAddPhoto : strings.photoPicked,
          style: AppTextStyles.caption(context).copyWith(
            color: file == null ? palette.textSecondary : palette.link,
          ),
        ),
      ],
    );
  }

  Widget _trailing(AppPalette palette) {
    if (file == null) {
      return Icon(
        SolarIconsOutline.addCircle,
        color: palette.textSecondary,
        size: 26.r,
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onPicked(null),
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(
          SolarIconsOutline.closeCircle,
          color: palette.textSecondary,
          size: 22.r,
        ),
      ),
    );
  }
}
