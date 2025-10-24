import 'package:flutter/material.dart';
import 'shimmer_auto_widget.dart';
import 'shimmer_config.dart';

/// Extension on Widget to add shimmer functionality
extension ShimmerAutoExtension on Widget {
  /// Wraps the widget with auto shimmer effect
  ///
  /// Example:
  /// ```dart
  /// Container(
  ///   width: 100,
  ///   height: 100,
  /// ).withAutoShimmer(loading: isLoading);
  /// ```
  Widget withAutoShimmer({
    required bool loading,
    ShimmerConfig? config,
    bool autoDetect = true,
  }) {
    return ShimmerAuto(
      loading: loading,
      config: config,
      autoDetect: autoDetect,
      child: this,
    );
  }

  /// Wraps the widget with shimmer effect with custom configuration
  ///
  /// Example:
  /// ```dart
  /// Text('Loading...').withShimmer(
  ///   loading: true,
  ///   baseColor: Colors.grey[300],
  ///   highlightColor: Colors.grey[100],
  /// );
  /// ```
  Widget withShimmer({
    required bool loading,
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
    ShimmerDirection? direction,
    double? borderRadius,
    bool autoDetectTheme = true,
  }) {
    return ShimmerAuto(
      loading: loading,
      config: ShimmerConfig(
        baseColor: baseColor,
        highlightColor: highlightColor,
        duration: duration ?? const Duration(milliseconds: 1500),
        direction: direction ?? ShimmerDirection.leftToRight,
        autoDetectTheme: autoDetectTheme,
        borderRadius: borderRadius ?? 4.0,
      ),
      child: this,
    );
  }

  /// Wraps the widget with a circular shimmer effect
  ///
  /// Useful for avatars and circular images
  Widget withCircularShimmer({
    required bool loading,
    Color? baseColor,
    Color? highlightColor,
    Duration? duration,
  }) {
    return ShimmerAuto(
      loading: loading,
      config: ShimmerConfig(
        baseColor: baseColor,
        highlightColor: highlightColor,
        duration: duration ?? const Duration(milliseconds: 1500),
        borderRadius: 1000, // Large radius for circular effect
      ),
      child: this,
    );
  }

  /// Wraps the widget with a fast shimmer effect
  Widget withFastShimmer({required bool loading, ShimmerConfig? config}) {
    return ShimmerAuto(
      loading: loading,
      config: (config ?? const ShimmerConfig()).copyWith(
        duration: const Duration(milliseconds: 800),
      ),
      child: this,
    );
  }

  /// Wraps the widget with a slow shimmer effect
  Widget withSlowShimmer({required bool loading, ShimmerConfig? config}) {
    return ShimmerAuto(
      loading: loading,
      config: (config ?? const ShimmerConfig()).copyWith(
        duration: const Duration(milliseconds: 2500),
      ),
      child: this,
    );
  }
}
