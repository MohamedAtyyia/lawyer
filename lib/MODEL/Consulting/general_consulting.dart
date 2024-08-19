class GeneralConsultingModel {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userImage;
  String? notes;
  String? mainConsultingName;
  String? subConsultingName;
  String? createdDate;
  String? timeRemainingForConsultingToStart;
  String? createdBy;
  String? unDefinedSubConsultingName;
  String? proposedCustomerPay;

  GeneralConsultingModel(
      {this.consultingId,
      this.requestNo,
      this.requestStatus,
      this.userFirstName,
      this.userFamilyName,
      this.userImage,
      this.notes,
      this.mainConsultingName,
      this.subConsultingName,
      this.unDefinedSubConsultingName,
      this.createdDate,
      this.timeRemainingForConsultingToStart,
      this.proposedCustomerPay,
      this.createdBy});

  GeneralConsultingModel.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userImage = json['userImage'];
    notes = json['notes'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingName = json['subConsultingName'];
    createdDate = json['createdDate'];
    timeRemainingForConsultingToStart =
        json['timeRemainingForConsultingToStart'];
    createdBy = json['createdBy'];
    proposedCustomerPay = json['proposedCustomerPay'];
  }
}
