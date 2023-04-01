// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:anime_list_app/ui/widget/my_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anime_list_app/main.dart';

void main() {
  testWidgets('Search anime bleach', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 2));

    // Tap the star icon and enter text in form field.
    await tester.enterText(find.byType(TextFormField), 'Bleach');
    await tester.pump(const Duration(seconds: 2));

    // Function search animes in api
    final iconFinder = find.byIcon(Icons.search);
    await tester.tap(iconFinder);
    await tester.pump(const Duration(seconds: 5));

    //Verify that exist home card widget
    final typeFinder = find.byType(MyLoader, skipOffstage: false);
    expect(typeFinder.first, findsOneWidget);
  });
}
