class MainConsultingModel {
  String? mainConsultingId;
  String? mainConsultingTitle;
  String? mainConsultingImage;
  String? notes;
  MainConsultingModel(
      {this.mainConsultingId,
      this.mainConsultingTitle,
      this.mainConsultingImage,
      this.notes,
      });

  MainConsultingModel.fromJson(Map<String, dynamic> json) {
    mainConsultingId = json['mainConsultingId'];
    mainConsultingTitle = json['mainConsultingTitle'];
    mainConsultingImage = json['mainConsultingImage'];
    notes = json['notes'];
  }
}