class Image {
  Image({
    this.image,
  });

  var image;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
    image: json["image"] == null ? null : json["image"],
  );


}