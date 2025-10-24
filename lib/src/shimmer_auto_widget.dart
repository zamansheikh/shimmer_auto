import 'package:flutter/material.dart';
import 'shimmer_config.dart';
import 'shimmer_painter.dart';

/// Main shimmer widget that wraps child and provides shimmer effect
class ShimmerAuto extends StatefulWidget {
  /// The child widget to wrap with shimmer
  final Widget child;

  /// Whether to show loading state with shimmer
  final bool loading;

  /// Custom shimmer configuration
  final ShimmerConfig? config;

  /// Whether to auto-detect child widget properties
  final bool autoDetect;

  const ShimmerAuto({
    super.key,
    required this.child,
    required this.loading,
    this.config,
    this.autoDetect = true,
  });

  @override
  State<ShimmerAuto> createState() => _ShimmerAutoState();
}

class _ShimmerAutoState extends State<ShimmerAuto>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Color? _detectedColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.config?.duration ?? const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    if (widget.loading) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(ShimmerAuto oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.loading != oldWidget.loading) {
      if (widget.loading) {
        _controller.repeat();
      } else {
        _controller.stop();
        _controller.reset();
      }
    }

    if (widget.config?.duration != oldWidget.config?.duration) {
      _controller.duration =
          widget.config?.duration ?? const Duration(milliseconds: 1500);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Detects the child widget's color
  Color? _detectChildColor(Widget child) {
    if (!widget.autoDetect) return null;

    if (child is Container) {
      final container = child;
      if (container.color != null) {
        return container.color;
      }
      if (container.decoration is BoxDecoration) {
        final boxDecoration = container.decoration as BoxDecoration;
        return boxDecoration.color;
      }
    } else if (child is DecoratedBox) {
      final decoration = child.decoration;
      if (decoration is BoxDecoration) {
        return decoration.color;
      }
    } else if (child is ColoredBox) {
      return child.color;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.loading) {
      return widget.child;
    }

    final config = widget.config ?? const ShimmerConfig();
    _detectedColor = _detectChildColor(widget.child);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return _ShimmerEffect(
          progress: _animation.value,
          config: config,
          detectedColor: _detectedColor,
          child: _SkeletonDetector(config: config, child: widget.child),
        );
      },
    );
  }
}

/// Widget that detects child properties and creates skeleton
class _SkeletonDetector extends StatelessWidget {
  final Widget child;
  final ShimmerConfig config;

  const _SkeletonDetector({required this.child, required this.config});

  @override
  Widget build(BuildContext context) {
    return _buildSkeleton(context, child);
  }

  Widget _buildSkeleton(BuildContext context, Widget widget) {
    // Detect and replace common widgets with skeleton versions
    if (widget is Container) {
      return _createSkeletonContainer(context, widget);
    } else if (widget is SizedBox) {
      return _createSkeletonSizedBox(context, widget);
    } else if (widget is Text) {
      return _createSkeletonText(context, widget);
    } else if (widget is Image) {
      return _createSkeletonImage(context, widget);
    } else if (widget is CircleAvatar) {
      return _createSkeletonCircleAvatar(context, widget);
    } else if (widget is Card) {
      return _createSkeletonCard(context, widget);
    } else if (widget is ListTile) {
      return _createSkeletonListTile(context);
    }

    // For other widgets, wrap with opacity
    return Opacity(opacity: 0.3, child: widget);
  }

  Widget _createSkeletonContainer(BuildContext context, Container container) {
    return Container(
      width: container.constraints?.maxWidth,
      height: container.constraints?.maxHeight,
      margin: container.margin,
      padding: container.padding,
      decoration: BoxDecoration(
        color: config.getBaseColor(context),
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
    );
  }

  Widget _createSkeletonSizedBox(BuildContext context, SizedBox sizedBox) {
    return Container(
      width: sizedBox.width,
      height: sizedBox.height,
      decoration: BoxDecoration(
        color: config.getBaseColor(context),
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
    );
  }

  Widget _createSkeletonText(BuildContext context, Text text) {
    final style = text.style ?? DefaultTextStyle.of(context).style;
    final fontSize = style.fontSize ?? 14.0;

    return Container(
      width: 100,
      height: fontSize * 1.2,
      decoration: BoxDecoration(
        color: config.getBaseColor(context),
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
    );
  }

  Widget _createSkeletonImage(BuildContext context, Image image) {
    return Container(
      width: image.width,
      height: image.height,
      decoration: BoxDecoration(
        color: config.getBaseColor(context),
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
    );
  }

  Widget _createSkeletonCircleAvatar(
    BuildContext context,
    CircleAvatar avatar,
  ) {
    final radius = avatar.radius ?? 20.0;
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: config.getBaseColor(context),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _createSkeletonCard(BuildContext context, Card card) {
    return Card(
      margin: card.margin,
      elevation: 0,
      color: config.getBaseColor(context),
      child: card.child != null
          ? _buildSkeleton(context, card.child!)
          : const SizedBox(),
    );
  }

  Widget _createSkeletonListTile(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: config.getBaseColor(context),
          shape: BoxShape.circle,
        ),
      ),
      title: Container(
        height: 16,
        decoration: BoxDecoration(
          color: config.getBaseColor(context),
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
      ),
      subtitle: Container(
        height: 12,
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: config.getBaseColor(context),
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
      ),
    );
  }
}

/// Shimmer effect overlay
class _ShimmerEffect extends StatelessWidget {
  final double progress;
  final ShimmerConfig config;
  final Color? detectedColor;
  final Widget child;

  const _ShimmerEffect({
    required this.progress,
    required this.config,
    required this.detectedColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: ClipRect(
            child: CustomPaint(
              painter: ShimmerPainter(
                progress: progress,
                baseColor: config.getBaseColor(context),
                highlightColor: config.getHighlightColor(context),
                direction: config.direction,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
