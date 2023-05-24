import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AirplaneModeScreen extends StatefulWidget {
  const AirplaneModeScreen({super.key});

  @override
  _AirplaneModeScreenState createState() => _AirplaneModeScreenState();
}

class _AirplaneModeScreenState extends State<AirplaneModeScreen> {
  bool isAirplaneModeEnabled = false;

  void toggleAirplaneMode() {
    setState(() {
      isAirplaneModeEnabled = !isAirplaneModeEnabled;
    });

    // Invoke the platform-specific method to toggle airplane mode
    const MethodChannel('your_channel_name')
        .invokeMethod('toggleAirplaneMode', isAirplaneModeEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airplane Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Airplane Mode',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              isAirplaneModeEnabled ? 'Enabled' : 'Disabled',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: toggleAirplaneMode,
              child: Text(
                isAirplaneModeEnabled ? 'Disable' : 'Enable',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
