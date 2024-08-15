import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ListDevicesPage extends StatefulWidget {
  const ListDevicesPage({super.key});

  @override
  State<ListDevicesPage> createState() => _ListDevicesPageState();
}

class _ListDevicesPageState extends State<ListDevicesPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  bool scanning = false;
  String deviceName = "";

  void startScan() {
    flutterBlue.startScan(
        scanMode: ScanMode.lowLatency, timeout: const Duration(seconds: 4));
    flutterBlue.scanResults.listen((devices) {
      for (ScanResult r in devices) {
        setState(() {
          deviceName = r.device.name.toString();
        });
      }
    });
  }

  void stopScan() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devices"),
        actions: [
          IconButton(
              onPressed: () {
                if (scanning == false) {
                  startScan();
                  setState(() {
                    scanning = true;
                  });
                } else {
                  stopScan();
                  setState(() {
                    scanning = false;
                  });
                }
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(deviceName),
      ),
    );
  }
}
