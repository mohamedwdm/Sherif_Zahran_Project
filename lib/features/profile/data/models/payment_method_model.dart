class PaymentMethodModel {
  final String id;
  final String type; // Visa, Mastercard, Apple Pay
  final String lastFour;
  final String expiryDate;
  final bool isDefault;

  PaymentMethodModel({
    required this.id,
    required this.type,
    required this.lastFour,
    required this.expiryDate,
    required this.isDefault,
  });
}
