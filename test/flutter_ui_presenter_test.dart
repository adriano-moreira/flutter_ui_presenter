import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_presenter/flutter_ui_presenter.dart';

void main() {
  testWidgets('DevFrame', (tester) async {
    await tester.pumpWidget(
      const DevFrame(
        app: Scaffold(
          body: Center(
            child: Text('bar'),
          ),
        ),
      ),
    );
    expect(find.text('foo'), findsNothing);
    expect(find.text('bar'), findsWidgets);
  });
}
