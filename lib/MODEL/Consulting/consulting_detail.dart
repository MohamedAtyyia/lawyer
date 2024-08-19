class ConsultingDetail {
  String? consultingId;
  String? requestNo;
  String? requestStatus;
  String? orderStatus;
  String? delegationStatus;
  String? requestText;
  String? requestDocument;
  String? requestDocument2;
  String? requestDocument3;
  String? requestDocument4;
  String? requestDocument5;
  String? imageOne;
  String? imageTwo;
  String? imageThree;
  String? imageFour;
  String? imageFive;
  String? requestAudio;
  String? requestType;
  String? createdBy;
  String? userId;
  String? userFirstName;
  String? userFamilyName;
  String? userImage;
  String? userEmail;
  String? lawyerName;
  String? lawyerImage;
  String? consultingTypeId;
  String? consultingType;
  String? mainConsultingId;
  String? mainConsultingName;
  String? subConsultingId;
  String? subConsultingName;
  String? consultingPeriod;
  String? consultingVatvalue;
  String? consultingDateAndTime;
  String? noOfOffers;
  String? createdDate;
  String? notes;
  int? currentState;
  String? proposedCustomerPay;
  String? serviceId;
  String? serviceName;
  String? unDefinedSubConsultingName;

  ConsultingDetail({
    this.consultingId,
    this.requestNo,
    this.requestStatus,
    this.orderStatus,
    this.delegationStatus,
    this.requestText,
    this.createdBy,
    this.requestDocument,
    this.requestDocument2,
    this.requestDocument3,
    this.requestDocument4,
    this.requestDocument5,
    this.imageOne,
    this.imageTwo,
    this.imageThree,
    this.imageFour,
    this.imageFive,
    this.requestAudio,
    this.requestType,
    this.userId,
    this.userFirstName,
    this.userFamilyName,
    this.userImage,
    this.userEmail,
    this.lawyerName,
    this.lawyerImage,
    this.consultingTypeId,
    this.consultingType,
    this.mainConsultingId,
    this.mainConsultingName,
    this.subConsultingId,
    this.subConsultingName,
    this.consultingPeriod,
    this.consultingVatvalue,
    this.consultingDateAndTime,
    this.noOfOffers,
    this.createdDate,
    this.notes,
    this.currentState,
    this.proposedCustomerPay,
    this.serviceId,
    this.serviceName,
    this.unDefinedSubConsultingName,
  });

  ConsultingDetail.fromJson(Map<String, dynamic> json) {
    consultingId = json['consultingId'];
    requestNo = json['requestNo'];
    createdBy = json['createdBy'];
    requestStatus = json['requestStatus'];
    orderStatus = json['orderStatus'];
    delegationStatus = json['delegationStatus'];
    requestText = json['requestText'];
    requestDocument = json['requestDocument'];
    requestDocument2 = json['requestDocument2'];
    requestDocument3 = json['requestDocument3'];
    requestDocument4 = json['requestDocument4'];
    requestDocument5 = json['requestDocument5'];
    imageOne = json['imageOne'];
    imageTwo = json['imageTwo'];
    imageThree = json['imageThree'];
    imageFour = json['imageFour'];
    imageFive = json['imageFive'];
    requestAudio = json['requestAudio'];
    requestType = json['requestType'];
    userId = json['userId'];
    userFirstName = json['userFirstName'];
    userFamilyName = json['userFamilyName'];
    userImage = json['userImage'];
    userEmail = json['userEmail'];
    lawyerName = json['lawyerName'];
    lawyerImage = json['lawyerImage'];
    consultingTypeId = json['consultingTypeId'];
    consultingType = json['consultingType'];
    mainConsultingId = json['mainConsultingId'];
    mainConsultingName = json['mainConsultingName'];
    subConsultingId = json['subConsultingId'];
    subConsultingName = json['subConsultingName'];
    consultingPeriod = json['consultingPeriod'];
    consultingVatvalue = json['consultingVatvalue'];
    consultingDateAndTime = json['consultingDateAndTime'];
    noOfOffers = json['noOfOffers'];
    createdDate = json['createdDate'];
    notes = json['notes'];
    currentState = json['currentState'];
    proposedCustomerPay = json['proposedCustomerPay'];
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    unDefinedSubConsultingName = json['unDefinedSubConsultingName'];
  }
}
