import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de Temperatura',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const ConversorPage(),
    );
  }
}

class ConversorPage extends StatefulWidget {
  const ConversorPage({super.key});

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  final TextEditingController controller = TextEditingController();

  String resultado = "Digite uma temperatura";

  void converter() {
    if (controller.text.isEmpty) return;

    double fahrenheit = double.parse(controller.text);
    double celsius = (fahrenheit - 32) * 5 / 9;

    setState(() {
      resultado =
          "${fahrenheit.toStringAsFixed(1)} °F = ${celsius.toStringAsFixed(1)} °C";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      appBar: AppBar(
        title: const Text("Conversor de Temperatura"),
        centerTitle: true,
        backgroundColor: const Color(0xFFEC407A),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.thermostat,
                    color: Color(0xFFF48FB1),
                    size: 70,
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Temperatura em Fahrenheit",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.device_thermostat),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: converter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF8BBD0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Converter",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    resultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC407A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
