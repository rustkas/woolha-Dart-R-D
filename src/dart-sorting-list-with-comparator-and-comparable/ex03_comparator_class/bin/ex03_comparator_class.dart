void main() {
  final item = Item(id: 1, name: 'Item one', price: 1000);
  final item2 = Item(id: 2, name: 'Item two', price: 2000);
  final item3 = Item(id: 3, name: 'Item three', price: 500);
  final item4 = Item(id: 4, name: 'Item four', price: 1500);
  final items = <Item>[item, item2, item3, item4];

  Comparator<Item> priceComparator;
  priceComparator = (a, b) => a.price.compareTo(b.price);

  items.sort(priceComparator);
  items.forEach((Item item) {
    print('${item.id} - ${item.name} - ${item.price}');
  });
}

class Item {
  int id;
  String name;
  int price;

  Item({this.id, this.name, this.price});
}
