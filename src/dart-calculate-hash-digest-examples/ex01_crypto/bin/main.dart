import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  var bytes = utf8.encode('woolhadotcom');
  Digest md5Result;
  md5Result = md5.convert(bytes);

  Digest sha1Result;
  sha1Result = sha1.convert(bytes);

  Digest sha224Result;
  sha224Result = sha224.convert(bytes);

  Digest sha256Result;
  sha256Result = sha256.convert(bytes);

  Digest sha384Result;
  sha384Result = sha384.convert(bytes);

  Digest sha512Result;
  sha512Result = sha512.convert(bytes);

  print('MD5: $md5Result');
  print('SHA1: $sha1Result');
  print('SHA224: $sha224Result');
  print('SHA256: $sha256Result');
  print('SHA384: $sha384Result');
  print('SHA512: $sha512Result');
  print('SHA1 Digest bytes: ${sha1Result.bytes}');
}
