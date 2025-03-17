import '../app_assets.dart';

class Product {
  String? title;
  String? id;
  bool? availableForSale;
  String? createdAt;
  String? productType;
  String? publishedAt;
  List<String>? tags;
  String? updatedAt;
  String? vendor;
  String? cursor;
  String? onlineStoreUrl;
  String? description;
  String? descriptionHtml;
  String? handle;
  String? image; // Added Image
  double? price; // Added Price

  Product({
    this.title,
    this.id,
    this.availableForSale,
    this.createdAt,
    this.productType,
    this.publishedAt,
    this.tags,
    this.updatedAt,
    this.cursor,
    this.onlineStoreUrl,
    this.description,
    this.descriptionHtml,
    this.handle,
    this.image,
    this.price,
  });

  get copyWith => null;

  static List<Product> getSampleProducts() {
    return List.generate(
        20,
        (index) => Product(
              id: 'prod_$index',
              title: 'Product $index',
              availableForSale: true,
              createdAt: '2025-01-01',
              description: 'Description for Product $index',
              descriptionHtml: '<p>Description for Product $index</p>',
              handle: 'product-$index',
              onlineStoreUrl: 'https://example.com/product-$index',
              productType: 'Category $index',
              publishedAt: '2025-01-01',
              tags: ['Tag1', 'Tag2'],
              updatedAt: '2025-01-01',
              cursor: 'cursor_$index',
              image: 'assets/images/applogo.jpg',
              price: 29.99 + index,
            ));
  }

  static Product fromGraphJson(Map<String, dynamic> json) {
    return Product(
      id: json['node']?['id'] ?? '',
      title: json['node']?['title'] ?? '',
      availableForSale: json['node']?['availableForSale'],
      createdAt: json['node']?['createdAt'],
      description: json['node']?['description'] ?? '',
      descriptionHtml: json['node']?['descriptionHtml'] ?? '',
      handle: json['node']?['handle'] ?? '',
      onlineStoreUrl: json['node']?['onlineStoreUrl'] ?? '',
      productType: json['node']?['productType'] ?? '',
      publishedAt: json['node']?['publishedAt'],
      tags: _getTags(json),
      updatedAt: json['node']?['updatedAt'],
      cursor: json['cursor'],
      image: json['node']?['image']?['src'] ?? '',
      price: double.tryParse(json['node']?['price']?.toString() ?? '0.0'),
    );
  }

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    availableForSale = bool.parse(json['availableForSale'].toString());
    createdAt = json['createdAt'];
    productType = json['productType'];
    publishedAt = json['publishedAt'];
    tags = _getTags(json);
    updatedAt = json['updatedAt'];
    vendor = json['vendor'];
    cursor = json['cursor'];
    onlineStoreUrl = json['onlineStoreUrl'] ?? " ";
    description = json['description'];
    descriptionHtml = json['descriptionHtml'];
    handle = json['handle'];
    image = json['image'] ?? "";
    price = double.tryParse(json['price']?.toString() ?? '0.0');
  }

  Map<String, dynamic> toJson() => {
        'id': '$id',
        'title': '$title',
        'availableForSale': '$availableForSale',
        'createdAt': '$createdAt',
        'description': '$description',
        'descriptionHtml': '$descriptionHtml',
        'handle': '$handle',
        'onlineStoreUrl': '$onlineStoreUrl',
        'productType': '$productType',
        'publishedAt': '$publishedAt',
        'tags': tags!.map((element) => element).toList(),
        'updatedAt': '$updatedAt',
        'cursor': '$cursor',
        'vendor': '$vendor',
        'image': '$image',
        'price': '$price',
      };

  factory Product.toJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      availableForSale: json['availableForSale'],
      createdAt: json['createdAt'],
      description: json['description'] ?? '',
      descriptionHtml: json['descriptionHtml'] ?? '',
      handle: json['handle'] ?? '',
      onlineStoreUrl: json['onlineStoreUrl'] ?? '',
      productType: json['productType'] ?? '',
      publishedAt: json['publishedAt'],
      tags: _getTags(json),
      updatedAt: json['updatedAt'],
      cursor: json['cursor'],
      image: json['image'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0.0'),
    );
  }

  static List<String> _getTags(Map<String, dynamic> json) {
    List<String> tags = [];
    if (json['node']?['tags'] == null) return tags;
    json['node']?['tags']?.forEach((e) => tags.add(e ?? const {}));
    return tags;
  }
}
