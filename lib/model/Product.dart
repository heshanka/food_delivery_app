class Product {
  Product(this.id, this.name, this.description, this.price, this.categoryId,
      this.imgURL, this.available, this.heroTag);

  int id;
  String name;
  String description;
  double price;
  int categoryId;
  String imgURL;
  bool available;
  String heroTag;
}
