class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/van.jpg"},
  {"image": "assets/images/van2.jpg"},
  {"image": "assets/images/van3.jpeg"},
];
