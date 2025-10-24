import 'package:flutter/material.dart';

/// Configuration class for shimmer effect customization
class ShimmerConfig {
  /// The base color of the shimmer effect
  final Color? baseColor;

  /// The highlight color of the shimmer effect
  final Color? highlightColor;

  /// Duration of the shimmer animation
  final Duration duration;

  /// The direction of the shimmer effect
  final ShimmerDirection direction;

  /// Whether to use auto-detected colors from theme
  final bool autoDetectTheme;

  /// Corner radius for skeleton shapes
  final double borderRadius;

  /// Opacity of the shimmer effect
  final double opacity;

  const ShimmerConfig({
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.leftToRight,
    this.autoDetectTheme = true,
    this.borderRadius = 4.0,
    this.opacity = 1.0,
  });

  /// Creates a copy with overridden values
  ShimmerConfig copyWith({
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
    ShimmerDirection? direction,
    bool? autoDetectTheme,
    double? borderRadius,
    double? opacity,
  }) {
    return ShimmerConfig(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
      duration: duration ?? this.duration,
      direction: direction ?? this.direction,
      autoDetectTheme: autoDetectTheme ?? this.autoDetectTheme,
      borderRadius: borderRadius ?? this.borderRadius,
      opacity: opacity ?? this.opacity,
    );
  }

  /// Gets the effective base color based on theme and brightness
  Color getBaseColor(BuildContext context) {
    if (baseColor != null && !autoDetectTheme) {
      return baseColor!;
    }

    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return baseColor ?? Colors.grey[850]!;
    } else {
      return baseColor ?? Colors.grey[300]!;
    }
  }

  /// Gets the effective highlight color based on theme and brightness
  Color getHighlightColor(BuildContext context) {
    if (highlightColor != null && !autoDetectTheme) {
      return highlightColor!;
    }

    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return highlightColor ?? Colors.grey[800]!;
    } else {
      return highlightColor ?? Colors.grey[100]!;
    }
  }
}

/// Direction of the shimmer animation
enum ShimmerDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }
