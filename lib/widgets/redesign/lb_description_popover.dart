import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/livebridge_tokens.dart';

class LbDescriptionPopover extends StatelessWidget {
  const LbDescriptionPopover({
    super.key,
    required this.text,
    required this.anchor,
    required this.onDismiss,
  });

  final String text;
  final Offset anchor;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final LbPalette palette = LbPalette.of(context);
    final Size viewport = MediaQuery.sizeOf(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    final double maxWidth =
        viewport.width - LbSpacing.descriptionPopoverHorizontalInset * 2;
    final double width = math.min(
      LbSpacing.descriptionPopoverMaxWidth,
      maxWidth,
    );
    final double left = (anchor.dx - width / 2)
        .clamp(
          LbSpacing.descriptionPopoverHorizontalInset,
          viewport.width - width - LbSpacing.descriptionPopoverHorizontalInset,
        )
        .toDouble();
    final double top = (anchor.dy + LbSpacing.descriptionPopoverVerticalGap)
        .clamp(
          padding.top + LbSpacing.sm,
          viewport.height - padding.bottom - LbSpacing.xl,
        )
        .toDouble();
    final double arrowLeft = (anchor.dx - left)
        .clamp(
          LbSpacing.descriptionPopoverArrowWidth / 2 + LbSpacing.sm,
          width - LbSpacing.descriptionPopoverArrowWidth / 2 - LbSpacing.sm,
        )
        .toDouble();
    final Color background = palette.background;

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onDismiss,
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            left: left,
            top: top,
            width: width,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.94, end: 1),
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    alignment: Alignment.topCenter,
                    child: child,
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    left:
                        arrowLeft - LbSpacing.descriptionPopoverArrowWidth / 2,
                    top: 0,
                    child: CustomPaint(
                      size: const Size(
                        LbSpacing.descriptionPopoverArrowWidth,
                        LbSpacing.descriptionPopoverArrowHeight,
                      ),
                      painter: _LbDescriptionArrowPainter(color: background),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: LbSpacing.descriptionPopoverArrowHeight - 1,
                    ),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            LbSpacing.descriptionPopoverPaddingHorizontal,
                        vertical: LbSpacing.descriptionPopoverPaddingVertical,
                      ),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(LbRadius.card),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: palette.shadowOuter,
                            blurRadius: 22,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Text(
                        text,
                        style: LbTextStyles.body.copyWith(
                          color: palette.textSecondary,
                          height: 1.22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LbDescriptionArrowPainter extends CustomPainter {
  const _LbDescriptionArrowPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..cubicTo(
        size.width * 0.62,
        size.height * 0.12,
        size.width * 0.62,
        size.height,
        size.width,
        size.height,
      )
      ..lineTo(0, size.height)
      ..cubicTo(
        size.width * 0.38,
        size.height,
        size.width * 0.38,
        size.height * 0.12,
        size.width / 2,
        0,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _LbDescriptionArrowPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
