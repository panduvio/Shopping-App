class ProductEntity {
  late int id;
  late String title;
  late String description;
  late String category;
  late String image;
  late double price;
  late double rate;
  late int count;
  late int quantity;
  late bool isAdded;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rate,
    required this.count,
    this.quantity = 1,
    this.isAdded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'rate': rate,
      'count': count,
    };
  }

  ProductEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    category = map['category'];
    image = map['image'];
    price = (map['price'] as num).toDouble();
    rate = (map['rating']['rate'] as num).toDouble();
    count = map['rating']['count'];
    quantity = 1;
    isAdded = false;
  }
}
