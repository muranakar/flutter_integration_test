import 'package:flutter_test/flutter_test.dart';

class DummyApi {
  Future<String> fetchData() async {
    // ダミーのAPIレスポンスを返す
    await Future.delayed(const Duration(seconds: 1));
    return 'ダミーデータ';
  }
}

void main() {
  group('DummyApiのテスト', () {
    test('fetchDataが正しいデータを返すことを確認', () async {
      final api = DummyApi();

      // fetchDataを呼び出して結果を確認
      final result = await api.fetchData();

      expect(result, 'ダミーデータ');
    });
  });
}
