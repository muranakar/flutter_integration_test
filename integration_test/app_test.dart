import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_integration_test/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E テスト', () {
    testWidgets('ボタンをタップし、カウンターを検証', (tester) async {
      await tester.pumpWidget(const MyApp());

      // 初期状態でカウンターが0であることを確認
      expect(find.text('0'), findsOneWidget);

      // フローティングアクションボタンを探してタップ
      final fab = find.byKey(const Key('increment'));
      await tester.tap(fab);

      // 画面のアニメーションや非同期処理が完了するまで待機するために使用されます。
      await tester.pumpAndSettle();

      // カウンターが1に増加したことを確認
      expect(find.text('1'), findsOneWidget);
    });
  });
}
