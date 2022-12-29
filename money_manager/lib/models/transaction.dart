class Transaction {
  final double value;
  final String title;
  final String description;
  DateTime date = DateTime.now();

  Transaction({
    required this.value,
    required this.title,
    required this.description,
  });
}
