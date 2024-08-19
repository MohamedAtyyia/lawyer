class PrivacyPolicyModel {
  String? policiesAndPrivacyId;
  String? policiesAndPrivacyTitle;
  String? policiesAndPrivacyDescription;
  String? policiesAndPrivacyForWhom;
  String? createdDate;
  int? currentState;

  PrivacyPolicyModel(
      {this.policiesAndPrivacyId,
      this.policiesAndPrivacyTitle,
      this.policiesAndPrivacyDescription,
      this.policiesAndPrivacyForWhom,
      this.createdDate,
      this.currentState});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    policiesAndPrivacyId = json['policiesAndPrivacyId'];
    policiesAndPrivacyTitle = json['policiesAndPrivacyTitle'];
    policiesAndPrivacyDescription = json['policiesAndPrivacyDescription'];
    policiesAndPrivacyForWhom = json['policiesAndPrivacyForWhom'];
    createdDate = json['createdDate'];
    currentState = json['currentState'];
  }
}