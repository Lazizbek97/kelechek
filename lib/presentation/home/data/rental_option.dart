enum RentalType { kyal, vityaz, vzmore, yasli, oxotni }

class RentalOption {
  RentalOption({
    required this.title,
    required this.description,
    required this.typeName,
    required this.imagePath,
    required this.type,
  });

  final String title;
  final String description;
  final String typeName;
  final String imagePath;
  final RentalType type;
}
