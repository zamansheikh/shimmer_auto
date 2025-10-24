# 🚀 Shimmer Auto - Quick Reference Card

## Installation
```yaml
dependencies:
  shimmer_auto: ^0.0.1
```

## Import
```dart
import 'package:shimmer_auto/shimmer_auto.dart';
```

---

## 🎯 Quick Usage

### Basic (Auto-Detect Everything)
```dart
widget.withAutoShimmer(loading: isLoading)
```

### Custom Colors
```dart
widget.withShimmer(
  loading: isLoading,
  baseColor: Colors.grey[300],
  highlightColor: Colors.grey[100],
)
```

### Circular (For Avatars)
```dart
widget.withCircularShimmer(loading: isLoading)
```

### Fast Animation
```dart
widget.withFastShimmer(loading: isLoading)
```

### Slow Animation
```dart
widget.withSlowShimmer(loading: isLoading)
```

---

## 🎨 Directions

```dart
widget.withShimmer(
  loading: true,
  direction: ShimmerDirection.leftToRight,   // →
  // direction: ShimmerDirection.rightToLeft,   // ←
  // direction: ShimmerDirection.topToBottom,   // ↓
  // direction: ShimmerDirection.bottomToTop,   // ↑
)
```

---

## ⚙️ Configuration

```dart
ShimmerConfig(
  baseColor: Colors.grey[300],           // Base color
  highlightColor: Colors.grey[100],      // Highlight color
  duration: Duration(milliseconds: 1500), // Animation speed
  direction: ShimmerDirection.leftToRight, // Direction
  autoDetectTheme: true,                  // Auto theme colors
  borderRadius: 4.0,                      // Corner radius
  opacity: 1.0,                           // Effect opacity
)
```

---

## 📋 Common Patterns

### Loading Card
```dart
Card(
  child: ListTile(
    leading: CircleAvatar(...),
    title: Text('Title'),
    subtitle: Text('Subtitle'),
  ).withAutoShimmer(loading: isLoading),
)
```

### Loading List
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(...)
      .withAutoShimmer(loading: isLoading);
  },
)
```

### Loading Image
```dart
Container(
  width: 200,
  height: 200,
  child: Image.network(url),
).withAutoShimmer(loading: !imageLoaded)
```

### Loading Profile
```dart
Row(
  children: [
    CircleAvatar(radius: 25)
      .withCircularShimmer(loading: isLoading),
    SizedBox(width: 12),
    Column(
      children: [
        Container(height: 16, width: 150)
          .withAutoShimmer(loading: isLoading),
        Container(height: 12, width: 100)
          .withAutoShimmer(loading: isLoading),
      ],
    ),
  ],
)
```

---

## 🎯 Works With

✅ Container  
✅ SizedBox  
✅ Text  
✅ Image  
✅ CircleAvatar  
✅ Card  
✅ ListTile  
✅ **Any Widget**  

---

## 🌈 Theme Support

### Auto-Detect (Default)
```dart
// Automatically uses theme colors
widget.withAutoShimmer(loading: true)
```

### Light Theme
- Base: `Colors.grey[300]`
- Highlight: `Colors.grey[100]`

### Dark Theme
- Base: `Colors.grey[850]`
- Highlight: `Colors.grey[800]`

### Custom (Override Theme)
```dart
widget.withShimmer(
  loading: true,
  baseColor: Colors.blue[300],
  highlightColor: Colors.blue[100],
  autoDetectTheme: false, // Don't use theme
)
```

---

## ⚡ Speed Presets

| Method | Duration | Use Case |
|--------|----------|----------|
| `withFastShimmer()` | 800ms | Quick feedback |
| `withAutoShimmer()` | 1500ms | Default |
| `withSlowShimmer()` | 2500ms | Subtle loading |

---

## 🎯 Best Practices

### ✅ Do
```dart
// Simple and clean
Container(...).withAutoShimmer(loading: isLoading)

// Conditional loading
if (isLoading) {
  return widget.withAutoShimmer(loading: true);
}

// Reuse config
final config = ShimmerConfig(...);
widget1.withAutoShimmer(loading: true, config: config);
```

### ❌ Don't
```dart
// Don't create new configs repeatedly
widget.withAutoShimmer(
  loading: true,
  config: ShimmerConfig(...), // New instance each build
)

// Don't apply to widgets without size
Expanded(...).withAutoShimmer(loading: true) // Won't work well
```

---

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| Shimmer not visible | Ensure widget has defined size |
| Wrong colors | Check `autoDetectTheme` setting |
| Too fast/slow | Use speed presets or custom duration |
| Not animating | Verify `loading: true` is set |

---

## 📚 Examples

### Example 1: Simple Container
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
).withAutoShimmer(loading: isLoading)
```

### Example 2: Text Loading
```dart
Text(
  'Loading...',
  style: TextStyle(fontSize: 18),
).withAutoShimmer(loading: isLoading)
```

### Example 3: Custom Direction
```dart
Container(
  width: 200,
  height: 80,
).withShimmer(
  loading: true,
  direction: ShimmerDirection.topToBottom,
)
```

### Example 4: Profile Card
```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ).withCircularShimmer(loading: isLoading),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 16, width: double.infinity)
                .withAutoShimmer(loading: isLoading),
              SizedBox(height: 8),
              Container(height: 12, width: 150)
                .withAutoShimmer(loading: isLoading),
            ],
          ),
        ),
      ],
    ),
  ),
)
```

---

## 🎨 All Extension Methods

```dart
// 1. Auto-detect everything (recommended)
widget.withAutoShimmer(loading: bool)

// 2. Custom configuration
widget.withShimmer(
  loading: bool,
  baseColor: Color?,
  highlightColor: Color?,
  duration: Duration?,
  direction: ShimmerDirection?,
  borderRadius: double?,
  autoDetectTheme: bool,
)

// 3. Circular shimmer
widget.withCircularShimmer(
  loading: bool,
  baseColor: Color?,
  highlightColor: Color?,
  duration: Duration?,
)

// 4. Fast shimmer (800ms)
widget.withFastShimmer(
  loading: bool,
  config: ShimmerConfig?,
)

// 5. Slow shimmer (2500ms)
widget.withSlowShimmer(
  loading: bool,
  config: ShimmerConfig?,
)
```

---

## 💡 Pro Tips

1. **Use auto-detect** for quick prototypes
2. **Customize colors** to match your brand
3. **Reuse configs** for consistency
4. **Match animation speed** to your UX
5. **Test both themes** (light/dark)

---

## 📱 Platform Support

✅ iOS | ✅ Android | ✅ Web | ✅ Windows | ✅ macOS | ✅ Linux

---

## 🔗 Resources

- **README.md** - Complete guide
- **API.md** - Full API reference
- **example/main.dart** - Full demo
- **example/quick_start.dart** - Quick examples

---

## 📦 Package Info

- **Name:** shimmer_auto
- **Version:** 0.0.1
- **Tests:** 13 (all passing)
- **Files:** 4 core + 2 examples + 1 test

---

**Made with ❤️ for Flutter developers**
