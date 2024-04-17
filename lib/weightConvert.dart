import 'package:flutter/material.dart';

class weightConvert extends StatelessWidget {
  const weightConvert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weight Converter',
      home: WeightConverter(),
    );
  }
}

class WeightConverter extends StatefulWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  _WeightConverterState createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  String DropdownValue = 'Kg to gram';
  double result = 0.0;
  double input = 0.0;

  void convert() {
    double ConvertedValue;
    if (DropdownValue == 'Kg to gram') {
      ConvertedValue = input * 1000;
    } else if (DropdownValue == 'Gram to Kg') {
      ConvertedValue = input * 0.001;
    } else if (DropdownValue == 'Kg to Ton') {
      ConvertedValue = input * 0.001;
    } else if (DropdownValue == 'Ton to Kg') {
      ConvertedValue = input * 1000;
    } else if (DropdownValue == 'lbs to Kg') {
      ConvertedValue = input * 0.4536;
    } else if (DropdownValue == 'Kg to lbs') {
      ConvertedValue = input * 2.2046;
    } else if (DropdownValue == 'Kg to ounces') {
      ConvertedValue = input * 35.274;
    } else if (DropdownValue == 'Ounces to Kg') {
      ConvertedValue = input * 0.02835;
    } else if (DropdownValue == 'Gram to ounces') {
      ConvertedValue = input * 0.03527;
    } else if (DropdownValue == 'Ounces to Gram') {
      ConvertedValue = input * 28.35;
    } else if (DropdownValue == 'lbs to gram') {
      ConvertedValue = input * 453.59;
    } else if (DropdownValue == 'Gram to lbs') {
      ConvertedValue = input * 0.0022;
    } else {
      // Handle any other conversion types here
      ConvertedValue = 0.0;
    }

    setState(() {
      result = ConvertedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weight Conversion',
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
              value: DropdownValue,
              onChanged: (String? NewValue) {
                setState(() {
                  if (NewValue != null) {
                    DropdownValue = NewValue;
                  }
                });
              },
              items: <String>[
                'Kg to gram',
                'Gram to Kg',
                'Kg to Ton',
                'Ton to Kg',
                'lbs to Kg',
                'Kg to lbs',
                'Kg to ounces',
                'Ounces to Kg',
                'Gram to ounces',
                'ounces to Gram',
                'lbs to gram',
                'Gram to lbs',
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
