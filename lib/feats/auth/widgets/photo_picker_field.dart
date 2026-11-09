import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_text_styles.dart';
import '../../../core/utils/responsive_extension.dart';
import 'photo_source_sheet.dart';

class PhotoPickerField extends FormField<XFile> {
  PhotoPickerField({
    super.key,
    required String label,
    required IconData icon,
    String requiredMessage = 'هذه الصورة مطلوبة',
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

  Color get _borderColor {
    if (errorText != null) return AppColors.error;
    if (file != null) return AppColors.tealLight;
    return AppColors.border;
  }

  @override
  Widget build(BuildContext context) {
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
              color: AppColors.fieldFill,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: _borderColor,
                width: file != null ? 1.5 : 1,
              ),
            ),
            child: Row(
              spacing: 12.w,
              children: [
                _thumbnail(),
                Expanded(child: _texts()),
                _trailing(),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 4.w),
            child: Text(errorText!, style: AppTextStyles.fieldError),
          ),
      ],
    );
  }

  Widget _thumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 56.r,
        height: 56.r,
        child: file == null
            ? Container(
                color: AppColors.surface,
                child: Icon(icon, color: AppColors.grey, size: 26.r),
              )
            : Image.file(File(file!.path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _texts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2.h,
      children: [
        Text(label, style: AppTextStyles.fieldLabel),
        Text(
          file == null ? 'اضغط لإضافة صورة' : 'تم اختيار الصورة',
          style: AppTextStyles.caption.copyWith(
            color: file == null ? AppColors.grey : AppColors.teal,
          ),
        ),
      ],
    );
  }

  Widget _trailing() {
    if (file == null) {
      return Icon(
        Icons.add_circle_outline_rounded,
        color: AppColors.grey,
        size: 26.r,
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onPicked(null),
      child: Padding(
        padding: EdgeInsets.all(4.r),
        child: Icon(Icons.close_rounded, color: AppColors.grey, size: 22.r),
      ),
    );
  }
}