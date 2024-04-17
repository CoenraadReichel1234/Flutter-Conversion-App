import 'package:flutter/material.dart';

class volumeConvert extends StatelessWidget {
  const volumeConvert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume/Fluids Converter',
      home: volumeConverter(),
    );
  }
}

class volumeConverter extends StatefulWidget {
  const volumeConverter({Key? key}) : super(key: key);

  @override
  _volumeConverterState createState() => _volumeConverterState();
}

class _volumeConverterState extends State<volumeConverter> {
  String dropdownValue = 'L to ML';
  double result = 0.0;
  double input = 0.0;

  void convert() {
    double convertedValue;
    if (dropdownValue == 'L to ML') {
      convertedValue = input * 1000;
    } else if (dropdownValue == 'ML to L') {
      convertedValue = input / 1000;
    } else {
      // Handle any other conversion types here
      convertedValue = 0.0;
    }

    setState(() {
      result = convertedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Volume Conversion',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    dropdownValue = newValue;
                  }
                });
              },
              items: <String>[
                'L to ML',
                'ML to L',
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                input = double.tryParse(value) ?? 0.0;
              },
              decoration: InputDecoration(
                labelText: 'Enter value',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                'Result: ${result.toStringAsFixed(2)}'),
          ],
        ),
      ),
      backgroundColor: Colors.green[900],
    );
  }
}
