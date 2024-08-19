class AboutAppModel {
  String? aboutAppId;
  String? aboutAppTitle;
  String? aboutAppDescription;
  String? aboutAppForWhom;
  AboutAppModel(
      {this.aboutAppId,
      this.aboutAppTitle,
      this.aboutAppDescription,
      this.aboutAppForWhom,
     });
  AboutAppModel.fromJson(Map<String, dynamic> json) {
    aboutAppId = json['aboutAppId'];
    aboutAppTitle = json['aboutAppTitle'];
    aboutAppDescription = json['aboutAppDescription'];
    aboutAppForWhom = json['aboutAppForWhom'];
  }
}