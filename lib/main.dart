import 'package:flutter/material.dart';
import 'package:myapp/routes/listDevices.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(const BluetoothControllerApp());
}

//root widget
class BluetoothControllerApp extends StatefulWidget {
  const BluetoothControllerApp({super.key});

  @override
  State<BluetoothControllerApp> createState() => _BluetoothControllerAppState();
}

class _BluetoothControllerAppState extends State<BluetoothControllerApp> {
  @override
  void initState() {
    super.initState();
    _requestBluetoothPermissions();
  }

  Future<void> _requestBluetoothPermissions() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.bluetoothAdvertise.request().isGranted) {
      // Bluetooth permissions granted, proceed with your app logic
    } else {
      // Handle the case when permissions are denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.cyan, // Set the AppBar color here
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const BluetoothControllerPage(),
    );
  }
}

class BluetoothControllerPage extends StatelessWidget {
  const BluetoothControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home Controller'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bluetooth)),
            )
          ]),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? bluetoothCheck = await _requestEnableBluetooth();
          // Add your Bluetooth controller logic here
          if (bluetoothCheck == true) {
            Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                    builder: (context) => const ListDevicesPage()));
          } else {
            final snackBar = SnackBar(
              content: const Text(
                'Custom SnackBar',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: 'Dismiss',
                textColor: Colors.yellow,
                onPressed: () {
                  // Code to execute when action is pressed
                },
              ),
            );

            // Show the custom SnackBar
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        tooltip: 'Connect to Bluetooth',
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.bluetooth),
      ),
    );
  }
}

Future<bool?> _requestEnableBluetooth() async {
  // Request to enable Bluetooth
  bool? enableBluetooth = await FlutterBluetoothSerial.instance.requestEnable();
  return enableBluetooth;
}
