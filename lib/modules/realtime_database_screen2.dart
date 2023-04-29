import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealTimeDataScreen extends StatefulWidget {
  @override
  _RealTimeDataScreenState createState() => _RealTimeDataScreenState();
}

class _RealTimeDataScreenState extends State<RealTimeDataScreen> {
  final databaseReference =
  FirebaseDatabase.instance.reference().child('sensorData');

  String sensorData = '';

  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((event) {
      setState(() {
        sensorData = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Sensor Data'),
      ),
      body: Center(
        child: Text(
          'Sensor Data: $sensorData',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}