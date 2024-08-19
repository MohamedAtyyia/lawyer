class CurrentConsulting {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userId;
  String? userFirstName;
  String? userFamilyName;
  String? userPhone;
  String? userImage;
  String? propsedTimeFinishConsultFormatted;
  String? consultingDateAndTime;
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
  String? lstOffers;
  String? proposedCustomerPay;
  String? unDefinedSubConsultingName;
  String? propsedTimeFinishConsult;

  CurrentConsulting(
      {this.consultingId,
      this.requestNo,
      this.requestStatus,
      this.userId,
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
      this.propsedTimeFinishConsultFormatted,
      this.lawyerImage,
      this.consultingDateAndTime,
      this.lstOffers,
      this.proposedCustomerPay,
      this.propsedTimeFinishConsult,
      this.unDefinedSubConsultingName});

  CurrentConsulting.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userId = json['userId'];
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
    consultingDateAndTime = json['consultingDateAndTime'];
    lawyerName = json['lawyerName'];
    lawyerImage = json['lawyerImage'];
    propsedTimeFinishConsultFormatted =
        json['propsedTimeFinishConsultFormatted'];
    lstOffers = json['lstOffers'];
    proposedCustomerPay = json['proposedCustomerPay'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
    propsedTimeFinishConsult = json['propsedTimeFinishConsult'];
  }
}
