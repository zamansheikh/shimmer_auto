# Shimmer Auto<!--

This README describes the package. If you publish this package to pub.dev,

[![pub package](https://img.shields.io/pub/v/shimmer_auto.svg)](https://pub.dev/packages/shimmer_auto)this README's contents appear on the landing page for your package.



An intelligent shimmer effect package for Flutter that automatically detects widget appearance and generates skeleton loading states. No manual configuration needed!For information about how to write a good package README, see the guide for

[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

## ✨ Features

For general information about developing packages, see the Dart guide for

- 🎯 **Smart Auto-Detection**: Automatically detects widget colors, sizes, and shapes[creating packages](https://dart.dev/guides/libraries/create-packages)

- 🎨 **Theme-Aware**: Adapts to light and dark themes automaticallyand the Flutter guide for

- 🔧 **Easy to Use**: Simple extension methods - just add `.withAutoShimmer(loading: isLoading)`[developing packages and plugins](https://flutter.dev/to/develop-packages).

- 🎭 **Multiple Directions**: Left-to-right, right-to-left, top-to-bottom, bottom-to-top-->

- ⚡ **Performance Optimized**: Efficient animations with minimal overhead

- 🎪 **Versatile**: Works with any widget - Container, SizedBox, Text, Image, Card, ListTile, etc.TODO: Put a short description of the package here that helps potential users

- 🎛️ **Customizable**: Full control over colors, duration, and animation style when neededknow whether this package might be useful for them.



## 📦 Installation## Features



Add this to your package's `pubspec.yaml` file:TODO: List what your package can do. Maybe include images, gifs, or videos.



```yaml## Getting started

dependencies:

  shimmer_auto: ^0.0.1TODO: List prerequisites and provide or point to information on how to

```start using the package.



Then run:## Usage



```bashTODO: Include short and useful examples for package users. Add longer examples

flutter pub getto `/example` folder.

```

```dart

## 🚀 Quick Startconst like = 'sample';

```

Import the package:

## Additional information

```dart

import 'package:shimmer_auto/shimmer_auto.dart';TODO: Tell users more about the package: where to find more information, how to

```contribute to the package, how to file issues, what response they can expect

from the package authors, and more.

### Basic Usage

Simply add `.withAutoShimmer(loading: isLoading)` to any widget:

```dart
Container(
  width: 200,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
).withAutoShimmer(loading: isLoading);
```

### With SizedBox

```dart
SizedBox(
  width: 100,
  height: 50,
).withAutoShimmer(loading: isLoading);
```

### With Text

```dart
Text(
  'Loading text...',
  style: TextStyle(fontSize: 16),
).withAutoShimmer(loading: isLoading);
```

## 📚 Advanced Usage

### Custom Shimmer Configuration

```dart
Container(
  width: 200,
  height: 100,
).withShimmer(
  loading: isLoading,
  baseColor: Colors.grey[300],
  highlightColor: Colors.grey[100],
  duration: Duration(milliseconds: 1500),
  direction: ShimmerDirection.leftToRight,
);
```

### Different Shimmer Directions

```dart
// Left to Right (default)
widget.withShimmer(
  loading: true,
  direction: ShimmerDirection.leftToRight,
);

// Right to Left
widget.withShimmer(
  loading: true,
  direction: ShimmerDirection.rightToLeft,
);

// Top to Bottom
widget.withShimmer(
  loading: true,
  direction: ShimmerDirection.topToBottom,
);

// Bottom to Top
widget.withShimmer(
  loading: true,
  direction: ShimmerDirection.bottomToTop,
);
```

### Circular Shimmer (for Avatars)

```dart
CircleAvatar(
  radius: 30,
  backgroundImage: NetworkImage('...'),
).withCircularShimmer(loading: isLoading);
```

### Speed Variations

```dart
// Fast shimmer (800ms)
widget.withFastShimmer(loading: isLoading);

// Slow shimmer (2500ms)
widget.withSlowShimmer(loading: isLoading);
```

## 🎯 Real-World Examples

### Loading Card with Profile

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
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ).withCircularShimmer(loading: isLoading),
        
        SizedBox(width: 16),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
                width: double.infinity,
                color: Colors.grey[300],
              ).withAutoShimmer(loading: isLoading),
              
              SizedBox(height: 8),
              
              Container(
                height: 12,
                width: 150,
                color: Colors.grey[300],
              ).withAutoShimmer(loading: isLoading),
            ],
          ),
        ),
      ],
    ),
  ),
);
```

### Loading List

```dart
ListView.builder(
  itemCount: 5,
  itemBuilder: (context, index) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      title: Text('Item $index'),
      subtitle: Text('Subtitle $index'),
    ).withAutoShimmer(loading: isLoading);
  },
);
```

### Complete Example

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
        ).withAutoShimmer(loading: isLoading),
        
        SizedBox(height: 16),
        
        Text(
          'Content Title',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ).withAutoShimmer(loading: isLoading),
        
        SizedBox(height: 8),
        
        Text(
          'Content description goes here...',
          style: TextStyle(fontSize: 16),
        ).withAutoShimmer(loading: isLoading),
      ],
    );
  }
}
```

## 🎨 Customization Options

### ShimmerConfig

```dart
ShimmerConfig(
  baseColor: Colors.grey[300],        // Base color of shimmer
  highlightColor: Colors.grey[100],   // Highlight color
  duration: Duration(milliseconds: 1500),  // Animation duration
  direction: ShimmerDirection.leftToRight, // Animation direction
  autoDetectTheme: true,              // Auto-detect theme colors
  borderRadius: 4.0,                  // Corner radius
  opacity: 1.0,                       // Opacity of effect
)
```

### Using ShimmerAuto Widget Directly

```dart
ShimmerAuto(
  loading: isLoading,
  config: ShimmerConfig(
    baseColor: Colors.red[200],
    highlightColor: Colors.red[50],
    duration: Duration(milliseconds: 1000),
  ),
  child: YourWidget(),
)
```

## 🌟 Extension Methods

All widgets can use these extension methods:

- `.withAutoShimmer(loading: bool)` - Auto-detect and apply shimmer
- `.withShimmer(...)` - Custom shimmer configuration
- `.withCircularShimmer(loading: bool)` - Circular shimmer for avatars
- `.withFastShimmer(loading: bool)` - Fast animation (800ms)
- `.withSlowShimmer(loading: bool)` - Slow animation (2500ms)

## 🎯 Supported Widgets

The package automatically detects and creates appropriate skeletons for:

- ✅ Container
- ✅ SizedBox
- ✅ Text
- ✅ Image
- ✅ CircleAvatar
- ✅ Card
- ✅ ListTile
- ✅ Any custom widget

## 🔧 Theme Support

The package automatically adapts to your app's theme:

```dart
MaterialApp(
  theme: ThemeData.light(),  // Light theme colors
  darkTheme: ThemeData.dark(), // Dark theme colors
  // ...
)
```

In **light mode**: Uses light grey colors  
In **dark mode**: Uses dark grey colors

## 📱 Platform Support

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🐛 Issues and Feedback

Please file issues, bugs, or feature requests in our [issue tracker](https://github.com/yourusername/shimmer_auto/issues).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Credits

Created with ❤️ for the Flutter community.

---

**Happy Coding! 🚀**
