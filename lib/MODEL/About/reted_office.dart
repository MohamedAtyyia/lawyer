class RatedOfficeModel {
  String? evaluationId;
  String? evaluaterId;
  String? toBeEvaluatedId;
  String? evaluationText;
  String? startsNo;
  String? consultationServiceId;
  String? evaluaterImage;
  String? toBeEvaluatedImage;
  String? createdBy;
  String? updatedBy;
  String? createdDate;
  String? notes;
  int? currentState;

  RatedOfficeModel(
      {this.evaluationId,
      this.evaluaterId,
      this.toBeEvaluatedId,
      this.evaluationText,
      this.startsNo,
      this.consultationServiceId,
      this.evaluaterImage,
      this.toBeEvaluatedImage,
      this.createdBy,
      this.updatedBy,
      this.createdDate,
      this.notes,
      this.currentState});

  RatedOfficeModel.fromJson(Map<String, dynamic> json) {
    evaluationId = json['evaluationId'];
    evaluaterId = json['evaluaterId'];
    toBeEvaluatedId = json['toBeEvaluatedId'];
    evaluationText = json['evaluationText'];
    startsNo = json['startsNo'];
    consultationServiceId = json['consultationServiceId'];
    evaluaterImage = json['evaluaterImage'];
    toBeEvaluatedImage = json['toBeEvaluatedImage'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdDate = json['createdDate'];
    notes = json['notes'];
    currentState = json['currentState'];
  }
}