import 'package:flutter/foundation.dart';

class RentalHomeFilterPayload {
  RentalHomeFilterPayload({
    this.floor,
    this.size,
    this.priceFrom,
    this.priceTo,
    this.rentalFrom,
    this.rentalTo,
    this.amenities,
    this.nutritions,
    this.services,
  });
  final int? floor;
  final num? size;
  final num? priceFrom;
  final num? priceTo;
  final DateTime? rentalFrom;
  final DateTime? rentalTo;
  final Set<String>? amenities;
  final Set<String>? nutritions;
  final Set<String>? services;

  RentalHomeFilterPayload copyWith({
    int? floor,
    num? size,
    num? priceFrom,
    num? priceTo,
    DateTime? rentalFrom,
    DateTime? rentalTo,
    Set<String>? amenities,
    Set<String>? nutritions,
    Set<String>? services,
  }) {
    return RentalHomeFilterPayload(
      floor: floor ?? this.floor,
      size: size ?? this.size,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      rentalFrom: rentalFrom ?? this.rentalFrom,
      rentalTo: rentalTo ?? this.rentalTo,
      amenities: amenities ?? this.amenities,
      nutritions: nutritions ?? this.nutritions,
      services: services ?? this.services,
    );
  }

  // initial
  static RentalHomeFilterPayload initial() {
    return RentalHomeFilterPayload();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RentalHomeFilterPayload &&
        other.floor == floor &&
        other.size == size &&
        other.priceFrom == priceFrom &&
        other.priceTo == priceTo &&
        other.rentalFrom == rentalFrom &&
        other.rentalTo == rentalTo &&
        setEquals(other.amenities, amenities) &&
        setEquals(other.nutritions, nutritions) &&
        setEquals(other.services, services);
  }

  int get filterCount => [
        floor,
        size,
        priceFrom,
        priceTo,
        rentalFrom,
        rentalTo,
        amenities,
        nutritions,
        services,
      ].where((element) => element != null).length;
}
