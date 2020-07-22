import 'dart:mirrors';

void main() {
  MyClass myClass;
  myClass = MyClass();
  InstanceMirror im;
  im = reflect(myClass);
  ClassMirror classMirror;
  classMirror = im.type;

  classMirror.metadata.forEach((metadata) {
    if (metadata.reflectee is Todo) {
      print(metadata.reflectee.name);

      print(metadata.reflectee.description);
    }
  });

  for (var v in classMirror.declarations.values) {
    if (v.metadata.isNotEmpty) {
      if (v.metadata.first.reflectee is Todo) {
        print(v.metadata.first.reflectee.name);

        print(v.metadata.first.reflectee.description);
      }
    }
  }
}

class Todo {
  final String name;
  final String description;

  const Todo(this.name, this.description);
}

@Todo('Chibi', 'Rename class')
class MyClass {
  @Todo('Tuwaise', 'Change fielld type')
  int value;

  @Todo('Anyone', 'Change format')
  void printValue() {
    print('value: $value');
  }

  @Todo('Anyone', 'Remove this')
  MyClass();
}
