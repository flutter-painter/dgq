import 'package:dgq/models/album.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () {
    final String s = AlbumName.BRIC_A_BRAC.toCleanString();
    print(s);
    expect(s, 'bric_a_brac');
  });
}
