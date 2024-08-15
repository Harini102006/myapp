import 'package:flutter/material.dart';
import 'package:all_bluetooth/all_bluetooth.dart';

class ListDevicesPage extends StatefulWidget {
  const ListDevicesPage({Key? key}) : super(key: key);

  @override
  State<ListDevicesPage> createState() => _ListDevicesPageState();
}

class _ListDevicesPageState extends State<ListDevicesPage> {
  final AllBluetooth bluetooth = AllBluetooth();
  List<BluetoothDevice> devicesList = [];

  // SnackBar for general notifications
  SnackBar _buildSnackBar(String message,
      {Color backgroundColor = Colors.blueAccent}) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  void initState() {
    super.initState();
    startScan();
  }

  @override
  void dispose() {
    bluetooth.stopDiscovery(); // Stop discovery when leaving the page
    super.dispose();
  }

  void startScan() {
    // Listen for device discoveries
    bluetooth.discoverDevices.listen((device) {
      if (!devicesList.contains(device)) {
        setState(() {
          devicesList.add(device);
          ScaffoldMessenger.of(context).showSnackBar(
            _buildSnackBar(
                'Device Found: ${device.name.isEmpty ? '(Unknown Device)' : device.name}'),
          );
        });
      }
    }).onError((error) {
      // Show error message in SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        _buildSnackBar('Error discovering devices: ${error.toString()}',
            backgroundColor: Colors.red),
      );
    });

    // Start discovery process
    bluetooth.startDiscovery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Devices'),
      ),
      body: devicesList.isEmpty
          ? const Center(
              child: Text(
                'No devices found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: devicesList.length,
              itemBuilder: (context, index) {
                BluetoothDevice device = devicesList[index];
                return ListTile(
                  title: Text(
                      device.name.isEmpty ? '(Unknown Device)' : device.name),
                  subtitle: Text(device.address.toString()),
                );
              },
            ),
    );
  }
}
