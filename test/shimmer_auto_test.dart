import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_auto/shimmer_auto.dart';

void main() {
  group('ShimmerAuto Widget Tests', () {
    testWidgets('should show child when loading is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ).withAutoShimmer(loading: false),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
      expect(find.byType(ShimmerAuto), findsOneWidget);
    });

    testWidgets('should show shimmer when loading is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ).withAutoShimmer(loading: true),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ShimmerAuto), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('should animate shimmer effect', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ).withAutoShimmer(loading: true),
          ),
        ),
      );

      // Initial state
      await tester.pump();

      // Advance animation
      await tester.pump(const Duration(milliseconds: 500));

      // Animation should be running
      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('should work with extension methods', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  width: 100,
                  height: 50,
                ).withAutoShimmer(loading: true),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                ).withFastShimmer(loading: true),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                ).withSlowShimmer(loading: true),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ).withCircularShimmer(loading: true),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(ShimmerAuto), findsNWidgets(4));
    });
  });

  group('ShimmerConfig Tests', () {
    test('should create config with default values', () {
      const config = ShimmerConfig();

      expect(config.duration, const Duration(milliseconds: 1500));
      expect(config.direction, ShimmerDirection.leftToRight);
      expect(config.autoDetectTheme, true);
      expect(config.borderRadius, 4.0);
      expect(config.opacity, 1.0);
    });

    test('should create config with custom values', () {
      const config = ShimmerConfig(
        baseColor: Colors.red,
        highlightColor: Colors.white,
        duration: Duration(milliseconds: 1000),
        direction: ShimmerDirection.rightToLeft,
        autoDetectTheme: false,
        borderRadius: 8.0,
        opacity: 0.5,
      );

      expect(config.baseColor, Colors.red);
      expect(config.highlightColor, Colors.white);
      expect(config.duration, const Duration(milliseconds: 1000));
      expect(config.direction, ShimmerDirection.rightToLeft);
      expect(config.autoDetectTheme, false);
      expect(config.borderRadius, 8.0);
      expect(config.opacity, 0.5);
    });

    test('should copy config with overridden values', () {
      const config = ShimmerConfig(
        duration: Duration(milliseconds: 1000),
        borderRadius: 4.0,
      );

      final newConfig = config.copyWith(
        duration: const Duration(milliseconds: 2000),
        borderRadius: 8.0,
      );

      expect(newConfig.duration, const Duration(milliseconds: 2000));
      expect(newConfig.borderRadius, 8.0);
    });

    testWidgets('should auto-detect theme colors', (WidgetTester tester) async {
      const config = ShimmerConfig();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.light),
          home: Builder(
            builder: (context) {
              final baseColor = config.getBaseColor(context);
              final highlightColor = config.getHighlightColor(context);

              expect(baseColor, isNotNull);
              expect(highlightColor, isNotNull);

              return Container();
            },
          ),
        ),
      );
    });
  });

  group('Widget Extension Tests', () {
    testWidgets('withAutoShimmer should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Container().withAutoShimmer(loading: true)),
      );

      expect(find.byType(ShimmerAuto), findsOneWidget);
    });

    testWidgets('withShimmer should work with custom config', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Container().withShimmer(
            loading: true,
            baseColor: Colors.red,
            highlightColor: Colors.white,
            duration: const Duration(milliseconds: 1000),
            direction: ShimmerDirection.topToBottom,
          ),
        ),
      );

      expect(find.byType(ShimmerAuto), findsOneWidget);
    });

    testWidgets('withCircularShimmer should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Container().withCircularShimmer(loading: true)),
      );

      expect(find.byType(ShimmerAuto), findsOneWidget);
    });

    testWidgets('withFastShimmer should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Container().withFastShimmer(loading: true)),
      );

      expect(find.byType(ShimmerAuto), findsOneWidget);
    });

    testWidgets('withSlowShimmer should work', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Container().withSlowShimmer(loading: true)),
      );

      expect(find.byType(ShimmerAuto), findsOneWidget);
    });
  });
}
