import 'package:flutter/foundation.dart';

class OfficeFilterPayload {
  OfficeFilterPayload({
    this.floor,
    this.size,
    this.priceFrom,
    this.priceTo,
    this.rentalFrom,
    this.rentalTo,
    this.amenities,
  });
  final int? floor;
  final num? size;
  final num? priceFrom;
  final num? priceTo;
  final DateTime? rentalFrom;
  final DateTime? rentalTo;
  final Set<String>? amenities;

  OfficeFilterPayload copyWith({
    int? floor,
    num? size,
    num? priceFrom,
    num? priceTo,
    DateTime? rentalFrom,
    DateTime? rentalTo,
    Set<String>? amenities,
  }) {
    return OfficeFilterPayload(
      floor: floor ?? this.floor,
      size: size ?? this.size,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      rentalFrom: rentalFrom ?? this.rentalFrom,
      rentalTo: rentalTo ?? this.rentalTo,
      amenities: amenities ?? this.amenities,
    );
  }

  // initial
  static OfficeFilterPayload initial() {
    return OfficeFilterPayload();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfficeFilterPayload &&
        other.floor == floor &&
        other.size == size &&
        other.priceFrom == priceFrom &&
        other.priceTo == priceTo &&
        other.rentalFrom == rentalFrom &&
        other.rentalTo == rentalTo &&
        setEquals(other.amenities, amenities);
  }

  int get filterCount => [
        floor,
        size,
        priceFrom,
        priceTo,
        rentalFrom,
        rentalTo,
        amenities,
      ].where((element) => element != null).length;
}
