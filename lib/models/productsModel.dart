
class ProductsModel {
final dynamic updatedAt;
final num fullPrice;
  final String productDescription;
  final String categoryId;
  final String categoryName;
  final dynamic createdAt;
  final String deliveryTime;
  final bool isSale;
  final num price;
  final String productId;
  final List<dynamic> productImages;
  final String productName;

  ProductsModel({
    required this.fullPrice,required this.updatedAt,
    required this.productDescription,
    required this.categoryName,
    required this.createdAt,
    required this.categoryId,
    required this.deliveryTime,
    required this.isSale,
    required this.price,
    required this.productId,
    required this.productImages,
    required this.productName,
  });

  Map<String, dynamic> toMap() {
    return {
      "updatedAt":updatedAt,
      "fullPrice":fullPrice,
      "categoryName": categoryName,
      "createdAt": createdAt,
      "categoryId": categoryId,
      "deliveryTime": deliveryTime,
      "isSale": isSale,
      "price": price,
      "productId": productId,
      "productImages": productImages,
      "productName": productName,
      "productDescription":productDescription,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> json) {
    return ProductsModel(
      fullPrice:json["fullPrice"],
      updatedAt:json["updatedAt"],
      productDescription:json["productDescription"],
      categoryName: json["categoryName"],
      createdAt: json["createdAt"],
      categoryId: json["categoryId"],
      deliveryTime: json["deliveryTime"],
      isSale: json["isSale"],
      price: json["price"],
      productId: json["productId"],
      productImages: json["productImages"],
      productName: json["productName"],
    );
  }
}
