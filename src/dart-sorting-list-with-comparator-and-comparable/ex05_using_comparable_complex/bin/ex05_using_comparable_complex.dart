void main() {
  final item = Item(id: 1, name: 'Item one', price: 1000);
  final item2 = Item(id: 2, name: 'Item two', price: 2000);
  final item3 = Item(id: 3, name: 'Item three', price: 500);
  final item4 = Item(id: 4, name: 'Item four', price: 1000);
  final items = <Item>[item, item2, item3, item4];

  items.sort();
  items.forEach((Item item) {
    print('${item.id} - ${item.name} - ${item.price}');
  });
}

class Item implements Comparable<Item> {
  int id;
  String name;
  int price;

  Item({
    this.id,
    this.name,
    this.price,
  });

  @override
  int compareTo(Item other) {
    final priceDiference = price - other.price;
    return priceDiference != 0 ? priceDiference : name.compareTo(other.name);
  }
}
