import 'package:flutter_test/flutter_test.dart';
import 'package:adhkars_app/main.dart';

void main() {
  testWidgets('Home screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AdhkarsApp());

    // Verify that our home screen shows 'Adhkars' text.
    expect(find.text('Adhkars'), findsOneWidget);
    expect(find.text('Adhkār du Matin'), findsOneWidget);
  });
}
