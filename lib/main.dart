import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedContainer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const ExpandableCardPage(),
    );
  }
}


// Expand/collapse motion is handled by AnimatedContainer.
class ExpandableCardPage extends StatefulWidget {
  const ExpandableCardPage({super.key});

  @override
  State<ExpandableCardPage> createState() => _ExpandableCardPageState();
}

class _ExpandableCardPageState extends State<ExpandableCardPage> {
  // collapsed vs expanded state
  bool _expanded = false;

  // how long the size/colour change takes
  Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tap the card to toggle the animation.
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: AnimatedContainer(
                // controlled by the slider below
                duration: _duration,
                // animated properties — tweened on each setState
                width: _expanded ? 320 : 200,
                height: _expanded ? 260 : 120,
                decoration: BoxDecoration(
                  color: _expanded ? Colors.indigo : Colors.indigo.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  _expanded ? 'Tap to collapse' : 'Tap to expand',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildDurationControl(),
          ],
        ),
      ),
    );
  }

  // slider to change the duration live
  Widget _buildDurationControl() {
    return Column(
      children: [
        Text('duration: ${_duration.inMilliseconds} ms'),
        Slider(
          min: 100,
          max: 2000,
          divisions: 19,
          value: _duration.inMilliseconds.toDouble(),
          onChanged: (v) =>
              setState(() => _duration = Duration(milliseconds: v.round())),
        ),
      ],
    );
  }
}
