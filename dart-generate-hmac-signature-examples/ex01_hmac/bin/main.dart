import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  var key = utf8.encode('password1234');
  var bytes = utf8.encode('woolhadotcom');

  var hmacMd5;
  hmacMd5 = Hmac(md5, key);

  var hmacSha1;
  hmacSha1 = Hmac(sha1, key);

  var hmacSha224;
  hmacSha224 = Hmac(sha224, key);

  var hmacSha256;
  hmacSha256 = Hmac(sha256, key);

  var hmacSha384;
  hmacSha384 = Hmac(sha384, key);

  var hmacSha512;
  hmacSha512 = Hmac(sha512, key);

  Digest md5Result = hmacMd5.convert(bytes);
  Digest sha1Result = hmacSha1.convert(bytes);
  Digest sha224Result = hmacSha224.convert(bytes);
  Digest sha256Result = hmacSha256.convert(bytes);
  Digest sha384Result = hmacSha384.convert(bytes);
  Digest sha512Result = hmacSha512.convert(bytes);

  print('MD5: $md5Result');
  print('SHA1: $sha1Result');
  print('SHA224: $sha224Result');
  print('SHA256: $sha256Result');
  print('SHA384: $sha384Result');
  print('SHA512: $sha512Result');
}
