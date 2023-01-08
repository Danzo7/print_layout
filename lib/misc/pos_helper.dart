// Not used Can be deleted.
import 'dart:convert';
import 'dart:typed_data';

Uint8List utf8ToRaw(String text) {
  return Uint8List.fromList([
    ...[0x1C, 0x26, 0x1C, 0x43, 0xFF],
    ...utf8.encode(text)
  ]);
}
