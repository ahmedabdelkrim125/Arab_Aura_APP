import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import '../const/app_colors.dart';
import '../const/app_text_styles.dart';

enum AppButtonVariant { filled, outlined, soft }

enum AppButtonIconPlacement { edge, inline }

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? trailingIcon;
  final Widget? leading;
  final AppButtonIconPlacement iconPlacement;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? foregroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool? showShadow;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.isLoading = false,
    this.trailingIcon,
    this.leading,
    this.iconPlacement = AppButtonIconPlacement.edge,
    this.width,
    this.height,
    this.radius,
    this.backgroundColor,
    this.gradient,
    this.foregroundColor,
    this.borderColor,
    this.textStyle,
    this.showShadow,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null && !widget.isLoading;

  _ButtonColors get _colors {
    switch (widget.variant) {
      case AppButtonVariant.filled:
        return _ButtonColors(
          background: widget.backgroundColor ?? AppColors.navy,
          foreground: widget.foregroundColor ?? Colors.white,
        );
      case AppButtonVariant.outlined:
        return _ButtonColors(
          background: widget.backgroundColor ?? Colors.white,
          foreground: widget.foregroundColor ?? AppColors.navy,
          border: widget.borderColor ?? AppColors.border,
        );
      case AppButtonVariant.soft:
        return _ButtonColors(
          background: widget.backgroundColor ??
              AppColors.tealLight.withValues(alpha: 0.12),
          foreground: widget.foregroundColor ?? AppColors.teal,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _colors;
    final radius = BorderRadius.circular(widget.radius ?? 16.r);
    final shadow = widget.showShadow ?? widget.variant == AppButtonVariant.filled;
    final shadowColor = widget.backgroundColor ?? AppColors.navy;

    return AnimatedScale(
      scale: _pressed && _enabled ? 0.97 : 1,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: widget.onPressed == null && !widget.isLoading ? 0.5 : 1,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 56.h,
          decoration: BoxDecoration(
            color: widget.gradient == null ? colors.background : null,
            gradient: widget.gradient,
            borderRadius: radius,
            border: colors.border == null
                ? null
                : Border.all(color: colors.border!),
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: shadowColor.withValues(alpha: 0.28),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: radius,
              onTap: _enabled ? widget.onPressed : null,
              onHighlightChanged: (value) => setState(() => _pressed = value),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _content(colors.foreground),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(Color foreground) {
    if (widget.isLoading) {
      return Center(
        child: SizedBox(
          width: 24.r,
          height: 24.r,
          child: CircularProgressIndicator(strokeWidth: 2.4, color: foreground),
        ),
      );
    }

    final icon = widget.trailingIcon == null
        ? null
        : Icon(
            widget.trailingIcon,
            color: foreground,
            size: 26.r,
            textDirection: TextDirection.ltr,
          );
    final inlineIcon = widget.iconPlacement == AppButtonIconPlacement.inline;

    final label = FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.leading != null) ...[
            widget.leading!,
            SizedBox(width: 10.w),
          ],
          Text(
            widget.label,
            maxLines: 1,
            style: (widget.textStyle ?? AppTextStyles.buttonLabel)
                .copyWith(color: foreground),
          ),
          if (icon != null && inlineIcon) ...[
            SizedBox(width: 10.w),
            icon,
          ],
        ],
      ),
    );

    if (icon == null || inlineIcon) return Center(child: label);

    return Stack(
      children: [
        Center(child: label),
        PositionedDirectional(
          start: 0,
          top: 0,
          bottom: 0,
          child: Center(child: icon),
        ),
      ],
    );
  }
}

class _ButtonColors {
  final Color background;
  final Color foreground;
  final Color? border;

  const _ButtonColors({
    required this.background,
    required this.foreground,
    this.border,
  });
}