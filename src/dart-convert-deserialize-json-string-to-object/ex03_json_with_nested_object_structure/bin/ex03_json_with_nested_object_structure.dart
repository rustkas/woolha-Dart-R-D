import 'dart:convert' show json;

void main() {
  final text = '''
  {  
     "id":1,
     "name":"Item 1",
     "price":100.0,
     "stock":10,
     "active":true,
     "locations":["a", "b", "c"],
     "dimensions":{  
        "width":100.5,
        "depth":201.1,
        "height":50.1
     }
  }
''';
  Map<String, dynamic> jsonData;
  jsonData = json.decode(text);
  final item = Item.fromJson(jsonData);
  print(item);
  assert(item.name == 'Item 1');
  assert(item.price == 100.0);
  assert(item.stock == 10);
  assert(item.active == true);
  assert(item.locations.toString() == ['a', 'b', 'c'].toString());
  assert(item.dimensions.hashCode ==
      Dimensions(width: 100.5, depth: 201.1, height: 50.1).hashCode);
}

class Item {
  int id;
  String name;
  double price;
  int stock;
  bool active;
  List<String> locations;
  Dimensions dimensions;
  Item(
      {this.id,
      this.name,
      this.price,
      this.stock,
      this.active,
      this.locations,
      this.dimensions});

  factory Item.fromJson(Map<String, dynamic> json) => _itemFromJson(json);

  static Item _itemFromJson(Map<String, dynamic> json) {
    final locationsJson = json['locations'];

    final locations =
        locationsJson != null ? List<String>.from(locationsJson) : null;
    final dimensionsJson = json['dimensions'];
    final dimensions =
        dimensionsJson != null ? Dimensions.fromJson(dimensionsJson) : null;
    return Item(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        stock: json['stock'] as int,
        active: json['active'] as bool,
        locations: locations,
        dimensions: dimensions);
  }

  @override
  String toString() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'active': active,
      'locations': locations,
      'dimensions': dimensions
    }.toString();
  }
}

class Dimensions {
  double width;
  double depth;
  double height;
  Dimensions({this.width, this.depth, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _dimensionsFromJson(json);

  static Dimensions _dimensionsFromJson(Map<String, dynamic> json) =>
      Dimensions(
          width: json['width'] as double,
          depth: json['depth'] as double,
          height: json['height'] as double);

  @override
  String toString() {
    return {'widht': width, 'depth': depth, 'height': height}.toString();
  }

  @override
  int get hashCode => (width + height + depth).hashCode;
}
