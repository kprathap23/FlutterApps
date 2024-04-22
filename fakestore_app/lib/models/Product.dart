class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({required this.id, required this.title, required this.description, required this.price, required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
    );
  }

  
}

 
 