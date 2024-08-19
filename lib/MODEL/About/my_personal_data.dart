class MyPersonalDataModel {
  String? consultingNo;
  String? daysOfWork;
  String? hoursOfWork;
  bool? isApprovedOffice;
  String? mainConsultingId;
  String? mainConsultingName;
  String? evaluationNoOfStatrs;
  String? identityId;
  String? evaluationNumerical;
  String? yearsOfExperience;
  String? documentA;
  String? documentB;
  String? documentC;
  String? documentD;
  String? identityDocument;
  String? shortDescription;
  String? cost;
  String? otp;
  String? image;
  String? firstName;
  String? familyName;
  String? userType;
  String? status;
  String? roleId;
  String? role;
  String? roleList;
  String? roleList2;
  String? roleList3;
  String? roleListMain;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  bool? isActivated;
  String? deviceToken;
  int? accessFailedCount;

  MyPersonalDataModel(
      {this.consultingNo,
      this.daysOfWork,
      this.hoursOfWork,
      this.mainConsultingId,
      this.isApprovedOffice,
      this.mainConsultingName,
      this.evaluationNoOfStatrs,
      this.evaluationNumerical,
      this.yearsOfExperience,
      this.documentA,
      this.documentB,
      this.documentC,
      this.documentD,
      this.identityId,
      this.identityDocument,
      this.shortDescription,
      this.cost,
      this.otp,
      this.image,
      this.isActivated,
      this.firstName,
      this.familyName,
      this.userType,
      this.status,
      this.roleId,
      this.role,
      this.roleList,
      this.roleList2,
      this.roleList3,
      this.roleListMain,
      this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.deviceToken,
      this.accessFailedCount});

  MyPersonalDataModel.fromJson(Map<String, dynamic> json) {
    consultingNo = json['consultingNo'];
    daysOfWork = json['daysOfWork'];
    hoursOfWork = json['hoursOfWork'];
    mainConsultingId = json['mainConsultingId'];
    mainConsultingName = json['mainConsultingName'];
    evaluationNoOfStatrs = json['evaluationNoOfStatrs'];
    evaluationNumerical = json['evaluationNumerical'];
    yearsOfExperience = json['yearsOfExperience'];
    documentA = json['documentA'];
    documentB = json['documentB'];
    documentC = json['documentC'];
    documentD = json['documentD'];
    identityDocument = json['identityDocument'];
    shortDescription = json['shortDescription'];
    cost = json['cost'];
    otp = json['otp'];
    image = json['image'];
    firstName = json['firstName'];
    familyName = json['familyName'];
    userType = json['userType'];
    status = json['status'];
    roleId = json['roleId'];
    isApprovedOffice = json['isApprovedOffice'];
    role = json['role'];
    roleList = json['roleList'];
    roleList2 = json['roleList2'];
    roleList3 = json['roleList3'];
    roleListMain = json['roleListMain'];
    id = json['id'];
    identityId = json['identityId'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
    deviceToken = json['deviceToken'];
    isActivated = json['isActivated'];
  }
}
