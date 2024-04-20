import 'package:flutter/material.dart';
import 'chart.dart';
import 'predictor.dart';
import 'data.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Predictor _predictor = Predictor();
  Map<DateTime, double> _actualSales = {};
  List<double> _forecastedSales = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initSalesData();
  }

  Future<void> _initSalesData() async {
    await _predictor.loadModel();
    _actualSales = SalesDataGenerator().generateActualSales();
    _forecastedSales = List.generate(
      _actualSales.length,
      (index) => _actualSales.values.elementAt(index) * Random().nextDouble(),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Forecast'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SalesChart(
              actualSales: _actualSales.values.toList(),
              forecastedSales: _forecastedSales,
            ),
    );
  }
}
