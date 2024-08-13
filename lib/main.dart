import 'package:flutter/material.dart';
import 'package:myapp/routes/listDevices.dart';

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
        onPressed: () {
          // Add your Bluetooth controller logic here
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListDevicesPage()));
        },
        tooltip: 'Connect to Bluetooth',
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.bluetooth),
      ),
    );
  }
}
