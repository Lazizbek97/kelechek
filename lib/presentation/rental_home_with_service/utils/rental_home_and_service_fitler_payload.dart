import 'package:flutter/foundation.dart';

class RentalHomeServiceFilterPayload {
  RentalHomeServiceFilterPayload({
    this.floor,
    this.size,
    this.priceFrom,
    this.priceTo,
    this.rentalFrom,
    this.rentalTo,
    this.amenities,
    this.roomLevel,
  });
  final int? floor;
  final num? size;
  final num? priceFrom;
  final num? priceTo;
  final DateTime? rentalFrom;
  final DateTime? rentalTo;
  final Set<String>? amenities;
  final String? roomLevel;

  RentalHomeServiceFilterPayload copyWith({
    int? floor,
    num? size,
    num? priceFrom,
    num? priceTo,
    DateTime? rentalFrom,
    DateTime? rentalTo,
    Set<String>? amenities,
    Set<String>? nutritions,
    Set<String>? services,
    String? roomLevel,
  }) {
    return RentalHomeServiceFilterPayload(
      floor: floor ?? this.floor,
      size: size ?? this.size,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      rentalFrom: rentalFrom ?? this.rentalFrom,
      rentalTo: rentalTo ?? this.rentalTo,
      amenities: amenities ?? this.amenities,
      roomLevel: roomLevel??this.roomLevel,
    );
  }

  // initial
  static RentalHomeServiceFilterPayload initial() {
    return RentalHomeServiceFilterPayload();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RentalHomeServiceFilterPayload &&
        other.floor == floor &&
        other.size == size &&
        other.priceFrom == priceFrom &&
        other.priceTo == priceTo &&
        other.rentalFrom == rentalFrom &&
        other.rentalTo == rentalTo &&
        setEquals(other.amenities, amenities) &&
        other.roomLevel == roomLevel;
  }

  int get filterCount => [
        floor,
        size,
        priceFrom,
        priceTo,
        rentalFrom,
        rentalTo,
        amenities,
        roomLevel,
      ].where((element) => element != null).length;
}
