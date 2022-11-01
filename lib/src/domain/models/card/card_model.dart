class CardModel {
  const CardModel({
    required this.cardUrlImage,
    this.cardTitle,
    this.cardDescription,
  });

  final String cardUrlImage;
  final String? cardTitle;
  final String? cardDescription;
}
