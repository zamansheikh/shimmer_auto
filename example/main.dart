import 'package:flutter/material.dart';
import 'package:shimmer_auto/shimmer_auto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Auto Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const ShimmerDemoPage(),
    );
  }
}

class ShimmerDemoPage extends StatefulWidget {
  const ShimmerDemoPage({super.key});

  @override
  State<ShimmerDemoPage> createState() => _ShimmerDemoPageState();
}

class _ShimmerDemoPageState extends State<ShimmerDemoPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Auto Demo'),
        actions: [
          IconButton(
            icon: Icon(isLoading ? Icons.pause : Icons.play_arrow),
            onPressed: toggleLoading,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example 1: Container with auto shimmer
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Container',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ).withAutoShimmer(loading: isLoading),

            const SizedBox(height: 16),

            // Example 2: SizedBox with shimmer
            SizedBox(
              width: 200,
              height: 50,
            ).withAutoShimmer(loading: isLoading),

            const SizedBox(height: 16),

            // Example 3: Text with shimmer
            const Text(
              'This is a text widget',
              style: TextStyle(fontSize: 16),
            ).withAutoShimmer(loading: isLoading),

            const SizedBox(height: 24),

            const Text(
              'Card Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example 4: Card with content
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                                width: double.infinity,
                                color: Colors.grey[300],
                              ).withAutoShimmer(loading: isLoading),
                              const SizedBox(height: 8),
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
                    const SizedBox(height: 16),
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey[200],
                    ).withAutoShimmer(loading: isLoading),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'List Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example 5: List items
            ...List.generate(3, (index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: const Text('Item Title'),
                  subtitle: const Text('Item subtitle'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ).withAutoShimmer(loading: isLoading),
              );
            }),

            const SizedBox(height: 24),

            const Text(
              'Custom Direction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example 6: Right to left shimmer
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Right to Left Shimmer',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ).withShimmer(
              loading: isLoading,
              direction: ShimmerDirection.rightToLeft,
            ),

            const SizedBox(height: 16),

            // Example 7: Top to bottom shimmer
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Top to Bottom Shimmer',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ).withShimmer(
              loading: isLoading,
              direction: ShimmerDirection.topToBottom,
            ),

            const SizedBox(height: 24),

            const Text(
              'Speed Variations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Example 8: Fast shimmer
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Fast Shimmer',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ).withFastShimmer(loading: isLoading),

            const SizedBox(height: 16),

            // Example 9: Slow shimmer
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Slow Shimmer',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ).withSlowShimmer(loading: isLoading),

            const SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleLoading,
        child: Icon(isLoading ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
