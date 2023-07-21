# dart_CLI_ShoppingCart

Dart CLI Shopping Cart - With Explanation.

Explanation:

The code defines three classes: Product, Item, and Cart.
Product class represents a product with id, name, and price properties, and two computed properties displayName and initial.
Item class represents an item with a product and quantity property, and a computed property price.
Cart class represents a cart containing a collection of items and provides methods to add products, check if the cart is empty, calculate the total price, and give a formatted string representation of the cart.
A list of all available products, allProducts, is defined as constant.
The main function initializes an empty cart and runs a loop to interact with the user and manage the cart.
The user can choose to view the cart, add items to the cart, or checkout the cart for payment.
The chooseProduct function prompts the user to choose a product from the available products.
The checkout function simulates the payment process and calculates change, if applicable.
The program uses stdin to read user input and stdout to display output to the console.
The program allows the user to select actions using single-letter codes: 'v' for view cart, 'a' for add item, and 'c' for checkout. The user can select products to add to the cart by entering the initial character of the product name (e.g., 'a' for apples). The program keeps running until the user chooses to checkout the cart or exits the program manually. The final output shows the cart contents with the total price and change (if applicable) after payment.
