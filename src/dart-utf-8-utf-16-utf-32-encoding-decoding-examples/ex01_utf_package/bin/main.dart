import 'package:utf/utf.dart';

void main() {
  var text = 'woolha.com';

  var _8 = encodeUtf8(text);

  print('8: $_8');

  var _16 = encodeUtf16(text);
  var _16Le = encodeUtf16le(text);
  var _16LeBom = encodeUtf16le(text);

  print('16: $_16'); // Big Endian
  print('16LE: $_16Le'); // Little Endian
  print('16LE - BOM: $_16LeBom'); // Little Endian, writeBOM = true

  var _32 = encodeUtf32(text);
  var _32Le = encodeUtf32le(text);
  var _32LeBom = encodeUtf32le(text);

  print('32: $_32'); // Big Endian
  print('32LE: $_32Le'); // Little Endian
  print('32LE - BOM: $_32LeBom'); // Little Endian, writeBOM = true

  print('32: ${encodeUtf32(text)}'); // Big Endian
  print('32LE: ${encodeUtf32le(text)}'); // Little Endian
  print(
      '32LE - BOM: ${encodeUtf32le(text, true)}'); // Little Endian, writeBOM = true

  print('8 - value: ${decodeUtf8(_8)}');

  print('16 - value: ${decodeUtf16(_16)}');
  print('16LE - value: ${decodeUtf16le(_16Le)}');
  print('16LE - BOM - value: ${decodeUtf16le(_16LeBom)}');

  print('32 - value: ${decodeUtf32(_32)}');
  print('32LE - value: ${decodeUtf32le(_32Le)}');
  print('32LE - BOM - value: ${decodeUtf32le(_32LeBom)}');
}
