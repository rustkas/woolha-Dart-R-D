void main() {
  {
    BigInt bi;
    bi = BigInt.parse('9223372036854775807');
    print(bi);
    bi = BigInt.parse('1000', radix: 2); // 8
    print(bi);
    bi = BigInt.parse('FF', radix: 16); // 255
    print(bi);
  }

  {
    BigInt bi1;
    bi1 = BigInt.parse('100000000000000000000000000000000'); // 10 pow 32
    BigInt bi2;
    bi2 = BigInt.parse('200000000000000000000000000000000'); // 2 * (10 pow 32)

    print(bi1 + bi2); // 3 * (10 pow 32)
    print(bi1 - bi2); // -10 pow 32
    print(bi1 * bi2); // 2 * (10 pow 64)
    print(bi1 / bi2); // 0.5
    print(bi1 << 1); // 2 * (10 pow 32)
    print(bi1 >> 1); // 5 * (10 pow 31)
    print(bi1 & bi2); // 16165108075998070557326583005184
    print(bi1 | bi2); // 283834891924001929442673416994816
    print(bi1 ^ bi2); // 267669783848003858885346833989632
    print(bi1.pow(100)); // 10 pow 3200
  }
}
