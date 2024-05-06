import 'package:flutter/foundation.dart';

class HuntingFilterPayload {
  HuntingFilterPayload({
    this.priceFrom,
    this.priceTo,
    this.rentalFrom,
    this.rentalTo,
    this.amenities,
    this.nutritions,
    this.tip,
  });
  final num? priceFrom;
  final num? priceTo;
  final DateTime? rentalFrom;
  final DateTime? rentalTo;
  final Set<String>? amenities;
  final Set<String>? nutritions;
  final Set<String>? tip;

  HuntingFilterPayload copyWith({
    int? floor,
    num? size,
    num? priceFrom,
    num? priceTo,
    DateTime? rentalFrom,
    DateTime? rentalTo,
    Set<String>? amenities,
    Set<String>? nutritions,
    Set<String>? tip,
  }) {
    return HuntingFilterPayload(
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      rentalFrom: rentalFrom ?? this.rentalFrom,
      rentalTo: rentalTo ?? this.rentalTo,
      amenities: amenities ?? this.amenities,
      nutritions: nutritions ?? this.nutritions,
      tip: tip ?? this.tip,
    );
  }

  // initial
  static HuntingFilterPayload initial() {
    return HuntingFilterPayload();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HuntingFilterPayload &&
        other.priceFrom == priceFrom &&
        other.priceTo == priceTo &&
        other.rentalFrom == rentalFrom &&
        other.rentalTo == rentalTo &&
        setEquals(other.amenities, amenities) &&
        setEquals(other.nutritions, nutritions) &&
        setEquals(other.tip, tip);
  }

  int get filterCount => [
        priceFrom,
        priceTo,
        rentalFrom,
        rentalTo,
        amenities,
        nutritions,
        tip,
      ].where((element) => element != null).length;
}
