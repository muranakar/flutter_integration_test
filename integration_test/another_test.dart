import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_integration_test/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('別のエンドツーエンドテスト', () {
    testWidgets('カウンターが初期値であることを確認', (tester) async {
      await tester.pumpWidget(const MyApp());

      // 初期状態でカウンターが0であることを確認
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('カウンターを2回タップして値を検証', (tester) async {
      await tester.pumpWidget(const MyApp());

      // フローティングアクションボタンを探して2回タップ
      final fab = find.byKey(const Key('increment'));
      await tester.tap(fab);
      await tester.tap(fab);

      // フレームをトリガー
      await tester.pumpAndSettle();

      // カウンターが2に増加したことを確認
      expect(find.text('2'), findsOneWidget);
    });
  });
}
