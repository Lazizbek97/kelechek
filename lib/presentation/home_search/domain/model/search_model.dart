class SearchModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String pageId;
  num? price;
  Object? data;
  SearchModel(this.description, this.id, this.image, this.name, this.pageId, {this.data, this.price});
}
