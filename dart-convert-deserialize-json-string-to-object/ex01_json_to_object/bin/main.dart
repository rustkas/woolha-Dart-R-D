import 'dart:convert' show json;

void main() {
  final text =
      '{"id": 1, "name": "Item 1", "price": 150.0, "stock": 10, "active": true}';
  final item = Item.fromJson(json.decode(text));
  print(item);
  assert(item.name == 'Item 1');
  assert(item.price == 150.0);
  assert(item.stock == 10);
  assert(item.active == true);
}

class Item {
  int id;
  String name;
  double price;
  int stock;
  bool active;

  Item({this.id, this.name, this.price, this.stock, this.active});

  factory Item.fromJson(Map<String, dynamic> json) => _itemFromJson(json);

  static Item _itemFromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      stock: json['stock'] as int,
      active: json['active'] as bool,
    );
  }

  @override
  String toString() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'active': active
    }.toString();
  }
}
