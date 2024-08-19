class SearchResult {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? userFirstName;
  String? userFamilyName;
  String? userId;
  String? userPhone;
  String? userImage;
  String? notes;
  String? mainConsultingName;
  String? subConsultingName;
  String? createdDate;
  String? proposedCustomerPay;
  String? unDefinedSubConsultingName;

  SearchResult({
    this.consultingId,
    this.requestNo,
    this.requestStatus,
    this.userFirstName,
    this.userFamilyName,
    this.userId,
    this.userPhone,
    this.userImage,
    this.notes,
    this.mainConsultingName,
    this.subConsultingName,
    this.createdDate,
    this.proposedCustomerPay,
    this.unDefinedSubConsultingName,
  });

  SearchResult.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    requestStatus = json['requestStatus'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userId = json['userId'];
    userPhone = json['userPhone'];
    userImage = json['userImage'];
    notes = json['notes'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingName = json['subConsultingName'];
    createdDate = json['createdDate'];
    proposedCustomerPay = json['proposedCustomerPay'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
  }
}
