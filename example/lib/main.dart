import 'package:flutter/material.dart';
import 'package:flutter_dash_border_animated/flutter_dash_border_animated.dart';
import 'package:flutter_dash_border_animated/src/dash_border_run_type.dart';

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
      home: const MyHomePage(title: 'Flutter Dash Border Animated'),
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
            SizedBox(
              height: 50,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.red,
                child: Center(
                    child: Text(
                  'Just Run Rec',
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 90,
              width: 90,
              child: DashBorderAnimated(
                dashColor: Colors.blue,
                isPause: true,
                dashRunType: DashBorderRunType.rectangle,
                child: Center(
                    child: Text(
                  'Just pause',
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.yellow,
                dashRunType: DashBorderRunType.rectanglePip,
                child: Center(
                  child: Text(
                    'Rounded Run',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.green,
                dashRunType: DashBorderRunType.circle,
                child: Center(child: Text('Circle')),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
