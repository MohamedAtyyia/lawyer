class DelegationRequestModel {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userPhone;
  String? userImage;
  String? notes;
  String? mainConsultingName;
  String? subConsultingName;
  String? noOfOffers;
  String? createdBy;
  String? createdDate;
  String? timeRemainingForConsultingToStart;
  String? lawyerId;
  String? lawyerName;
  String? lawyerImage;
  String? proposedCustomerPay;
  String? unDefinedSubConsultingName;

  DelegationRequestModel(
      {this.consultingId,
      this.requestNo,
      this.requestStatus,
      this.userFirstName,
      this.userFamilyName,
      this.userPhone,
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
      this.proposedCustomerPay,
      this.unDefinedSubConsultingName});

  DelegationRequestModel.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userPhone = json['userPhone'];
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
