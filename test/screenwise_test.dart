import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screenwise/screenwise.dart';

void main() {
  testWidgets('ResponsiveRow builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ResponsiveRow(
            children: [
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(ResponsiveRow), findsOneWidget);
  });

  testWidgets('ResponsiveGrid builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ResponsiveGrid(
            children: [
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(ResponsiveGrid), findsOneWidget);
  });

  testWidgets('AdaptiveColumn builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AdaptiveColumn(
            children: [
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(AdaptiveColumn), findsOneWidget);
  });
}
