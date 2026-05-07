// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:somweb/main.dart';

void main() {
  testWidgets('App loads and shows home screen content', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SomWebPortfolio());

    // Verify that our main title or professional pillars text is present.
    expect(find.text('Professional Pillars'), findsOneWidget);
    expect(find.text('Academic Leadership'), findsOneWidget);
  });
}
