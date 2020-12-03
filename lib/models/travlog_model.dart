class TravlogModel {
  String name;
  String content;
  String place;
  String image;

  TravlogModel(this.name, this.content, this.place, this.image);
}

List<TravlogModel> travlogs = travlogsData
    .map((item) =>
    TravlogModel(item['name'], item['content'], item['place'], item['image']))
    .toList();

var travlogsData = [
  {
    "name": "\"Nkosilomusa!\"",
    "content": "Halo guys, Just made a succesful booking this is WOOOW",
    "place": "Khezi, Zimbabwe",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "name": "\"Moyo Ambrose\"",
    "content": "Halo guys, This is indeed fantastic",
    "place": "Plumtre Zimbabwe",
    "image": "assets/images/travlog_yogyakarta.png"
  },


];