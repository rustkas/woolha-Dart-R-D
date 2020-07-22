void main() {
  Circle circle;
  circle = Circle(color: 'red', radius: 10);
  print(circle is Circle); // true
  print(circle is Shape); // true
  print(circle is Rectangle); // false
}

class Shape {
  String color;

  Shape({this.color});
}

class Circle extends Shape {
  double radius;

  Circle({color, this.radius}) : super(color: color);
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle({color, this.length, this.width}) : super(color: color);
}
