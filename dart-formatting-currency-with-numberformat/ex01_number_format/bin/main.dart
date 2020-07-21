import 'package:intl/intl.dart';

void main() {
  // A1
  print(NumberFormat.currency().format(123456)); // USD123,456.00

  // A2
  print(NumberFormat.currency(locale: 'eu').format(123456)); // 123.456,00 EUR

  // A3
  print(NumberFormat.currency(name: 'EURO').format(123456)); // EURO123,456.00

  // A4
  print(NumberFormat.currency(locale: 'eu', symbol: '?')
      .format(123456)); // 123.456,00 ?

  // A5
  print(NumberFormat.currency(locale: 'eu', decimalDigits: 3)
      .format(123456)); // 123.456,000 EUR

  // A6
  print(NumberFormat.currency(locale: 'eu', customPattern: '\u00a4 #,##.#')
      .format(123456)); // EUR 12.34.56,00

  // # B1
  print(NumberFormat.simpleCurrency().format(123456)); // $123,456.00

  // # B2
  print(
      NumberFormat.simpleCurrency(locale: 'eu').format(123456)); // 123.456,00 €

  //# B3
  print(NumberFormat.simpleCurrency(name: 'EURO')
      .format(123456)); // EURO123,456.00

  //# B4
  print(NumberFormat.simpleCurrency(locale: 'eu', decimalDigits: 3)
      .format(123456)); // 123.456,000 €

  print(NumberFormat.simpleCurrency(locale: 'ru', decimalDigits: 3)
      .format(123456)); // 123 456,000 руб.
  try {
    print(NumberFormat.simpleCurrency(locale: '1ru1', decimalDigits: 3)
  .format(123456)); // 123 456,000 руб.
  } on ArgumentError {
    print('Invalid agruments');
  }
  
}
