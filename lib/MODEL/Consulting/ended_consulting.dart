class EndedConsultingModel {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userImage;
  String? notes;
  String? userId;
  String? mainConsultingName;
  String? subConsultingName;
  String? noOfOffers;
  String? createdBy;
  String? createdDate;
  String? timeRemainingForConsultingToStart;
  String? lawyerId;
  String? lawyerName;
  String? lawyerImage;
  String? unDefinedSubConsultingName;
  String? proposedCustomerPay;

  EndedConsultingModel(
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
      this.noOfOffers,
      this.createdBy,
      this.createdDate,
      this.timeRemainingForConsultingToStart,
      this.lawyerId,
      this.lawyerName,
      this.lawyerImage,
      this.unDefinedSubConsultingName,
      this.proposedCustomerPay});

  EndedConsultingModel.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userId = json['userId'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userImage = json['userImage'];
    notes = json['notes'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingName = json['subConsultingName'];
    noOfOffers = json['noOfOffers'];
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
