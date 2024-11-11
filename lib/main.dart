import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Click me link'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const platform = MethodChannel('flutterapp.tutorialspoint.com/browser');

  Future<void> _openBrowser() async {
    try {
      await platform.invokeMethod('openBrowser', <String, String>{
        'url': "https://flutter.dev"
      });
    } on PlatformException catch (e) {
      // Unable to open the browser
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openBrowser,
          child: Text('Pindutin mo ako please'),
        ),
      ),
    );
  }
}