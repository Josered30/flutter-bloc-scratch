import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/pages/home.dart';
import 'package:flutter_bloc_pattern_scratch/route_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group("Login", () {
    MockNavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    Future<void> _buildMainPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          onGenerateRoute: RouterGenerator.generateRoute,
          navigatorObservers: [mockObserver],
          theme: ThemeData(
              primaryColor: Colors.black,
              accentColor: Colors.grey[900],
              brightness: Brightness.dark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              buttonColor: Colors.black),
        ),
      );

      verify(mockObserver.didPush(any, any));
    }

    Future<void> _navigateToHome(WidgetTester tester) async {
      expect(find.byKey(Key("Email field")), findsOneWidget);
      expect(find.byKey(Key("Password field")), findsOneWidget);
      expect(find.byKey(Key("Login buttom")), findsOneWidget);

      await tester.enterText(find.byKey(Key("Email field")), 'josered');
      await tester.enterText(find.byKey(Key("Password field")), '123');
      await tester.pump();

      await tester.tap(find.byKey(Key("Login buttom")));
      await tester.pumpAndSettle();
    }

    testWidgets('Login test', (WidgetTester tester) async {
      await _buildMainPage(tester);
      await _navigateToHome(tester);
    
      verify(mockObserver.didPush(any, any));
      tester.state(find.byType(Home));
    });
  });
}
