import 'package:flutter/material.dart';
import 'package:flutter_ui_presenter/flutter_ui_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UIPresenter(
        templates: [
          Template(
            name: 'Template 1',
            builder: (context) => Template1(),
          ),
          Template(
            name: 'Template 2',
            builder: (context) => Template2(),
          ),
        ],
      ),
    );
  }
}

class Template1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template1'),
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}

class Template2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator.adaptive(),
            Switch.adaptive(
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
