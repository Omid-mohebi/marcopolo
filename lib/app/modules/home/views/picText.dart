class PicText {
  String url;
  String name;

  PicText(this.url, this.name);

  static List<PicText> generate() {
    return [
      PicText("assets/images/2.jpg", "Japan"),
      PicText("assets/images/13.jpg", "Franch"),
      PicText("assets/images/7.jpeg", "Paris"),
      PicText("assets/images/2.jpg", "London"),
      // PicText("assets/images/5.jpg", "China"),
    ];
  }
}
