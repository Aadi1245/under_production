import '../app_assets.dart';

class Product {
  String? title;
  String? url;
  String? image; // Added Image
  double? price; // Added Price

  Product({
    this.title,
    this.url,
    this.image,
    this.price,
  });

  get copyWith => null;

  static List<Product> getSampleProducts() {
    return List.generate(
        20,
        (index) => Product(
              title: "product 1",
              image: 'assets/images/applogo.jpg',
              price: 29.99 + index,
            ));
  }

  static Product fromGraphJson(Map<String, dynamic> json) {
    return Product(
      title: json['node']?['title'] ?? '',
      url: json['node']?['url'] ?? '',
      image: json['node']?['image']?['src'] ?? '',
      price: double.tryParse(json['node']?['price']?.toString() ?? '0.0'),
    );
  }

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title = json['url'];
    image = json['image'] ?? "";
    price = double.tryParse(json['price']?.toString() ?? '0.0');
  }

  Map<String, dynamic> toJson() => {
        'title': '$title',
        'url': '$url',
        'image': '$image',
        'price': '$price',
      };

  factory Product.toJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0.0'),
    );
  }
}
