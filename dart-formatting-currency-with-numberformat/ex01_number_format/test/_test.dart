import 'package:test/test.dart';
import 'package:intl/intl.dart';

void main() {
  group('NumberFormat ', () {
    test('NumberFormat.currency().format(123456)', () {
      // A1
      expect(NumberFormat.currency().format(123456), 'USD123,456.00');
    });
    test("NumberFormat.currency(locale: 'eu').format(123456)", () {
      // A2
      expect(
          NumberFormat.currency(locale: 'eu')
              .format(123456)
              .replaceAll(RegExp(r'\s'), ' '),
          equals('123.456,00 EUR'));
    });
    test("NumberFormat.currency(name: 'EURO').format(123456)", () {
      // A3
      expect(
          NumberFormat.currency(name: 'EURO').format(123456), 'EURO123,456.00');
    });

    test("NumberFormat.currency(locale: 'eu', symbol: '?').format(123456)", () {
      // A4
      expect(
          NumberFormat.currency(locale: 'eu', symbol: '?')
              .format(123456)
              .replaceAll(RegExp(r'\s'), ' '),
          '123.456,00 ?');
    });

    test("NumberFormat.currency(locale: 'eu', decimalDigits: 3).format(123456)",
        () {
      // A5
      expect(
          NumberFormat.currency(locale: 'eu', decimalDigits: 3).format(123456),
          '123.456,000 EUR');
    });

    test(
        r"NumberFormat.currency(locale: 'eu', customPattern: '\u00a4 #,##.#').format(123456)",
        () {
      // A6
      expect(
          NumberFormat.currency(locale: 'eu', customPattern: '\u00a4 #,##.#')
              .format(123456),
          'EUR 12.34.56,00');
    });
  });

  group('NumberFormat ', () {
    test('NumberFormat.simpleCurrency().format(123456)', () {
      // # B1
      expect(NumberFormat.simpleCurrency().format(123456), r'$123,456.00');
    });

    test('NumberFormat.simpleCurrency().format(123456)', () {
      // # B2
      expect(
          NumberFormat.simpleCurrency(locale: 'eu')
              .format(123456)
              .replaceAll(RegExp(r'\s'), ' '),
          r'123.456,00 €');
    });
    test("NumberFormat.simpleCurrency(name: 'EURO').format(123456)", () {
      expect(NumberFormat.simpleCurrency(name: 'EURO').format(123456),
          'EURO123,456.00');
    });

    test(
        "NumberFormat.simpleCurrency(locale: 'eu', decimalDigits: 3).format(123456)",
        () {
      expect(
          NumberFormat.simpleCurrency(locale: 'eu', decimalDigits: 3)
              .format(123456)
              .replaceAll(RegExp(r'\s'), ' '),
          '123.456,000 €');
    });

    test('Ivalid arguments', () {
      expect(
          () => NumberFormat.simpleCurrency(locale: '1ru1', decimalDigits: 3),
          throwsA(isArgumentError));
    });
  });
}
