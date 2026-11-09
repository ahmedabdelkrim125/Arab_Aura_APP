import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_text_styles.dart';

Future<ImageSource?> showPhotoSourceSheet(BuildContext context) {
  return showModalBottomSheet<ImageSource>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) => Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _SourceTile(
                icon: Icons.photo_camera_outlined,
                label: 'التقاط صورة',
                source: ImageSource.camera,
              ),
              _SourceTile(
                icon: Icons.photo_library_outlined,
                label: 'اختيار من المعرض',
                source: ImageSource.gallery,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _SourceTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final ImageSource source;

  const _SourceTile({
    required this.icon,
    required this.label,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pop(source),
      leading: Icon(icon, color: AppColors.teal, size: 26.r),
      title: Text(label, style: AppTextStyles.fieldLabel),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    );
  }
}