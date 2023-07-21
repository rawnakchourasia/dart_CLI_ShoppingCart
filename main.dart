class Person {
  late String name;
  late int age;

  void introduce() {
    print("Hello, my name is $name and I'm $age years old.");
  }
}

void main() {
  var person = Person()
    ..name = 'John'
    ..age = 30
    ..introduce();
}
