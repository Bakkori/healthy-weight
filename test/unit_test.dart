import 'package:flutter_test/flutter_test.dart';
import '../lib/screens/test_for.dart';

void main() {
  test('t1', () {
    Sum s = Sum();
    expect(s.getTest(2, 2), 4);
  });
}
