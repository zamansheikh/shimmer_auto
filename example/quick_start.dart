import 'package:flutter/material.dart';
import 'package:shimmer_auto/shimmer_auto.dart';

/// Quick Start Guide for Shimmer Auto Package
///
/// This file demonstrates the most common use cases

void main() {
  runApp(const QuickStartApp());
}

class QuickStartApp extends StatelessWidget {
  const QuickStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Auto Quick Start',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuickStartExamples(),
    );
  }
}

class QuickStartExamples extends StatefulWidget {
  const QuickStartExamples({super.key});

  @override
  State<QuickStartExamples> createState() => _QuickStartExamplesState();
}

class _QuickStartExamplesState extends State<QuickStartExamples> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Start Guide')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Example 1: Simple Container
          _buildSection(
            title: '1. Simple Container',
            description: 'Add shimmer to any Container with one line',
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
            ).withAutoShimmer(loading: isLoading),
          ),

          // Example 2: SizedBox
          _buildSection(
            title: '2. SizedBox',
            description: 'Works with SizedBox too',
            child: const SizedBox(
              width: 200,
              height: 50,
            ).withAutoShimmer(loading: isLoading),
          ),

          // Example 3: Text
          _buildSection(
            title: '3. Text Widget',
            description: 'Auto-detects text size',
            child: const Text(
              'Loading text...',
              style: TextStyle(fontSize: 18),
            ).withAutoShimmer(loading: isLoading),
          ),

          // Example 4: Circular Avatar
          _buildSection(
            title: '4. Circular Shimmer',
            description: 'Perfect for avatars',
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ).withCircularShimmer(loading: isLoading),
          ),

          // Example 5: Card Layout
          _buildSection(
            title: '5. Card with Profile',
            description: 'Complex layouts work too',
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ).withCircularShimmer(loading: isLoading),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 16,
                            color: Colors.grey[300],
                          ).withAutoShimmer(loading: isLoading),
                          const SizedBox(height: 8),
                          Container(
                            height: 12,
                            width: 100,
                            color: Colors.grey[300],
                          ).withAutoShimmer(loading: isLoading),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Example 6: Custom Configuration
          _buildSection(
            title: '6. Custom Colors',
            description: 'Override default colors',
            child:
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.orange,
                ).withShimmer(
                  loading: isLoading,
                  baseColor: Colors.orange[300],
                  highlightColor: Colors.orange[100],
                ),
          ),

          // Example 7: Different Direction
          _buildSection(
            title: '7. Different Direction',
            description: 'Top to bottom shimmer',
            child:
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.teal,
                ).withShimmer(
                  loading: isLoading,
                  direction: ShimmerDirection.topToBottom,
                ),
          ),

          // Example 8: Fast Shimmer
          _buildSection(
            title: '8. Fast Animation',
            description: 'Faster shimmer effect',
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.red,
            ).withFastShimmer(loading: isLoading),
          ),

          const SizedBox(height: 32),

          // Toggle Button
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
              },
              icon: Icon(isLoading ? Icons.pause : Icons.play_arrow),
              label: Text(isLoading ? 'Stop Loading' : 'Start Loading'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
