class ProductModel {
  String? productName;
  int? price;
  String? description;
  String? imageUrl;
  bool? isAvailable;
  List<String>? materials;

  ProductModel({
    this.productName,
    this.price,
    this.description,
    this.isAvailable,
    this.materials,
    this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    description = json['description'];
    isAvailable = json['is_available'];
    imageUrl = json['image_url'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['price'] = price;
    data['description'] = description;
    data['is_available'] = isAvailable;
    data['materials'] = materials;
    data['image_url'] = imageUrl;
    return data;
  }
}
