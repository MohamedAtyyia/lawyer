class CanceledConsultingModel {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userImage;
  String? notes;
  String? mainConsultingName;
  String? subConsultingName;
  String? createdBy;
  String? createdDate;
  String? timeRemainingForConsultingToStart;
  String? lawyerId;
  String? lawyerName;
  String? lawyerImage;
  String? proposedCustomerPay;
  String? unDefinedSubConsultingName;

  CanceledConsultingModel(
      {this.consultingId,
      this.requestNo,
      this.requestStatus,
      this.userFirstName,
      this.userFamilyName,
      this.userImage,
      this.notes,
      this.mainConsultingName,
      this.subConsultingName,
      this.createdBy,
      this.createdDate,
      this.timeRemainingForConsultingToStart,
      this.lawyerId,
      this.lawyerName,
      this.lawyerImage,
      this.unDefinedSubConsultingName,
      this.proposedCustomerPay});

  CanceledConsultingModel.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userImage = json['userImage'];
    notes = json['notes'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingName = json['subConsultingName'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    timeRemainingForConsultingToStart =
        json['timeRemainingForConsultingToStart'];
    lawyerId = json['lawyerId'];
    lawyerName = json['lawyerName'];
    lawyerImage = json['lawyerImage'];
    proposedCustomerPay = json['proposedCustomerPay'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
  }
}
