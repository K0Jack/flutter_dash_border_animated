import 'package:flutter/material.dart';
import 'package:flutter_dash_border_animated/flutter_dash_border_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DashBorderAnimated(
              dashColor: Colors.red,
              height: 20,
              width: 50,
            ),
            SizedBox(height: 20),
            DashBorderAnimated(
              dashColor: Colors.yellow,
              height: 20,
              width: 50,
            ),
            SizedBox(height: 20),
            DashBorderAnimated(
              dashColor: Colors.green,
              height: 20,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
