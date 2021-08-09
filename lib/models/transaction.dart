class Transaction {
  final int id;
  final String name;
  final double price;
  final DateTime date;

  Transaction({
    required this.date,
    required this.id,
    required this.name,
    required this.price,
  });
}
