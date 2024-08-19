class PrivateConsultingModel {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userImage;
  String? userId;
  String? notes;
  String? mainConsultingName;
  String? subConsultingName;
  String? createdDate;
  String? propsedTimeFinishConsultFormatted;
  String? timeRemainingForConsultingToStart;
  String? createdBy;
  String? lawyerId;
  String? unDefinedSubConsultingName;
  String? proposedCustomerPay;
  String? consultingDateAndTime;

  PrivateConsultingModel(
      {this.consultingId,
      this.requestNo,
      this.userId,
      this.requestStatus,
      this.userFirstName,
      this.userFamilyName,
      this.userImage,
      this.notes,
      this.mainConsultingName,
      this.subConsultingName,
      this.propsedTimeFinishConsultFormatted,
      this.createdDate,
      this.consultingDateAndTime,
      this.timeRemainingForConsultingToStart,
      this.unDefinedSubConsultingName,
      this.proposedCustomerPay,
      this.createdBy,
      this.lawyerId});

  PrivateConsultingModel.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userImage = json['userImage'];
    notes = json['notes'];
    userId = json['userId'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingName = json['subConsultingName'];
    createdDate = json['createdDate'];
    timeRemainingForConsultingToStart =
        json['timeRemainingForConsultingToStart'];
    createdBy = json['createdBy'];
    propsedTimeFinishConsultFormatted =
        json['propsedTimeFinishConsultFormatted'];
    lawyerId = json['lawyerId'];
    proposedCustomerPay = json['proposedCustomerPay'];
    consultingDateAndTime = json['consultingDateAndTime'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
  }
}
