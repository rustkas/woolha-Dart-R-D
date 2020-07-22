void main() {
  final s = 'woolha';

  // A1
  print(s.padLeft(10)); // '    woolha'

  // A2
  print(s.padLeft(10, '.')); // '....woolha'

  // A3
  print(s.padLeft(10, ',.*')); // ',.*,.*,.*,.*woolha'

  // A4
  print(s.padLeft(3, '.')); // 'woolha'

  print(s.padRight(10));  // 'woolha    '
	print(s.padRight(10, '.')); // 'woolha....' 
	print(s.padRight(10, ',.*')); // 'woolha,.*,.*,.*,.*'
	print(s.padRight(3, '.')); // 'woolha'

  	
  String x;
	print(x?.padLeft(10, '.'));
}
