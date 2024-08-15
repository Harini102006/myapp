// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ListDevicesPage extends StatefulWidget {
  const ListDevicesPage({super.key});

  @override
  State<ListDevicesPage> createState() => _ListDevicesPageState();
}

class _ListDevicesPageState extends State<ListDevicesPage> {

  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = [];

  @override
  void initState() {
    super.initState();

    // Listen for scan results
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });

    // Start scanning
    flutterBlue.startScan();
  }

   _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('List of Devices'),
        
      ),
      body: ListView.builder(
        itemCount: devicesList.length,
        itemBuilder: (context, index) {
          final device = devicesList[index];
          return ListTile(
            title: Text(device.name.isEmpty ? '(Unknown Device)' : device.name),
            subtitle: Text(device.id.toString()),
          );
        }
    )
    );
  }
}
