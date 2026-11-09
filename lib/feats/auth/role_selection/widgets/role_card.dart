import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../../core/const/app_text_styles.dart';
import '../../models/user_role.dart';

class RoleCard extends StatelessWidget {
  final UserRole role;
  final bool selected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.role,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 24.r;
    final height = 128.h;
    final palette = context.colors;
    final strings = AppStrings.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageWidth = constraints.maxWidth * 0.42;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(child: _background(radius, palette)),
                PositionedDirectional(
                  start: 0,
                  top: -height * 0.08,
                  bottom: 0,
                  width: imageWidth,
                  child: _image(radius),
                ),
                Positioned.fill(child: _content(context, imageWidth, strings)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _background(double radius, AppPalette palette) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: role.background(palette),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: selected ? role.accent : role.border(palette),
          width: selected ? 2 : 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: role.accent.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : const [],
      ),
    );
  }

  Widget _image(double radius) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(radius),
      ),
      child: AnimatedScale(
        scale: selected ? 1.05 : 1,
        alignment: Alignment.bottomCenter,
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutBack,
        child: Image.asset(
          role.image,
          fit: BoxFit.cover,
          alignment: role.imageAlignment,
        ),
      ),
    );
  }

  Widget _content(BuildContext context, double imageWidth, AppStrings strings) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: Row(
        children: [
          SizedBox(width: imageWidth + 8.w),
          Expanded(child: _texts(context, strings)),
          SizedBox(width: 8.w),
          _chevron(),
        ],
      ),
    );
  }

  Widget _texts(BuildContext context, AppStrings strings) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.h,
      children: [
        Text(role.title(strings), style: AppTextStyles.cardTitle(context)),
        Text(
          role.description(strings),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.cardDescription(context),
        ),
      ],
    );
  }

  Widget _chevron() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 44.r,
      height: 44.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? role.accent : role.accent.withValues(alpha: 0.14),
      ),
      child: Icon(
        SolarIconsOutline.altArrowRight,
        color: selected ? Colors.white : role.accent,
        size: 26.r,
      ),
    );
  }
}
