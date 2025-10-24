# Shimmer Auto - API Documentation

## Table of Contents

1. [Core Classes](#core-classes)
2. [Extension Methods](#extension-methods)
3. [Configuration](#configuration)
4. [Enums](#enums)

---

## Core Classes

### ShimmerAuto

The main widget that wraps a child and provides shimmer loading effect.

```dart
ShimmerAuto({
  Key? key,
  required Widget child,
  required bool loading,
  ShimmerConfig? config,
  bool autoDetect = true,
})
```

**Parameters:**
- `child` (Widget, required): The widget to wrap with shimmer
- `loading` (bool, required): Whether to show loading state
- `config` (ShimmerConfig?, optional): Custom shimmer configuration
- `autoDetect` (bool, default: true): Whether to auto-detect child properties

**Example:**
```dart
ShimmerAuto(
  loading: isLoading,
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
)
```

---

## Extension Methods

All Flutter widgets can use these extension methods:

### withAutoShimmer

Wraps the widget with automatic shimmer detection.

```dart
Widget withAutoShimmer({
  required bool loading,
  ShimmerConfig? config,
  bool autoDetect = true,
})
```

**Example:**
```dart
Container(
  width: 100,
  height: 100,
).withAutoShimmer(loading: isLoading);
```

---

### withShimmer

Wraps the widget with custom shimmer configuration.

```dart
Widget withShimmer({
  required bool loading,
  Color? baseColor,
  Color? highlightColor,
  Duration? duration,
  ShimmerDirection? direction,
  double? borderRadius,
  bool autoDetectTheme = true,
})
```

**Parameters:**
- `loading` (bool, required): Whether to show loading state
- `baseColor` (Color?, optional): Base color of shimmer
- `highlightColor` (Color?, optional): Highlight color
- `duration` (Duration?, optional): Animation duration
- `direction` (ShimmerDirection?, optional): Animation direction
- `borderRadius` (double?, optional): Corner radius
- `autoDetectTheme` (bool, default: true): Auto-detect theme colors

**Example:**
```dart
Container(
  width: 100,
  height: 100,
).withShimmer(
  loading: true,
  baseColor: Colors.grey[300],
  highlightColor: Colors.grey[100],
  duration: Duration(milliseconds: 1000),
  direction: ShimmerDirection.rightToLeft,
);
```

---

### withCircularShimmer

Wraps the widget with circular shimmer effect (useful for avatars).

```dart
Widget withCircularShimmer({
  required bool loading,
  Color? baseColor,
  Color? highlightColor,
  Duration? duration,
})
```

**Example:**
```dart
CircleAvatar(
  radius: 30,
  backgroundImage: NetworkImage('...'),
).withCircularShimmer(loading: isLoading);
```

---

### withFastShimmer

Wraps the widget with a fast shimmer effect (800ms duration).

```dart
Widget withFastShimmer({
  required bool loading,
  ShimmerConfig? config,
})
```

**Example:**
```dart
Container(
  width: 100,
  height: 100,
).withFastShimmer(loading: isLoading);
```

---

### withSlowShimmer

Wraps the widget with a slow shimmer effect (2500ms duration).

```dart
Widget withSlowShimmer({
  required bool loading,
  ShimmerConfig? config,
})
```

**Example:**
```dart
Container(
  width: 100,
  height: 100,
).withSlowShimmer(loading: isLoading);
```

---

## Configuration

### ShimmerConfig

Configuration class for customizing shimmer effects.

```dart
ShimmerConfig({
  Color? baseColor,
  Color? highlightColor,
  Duration duration = const Duration(milliseconds: 1500),
  ShimmerDirection direction = ShimmerDirection.leftToRight,
  bool autoDetectTheme = true,
  double borderRadius = 4.0,
  double opacity = 1.0,
})
```

**Properties:**
- `baseColor` (Color?, optional): Base color of shimmer
- `highlightColor` (Color?, optional): Highlight color
- `duration` (Duration, default: 1500ms): Animation duration
- `direction` (ShimmerDirection, default: leftToRight): Animation direction
- `autoDetectTheme` (bool, default: true): Auto-detect theme colors
- `borderRadius` (double, default: 4.0): Corner radius for skeleton shapes
- `opacity` (double, default: 1.0): Opacity of the shimmer effect

**Methods:**

#### copyWith
Creates a copy with overridden values.

```dart
ShimmerConfig copyWith({
  Color? baseColor,
  Color? highlightColor,
  Duration? duration,
  ShimmerDirection? direction,
  bool? autoDetectTheme,
  double? borderRadius,
  double? opacity,
})
```

#### getBaseColor
Gets the effective base color based on theme and brightness.

```dart
Color getBaseColor(BuildContext context)
```

#### getHighlightColor
Gets the effective highlight color based on theme and brightness.

```dart
Color getHighlightColor(BuildContext context)
```

**Example:**
```dart
const config = ShimmerConfig(
  baseColor: Colors.grey[300],
  highlightColor: Colors.grey[100],
  duration: Duration(milliseconds: 1000),
  direction: ShimmerDirection.topToBottom,
  borderRadius: 8.0,
);

// Copy with modifications
final newConfig = config.copyWith(
  duration: Duration(milliseconds: 2000),
);
```

---

## Enums

### ShimmerDirection

Defines the direction of the shimmer animation.

```dart
enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}
```

**Values:**
- `leftToRight`: Shimmer moves from left to right (default)
- `rightToLeft`: Shimmer moves from right to left
- `topToBottom`: Shimmer moves from top to bottom
- `bottomToTop`: Shimmer moves from bottom to top

**Example:**
```dart
Container(
  width: 100,
  height: 100,
).withShimmer(
  loading: true,
  direction: ShimmerDirection.topToBottom,
);
```

---

## Auto-Detection Features

The package automatically detects and creates skeletons for:

### Supported Widgets

- **Container**: Detects size, color, and decoration
- **SizedBox**: Detects width and height
- **Text**: Detects font size and style
- **Image**: Detects dimensions
- **CircleAvatar**: Detects radius
- **Card**: Detects elevation and margins
- **ListTile**: Creates three-part skeleton (leading, title, subtitle)

### Theme Detection

The package automatically adapts colors based on:
- Current theme brightness (light/dark)
- Material Design color scheme
- Custom theme colors

**Light Theme Colors:**
- Base: `Colors.grey[300]`
- Highlight: `Colors.grey[100]`

**Dark Theme Colors:**
- Base: `Colors.grey[850]`
- Highlight: `Colors.grey[800]`

---

## Best Practices

### 1. Use Auto-Detection for Quick Implementation

```dart
// Quick and easy
widget.withAutoShimmer(loading: isLoading);
```

### 2. Customize When Needed

```dart
// Fine-tune for specific designs
widget.withShimmer(
  loading: isLoading,
  baseColor: yourColor,
  highlightColor: yourHighlight,
);
```

### 3. Match Loading State to Data Fetching

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = true;
  String? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final result = await api.getData();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(data ?? 'Loading...')
        .withAutoShimmer(loading: isLoading);
  }
}
```

### 4. Use Appropriate Shimmer Types

```dart
// For avatars
CircleAvatar(...).withCircularShimmer(loading: isLoading);

// For fast feedback
widget.withFastShimmer(loading: isLoading);

// For subtle loading
widget.withSlowShimmer(loading: isLoading);
```

---

## Performance Tips

1. **Reuse Configurations**: Create a config once and reuse it
   ```dart
   final config = ShimmerConfig(...);
   widget1.withAutoShimmer(loading: true, config: config);
   widget2.withAutoShimmer(loading: true, config: config);
   ```

2. **Conditional Loading**: Only apply shimmer when needed
   ```dart
   if (isLoading) {
     return widget.withAutoShimmer(loading: true);
   }
   return widget;
   ```

3. **Dispose Controllers**: The package automatically disposes animation controllers

---

## Troubleshooting

### Shimmer not showing?
- Ensure `loading: true` is set
- Check that the widget has defined dimensions
- Verify theme is properly configured

### Colors not matching theme?
- Set `autoDetectTheme: true` in configuration
- Ensure MaterialApp has theme configured

### Animation too fast/slow?
- Use `withFastShimmer()` or `withSlowShimmer()`
- Or customize: `duration: Duration(milliseconds: yourValue)`

---

## Migration Guide

If you're migrating from another shimmer package:

**From shimmer package:**
```dart
// Old
Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Container(...),
)

// New
Container(...)
  .withShimmer(
    loading: true,
    baseColor: Colors.grey[300],
    highlightColor: Colors.grey[100],
  )
```

**From skeletons package:**
```dart
// Old
Skeleton(
  isLoading: true,
  skeleton: SkeletonItem(...),
  child: YourWidget(),
)

// New
YourWidget().withAutoShimmer(loading: true)
```

---

## Support

For issues, questions, or contributions:
- GitHub: [github.com/yourusername/shimmer_auto](https://github.com/yourusername/shimmer_auto)
- Email: your.email@example.com

---

**Last Updated:** October 24, 2025  
**Version:** 0.0.1
