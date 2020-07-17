import 'dart:convert' show json;

void main() {
  final text =
      '{"id": 1, "name": "Item 1", "price": 100.0, "stock": 10, "active": true, "locations":["a", "b", "c"]}';
  Map<String, dynamic> jsonData;
  jsonData = json.decode(text);
  final item = Item.fromJson(jsonData);
  print(item);
  assert(item.name == 'Item 1');
  assert(item.price == 100.0);
  assert(item.stock == 10);
  assert(item.active == true);
  assert(item.locations.toString() == ['a', 'b', 'c'].toString());
}

class Item {
  int id;
  String name;
  double price;
  int stock;
  bool active;
  List<String> locations;
  Item(
      {this.id,
      this.name,
      this.price,
      this.stock,
      this.active,
      this.locations});

  factory Item.fromJson(Map<String, dynamic> json) => _itemFromJson(json);

  static Item _itemFromJson(Map<String, dynamic> json) {
    final locationsJson = json['locations'];

    final locations =
        locationsJson != null ? List<String>.from(locationsJson) : null;
    return Item(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        stock: json['stock'] as int,
        active: json['active'] as bool,
        locations: locations);
  }

  @override
  String toString() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'active': active,
      'locations': locations
    }.toString();
  }
}
