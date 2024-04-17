import 'package:flutter/material.dart';

class lengthConvert extends StatelessWidget {
  const lengthConvert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Length Converter',
      home: LengthConverter(),
    );
  }
}

class LengthConverter extends StatefulWidget {
  const LengthConverter({Key? key}) : super(key: key);

  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  String dropdownValue = 'Mile to km';
  double result = 0.0;
  double input = 0.0;

  void convert() {
    double convertedValue;
    if (dropdownValue == 'Mile to km') {
      // 1 mile = 1.60934 km
      convertedValue = input * 1.60934;
    } else if (dropdownValue == 'Km to mile') {
      convertedValue = input * 0.621371;
    } else if (dropdownValue == 'Inch to cm') {
      convertedValue = input * 2.54;
    } else if (dropdownValue == 'Cm to inch') {
      convertedValue = input * 0.393701;
    } else if (dropdownValue == 'mm to cm') {
      convertedValue = input * 0.1;
    } else if (dropdownValue == 'Cm to mm') {
      convertedValue = input * 10;
    } else if (dropdownValue == 'Cm to M') {
      convertedValue = input / 100;
    } else if (dropdownValue == 'M to Cm') {
      convertedValue = input * 100;
    } else if (dropdownValue == 'M to inch') {
      convertedValue = input * 39.3701;
    } else if (dropdownValue == 'Inch to M') {
      convertedValue = input / 39.3701;
    } else if (dropdownValue == 'M to Foot') {
      convertedValue = input * 3.28084;
    } else if (dropdownValue == 'Foot to M') {
      convertedValue = input / 3.28084;
    } else if (dropdownValue == 'Km to feet') {
      convertedValue = input * 3280.84;
    } else if (dropdownValue == 'Feet to Km') {
      convertedValue = input / 3280.84;
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
          'Length Conversion',
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
                'Mile to km',
                'Km to mile',
                'Inch to cm',
                'Cm to inch',
                'mm to cm',
                'Cm to mm',
                'M to Cm',
                'Cm to M',
                'M to inch',
                'Inch to M',
                'M to foot',
                'Foot to M',
                'Km to feet',
                'Feet to Km',
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
