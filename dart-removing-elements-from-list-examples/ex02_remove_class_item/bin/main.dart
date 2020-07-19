import 'package:ex02_remove_class_item/person.dart';

void main() {
  final person1 = Person(id: 1, name: 'Name one');
  final person2 = Person(id: 2, name: 'Name two');
  final person3 = Person(id: 1, name: 'Name one');
  final people = [person1, person2, person3];
  people.remove(person3);

  people.forEach((Person person) {
    print('${person.id} - ${person.name}');
  });
}
