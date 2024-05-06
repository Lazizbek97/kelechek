// ignore_for_file: inference_failure_on_collection_literal

import 'dart:convert';

List<KindergardenMd> kindergardenMdFromJson(String str) =>
    List<KindergardenMd>.from(
      (json.decode(str) as List)
          .map((e) => KindergardenMd.fromJson(e as Map<String, dynamic>)),
    );

String kindergardenMdToJson(List<KindergardenMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KindergardenMd {
  KindergardenMd({
    this.name,
    this.address,
    this.location,
    this.groups,
    this.price,
    this.description,
    this.ageFilters,
    this.seasonFilters,
    this.images,
    this.contact,
  });

  factory KindergardenMd.fromJson(Map<String, dynamic> json) => KindergardenMd(
        name: json['name'] as String?,
        address: json['address'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        groups: json['groups'] as Map<String, dynamic>?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        ageFilters: json['age_filters'] == null
            ? []
            : List<String>.from((json['age_filters'] as List).map((e) => e)),
        seasonFilters: json['season_filters'] == null
            ? []
            : List<String>.from((json['season_filters'] as List).map((e) => e)),
        images: json['images'] == null
            ? []
            : List<String>.from(
                (json['images'] as List).map((e) => e),
              ),
        contact: json['contact'] == null
            ? []
            : List<Contact>.from(
                (json['contact'] as List)
                    .map((e) => Contact.fromJson(e as Map<String, dynamic>)),
              ),
      );
  final String? name;
  final String? address;
  final Location? location;
  final Map<String, dynamic>? groups;
  final int? price;
  final String? description;
  final List<String>? ageFilters;
  final List<String>? seasonFilters;
  final List<String>? images;
  final List<Contact>? contact;

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'location': location?.toJson(),
        'groups': groups,
        'price': price,
        'description': description,
        'age_filters': ageFilters == null
            ? []
            : List<dynamic>.from(ageFilters!.map((x) => x)),
        'season_filters': seasonFilters == null
            ? []
            : List<dynamic>.from(seasonFilters!.map((x) => x)),
        'images':
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        'contact': contact == null
            ? []
            : List<dynamic>.from(contact!.map((x) => x.toJson())),
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
