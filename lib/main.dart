// Import necessary packages
import 'package:flutter/material.dart';

// Define the main class of the app
class MyApp extends StatelessWidget {
  // Helps identify the widget uniquely
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // Set the app theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the initial screen of the app
      home: const MyHomePage(),
    );
  }
}

// Define the class for the initial screen
class MyHomePage extends StatefulWidget {
  // Helps identify the widget uniquely
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the initial screen of your app
  @override
  MyHomePageState createState() => MyHomePageState();
}

// Define the state of the initial screen
class MyHomePageState extends State<MyHomePage> {
  // Define values minimum e maximum
  static const int _minCounterValue = 0;
  static const int _maxCounterValue = 5;

  int _counter = 0;

  void _decrementCounter() {
    setState(() {
      if (_counter > _minCounterValue) {
        _counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < _maxCounterValue) {
        _counter++;
      }
    });
  }

  bool get _isAtMin => _counter == _minCounterValue;

  bool get _isAtMax => _counter == _maxCounterValue;

  // Define the interface of the initial screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display status message based on the counter value
            Text(
              _counter == 0
                  ? 'Minimum'
                  : _isAtMax
                      ? 'Maximum'
                      : 'Current',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                _counter.toString(),
                style: TextStyle(
                  fontSize: 60,
                  color: _isAtMax ? Colors.red : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // "Decrement" button with logic to disable when the counter is at its minimum
                TextButton(
                  onPressed: _isAtMin ? null : _decrementCounter,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        _isAtMin ? Colors.grey.withOpacity(0.1) : Colors.grey,
                    fixedSize: const Size(120, 120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  child: const Text(
                    'Decrement',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 70),
                // "Increment" button with logic to disable when the counter is at its maximum
                TextButton(
                  onPressed: _isAtMax ? null : _incrementCounter,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        _isAtMax ? Colors.grey.withOpacity(0.1) : Colors.grey,
                    fixedSize: const Size(120, 120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  child: const Text(
                    'Increment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Run the app
void main() {
  runApp(const MyApp());
}
