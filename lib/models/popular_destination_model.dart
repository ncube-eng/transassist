class PopularDestinationModel {
  String name;
  String country;
  String image;

  PopularDestinationModel(this.name, this.country, this.image);
}

List<PopularDestinationModel> populars = popularsData
    .map((item) =>
        PopularDestinationModel(item['name'], item['country'], item['image']))
    .toList();

var popularsData = [
  {"name": "Harare", "country": "Zimbabwe", "image": "assets/images/Harare-0602.jpg"},
  {"name": "Bulawayo", "country": "Zimbabwe", "image": "assets/images/Zimbabwe-Bulawayo_resize.jpg"},
  {"name":"Gweru","country":"Zimbabwe","image":"assets/images/Gweru.jpg"}
];
