class CategoriesModel{
  final String categoryId;
  final String categoryImg;
  final String categoryName;
  final dynamic createdAt;
  final dynamic updatedAt;

  CategoriesModel({
    required this.categoryId,
    required this.categoryImg,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,});



  // Serialize the CategoriesModel instance to a JSON map
 Map<String,dynamic> toMap(){
    return{
      "categoryId" : categoryId,
      "categoryImg":categoryImg,
      "categoryName":categoryName,
      "createdAt":createdAt,
      "updatedAt" :updatedAt
    };
 }


  //create categoriesModel instance from a JSON map
factory CategoriesModel.fromMap(Map<String,dynamic> json){
    return CategoriesModel(
      categoryId: json["categoryId"],
      categoryImg: json["categoryImg"],
      categoryName: json["categoryName"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]
    );
}

}