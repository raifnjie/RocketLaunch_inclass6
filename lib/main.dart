import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // set counter value
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16),
              child: Text(
                '$_counter',
                style: const TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              setState(() {
                if (_counter <100){
                  _counter++;
                }
              });
            },
            child: const Text('Ignite'),
          ),
        ],
      ),
    );
  }
}