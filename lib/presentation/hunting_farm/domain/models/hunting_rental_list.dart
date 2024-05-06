// ignore_for_file: inference_failure_on_collection_literal

import 'dart:convert';

List<RentalHuntingMd> rentalHousesListMdFromJson(String str) =>
    List<RentalHuntingMd>.from(
      (json.decode(str) as List)
          .map((e) => RentalHuntingMd.fromJson(e as Map<String, dynamic>)),
    );

String rentalHousesListMdToJson(List<RentalHuntingMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentalHuntingMd {
  RentalHuntingMd({
    this.name,
    this.price,
    this.currency,
    this.occupancy,
    this.roomType,
    this.checkIn,
    this.checkOut,
    this.amenities,
    this.services,
    this.images,
    this.contact,
    this.description,
    this.address,
    this.roomSize,
    this.tips,
    this.nutritions,
  });

  factory RentalHuntingMd.fromJson(Map<String, dynamic> json) =>
      RentalHuntingMd(
        name: json['name'] as String?,
        price: json['price'] as int?,
        currency: json['currency'] as String?,
        occupancy: json['occupancy'] as int?,
        roomType: json['room_type'] as String?,
        checkIn: json['check_in'] == null
            ? null
            : DateTime.parse(json['check_in'] as String),
        checkOut: json['check_out'] == null
            ? null
            : DateTime.parse(json['check_out'] as String),
        amenities: json['amenities'] == null
            ? []
            : List<Amenity>.from(
                (json['amenities'] as List)
                    .map((e) => Amenity.fromJson(e as Map<String, dynamic>)),
              ),
        services: json['services'] == null
            ? []
            : List<Amenity>.from(
                (json['services'] as List)
                    .map((e) => Amenity.fromJson(e as Map<String, dynamic>)),
              ),
        images: json['images'] == null
            ? []
            : List<String>.from((json['images'] as List).map((x) => x)),
        contact: json['contact'] == null
            ? []
            : List<Contact>.from(
                (json['contact'] as List)
                    .map((e) => Contact.fromJson(e as Map<String, dynamic>)),
              ),
        description: json['description'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        roomSize: json['room_size'] as String?,
        tips: json['tips'] == null
            ? []
            : List<Amenity>.from(
                (json['tips'] as List)
                    .map((e) => Amenity.fromJson(e as Map<String, dynamic>)),
              ),
        nutritions: json['nutritions'] == null
            ? []
            : List<Amenity>.from(
                (json['nutritions'] as List)
                    .map((e) => Amenity.fromJson(e as Map<String, dynamic>)),
              ),
      );
  final String? name;
  final int? price;
  final String? currency;
  final int? occupancy;
  final String? roomType;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final List<Amenity>? amenities;
  final List<Amenity>? services;
  final List<String>? images;
  final List<Contact>? contact;
  final String? description;
  final Address? address;
  final String? roomSize;
  final List<Amenity>? tips;
  final List<Amenity>? nutritions;

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'currency': currency,
        'occupancy': occupancy,
        'room_type': roomType,
        'check_in':
            "${checkIn!.year.toString().padLeft(4, '0')}-${checkIn!.month.toString().padLeft(2, '0')}-${checkIn!.day.toString().padLeft(2, '0')}",
        'check_out':
            "${checkOut!.year.toString().padLeft(4, '0')}-${checkOut!.month.toString().padLeft(2, '0')}-${checkOut!.day.toString().padLeft(2, '0')}",
        'amenities': amenities == null
            ? []
            : List<dynamic>.from(amenities!.map((x) => x.toJson())),
        'services': services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        'images':
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        'contact': contact == null
            ? []
            : List<dynamic>.from(contact!.map((x) => x.toJson())),
        'description': description,
        'address': address?.toJson(),
        'room_size': roomSize,
        'tips': tips == null
            ? []
            : List<dynamic>.from(tips!.map((x) => x.toJson())),
        'nutritions': nutritions == null
            ? []
            : List<dynamic>.from(nutritions!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.name,
    this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json['name'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
      );
  final String? name;
  final Location? location;

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location?.toJson(),
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
      );
  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

class Amenity {
  Amenity({
    this.id,
    this.name,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );
  final String? id;
  final String? name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Contact {
  Contact({
    this.type,
    this.number,
    this.link,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        type: json['type'] as String?,
        number: json['number'] as String?,
        link: json['link'] as String?,
      );
  final String? type;
  final String? number;
  final String? link;

  Map<String, dynamic> toJson() => {
        'type': type,
        'number': number,
        'link': link,
      };
}
