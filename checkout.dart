import 'dart:io';

// Defining the Product class with required properties.
class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  // Computed property to get the display name of
  // the product with the initial in parentheses.
  String get displayName => '($initial)${name.substring(1)}: \$$price';

  // Computed property to get the initial character of the product name.
  String get initial => name.substring(0, 1);
}

// Defining the Item class with required properties.
class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  // Computed property to get the total price of the item.
  double get price => quantity * product.price;

  // Overriding the toString() method to provide a
  // formatted string representation of the item.
  @override
  String toString() => '$quantity x ${product.name} : \$$price';
}

// Defining the Cart class to manage a collection of items.
class Cart {
  final Map<int, Item> _items = {};

  // Method to add a product to the cart.
  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  // Getter to check if the cart is empty.
  bool get isEmpty => _items.isEmpty;

  // Method to calculate the total price of all items in the cart.
  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  // Overriding the toString() method to provide a
  // formatted string representation of the cart.
  @override
  String toString() {
    if (_items.isEmpty) {
      return ('Cart is Empty');
    }

    final itemizedList = _items.values.map((e) => e.toString()).join('\n');
    return '--------\n$itemizedList\nTotal:\$${total()}\n--------';
  }
}

// A list of all available products.
const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];

// The main function to run the cart management program.
void main() {
  final cart = Cart();

  while (true) {
    // Asking the user to select an action (view cart, add item, checkout cart).
    stdout.write('Select an action :(v)iew cart, (a)dd item, (c)heckout cart ');
    final line = stdin.readLineSync();

    // Handling user input based on selected action.
    if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'v') {
      print(cart);
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

// Method to prompt the user to choose a product
// from the available products list.
Product? chooseProduct() {
  final productsList =
      allProducts.map((product) => product.displayName).join('\n');
  stdout.write('Available Products:\n$productsList\nYour Choice: ');
  final line = stdin.readLineSync();

  // Matching user input with the initial of the product's name.
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }

  print('Not Found');
  return null;
}

// Method to simulate the checkout process, including payment handling.
bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('Cart is Empty');
    return false;
  }

  final total = cart.total();
  print('Total: \$$total');
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();

  if (line == null || line.isEmpty) {
    return false;
  }

  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }

  if (paid >= total) {
    final change = paid - total;
    print('Change: \$${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash.');
    return false;
  }
}
