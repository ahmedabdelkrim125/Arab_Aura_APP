import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_text_styles.dart';

Future<ImageSource?> showPhotoSourceSheet(BuildContext context) {
  return showModalBottomSheet<ImageSource>(
    context: context,
    backgroundColor: context.colors.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) {
      final strings = AppStrings.of(context);

      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SourceTile(
                icon: SolarIconsOutline.camera,
                label: strings.takePhoto,
                source: ImageSource.camera,
              ),
              _SourceTile(
                icon: SolarIconsOutline.gallery,
                label: strings.chooseFromGallery,
                source: ImageSource.gallery,
              ),
            ],
          ),
        ),
      );
    },
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
    final palette = context.colors;

    return ListTile(
      onTap: () => Navigator.of(context).pop(source),
      leading: Icon(icon, color: palette.accent, size: 26.r),
      title: Text(label, style: AppTextStyles.fieldLabel(context)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    );
  }
}
