import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 249, 178, 228)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  String result = "";

  void _calculate(String operation) {
    double num1 = double.tryParse(number1Controller.text) ?? 0;
    double num2 = double.tryParse(number2Controller.text) ?? 0;

    setState(() {
      if (operation == '+') {
        result = (num1 + num2).toString();
      } else if (operation == '-') {
        result = (num1 - num2).toString();
      } else if (operation == 'x') {
        result = (num1 * num2).toString();
      } else if (operation == ':') {
        if (num2 != 0) {
          result = (num1 / num2).toString();
        } else {
          result = "Error: Division by 0";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8BBD0), Color(0xFFCE93D8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Number 1', style: TextStyle(fontSize: 16)),
                      TextField(
                        controller: number1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Number 1',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Number 2', style: TextStyle(fontSize: 16)),
                      TextField(
                        controller: number2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Number 2',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _calculate('+'),
                    child: const Text('+'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate('-'),
                    child: const Text('-'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate('x'),
                    child: const Text('x'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(':'),
                    child: const Text(':'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 2),
              Text(
                'Result: $result',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
