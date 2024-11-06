class ProductRatingModel {
  final double rating;
  final int count;

  ProductRatingModel({required this.rating, required this.count});

  factory ProductRatingModel.fromJson(jsonData) {
    return ProductRatingModel(
      rating: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
