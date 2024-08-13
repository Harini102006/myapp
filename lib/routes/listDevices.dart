// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListDevicesPage extends StatelessWidget {
  const ListDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('List of Devices'),
        
      ),
      body: const Center(
        child: Text('List of Devices'),
      ),
    );
  }
  }
