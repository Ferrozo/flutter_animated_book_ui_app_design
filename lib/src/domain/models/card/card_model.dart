class CardModel {
  const CardModel({
    required this.cardUrlImage,
    this.cardTitle,
    this.cardDescription,
    // required this.distance,
  });

  final String cardUrlImage;
  final String? cardTitle;
  final String? cardDescription;
  // final String distance;
}
